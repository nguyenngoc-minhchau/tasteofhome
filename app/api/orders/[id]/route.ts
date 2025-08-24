import { prisma } from '@/lib/prisma'
import { NextResponse } from 'next/server'

export async function GET(
  req: Request,
  context: { params: { id: string } }
) {
  const { id } = await context.params

  try {
    // Lấy thông tin đơn hàng
    const order = await prisma.product_order.findFirst({
      where: { inv_code: id },
    })

    if (!order) {
      return NextResponse.json({ error: 'Order not found' }, { status: 404 })
    }

    // Lấy chi tiết sản phẩm
    const orderDetails = await prisma.product_orderdetail.findMany({
      where: { order_id: order.id },
    })

    // Lấy thông tin sản phẩm từ bảng product_pro
    const productIds = orderDetails.map(detail => detail.product_id)
    const products = await prisma.product_pro.findMany({
      where: { id: { in: productIds.map(id => BigInt(id)) } },
      select: { id: true, title: true, image: true }
    })

    // Tạo map để truy cập nhanh thông tin sản phẩm
    const productMap = new Map(products.map(p => [Number(p.id), p]))

    // Timeline dựa trên trạng thái thực tế từ database
    const getTimelineFromStatus = (orderStatus: string) => {
      const baseTimeline = [
        {
          status: "Đặt hàng",
          date: order.created_at?.toISOString(),
          description: "Đơn hàng đã được tiếp nhận và đang xử lý",
          completed: true,
        },
        {
          status: "Xác nhận thanh toán",
          date: order.payment_at?.toISOString() || "",
          description: "Thanh toán đã được xử lý thành công",
          completed: !!order.payment_at,
        },
        {
          status: "Đang giao hàng",
          date: order.shipped_at?.toISOString() || "",
          description: "Đơn hàng đang được vận chuyển",
          completed: !!order.shipped_at,
        },
        {
          status: "Đang giao",
          date: order.out_for_delivery_at?.toISOString() || "",
          description: "Gói hàng đang được giao",
          completed: !!order.out_for_delivery_at,
        },
        {
          status: "Đã giao hàng",
          date: order.deliverydate?.toISOString() || "",
          description: "Gói hàng đã được giao thành công",
          completed: !!order.deliverydate,
        },
      ]

      // Cập nhật trạng thái hoàn thành dựa trên trạng thái đơn hàng
      if (orderStatus === "Mới" || orderStatus === "Duyệt") {
        baseTimeline[0].completed = true
        baseTimeline[1].completed = !!order.payment_at
        baseTimeline[2].completed = false
        baseTimeline[3].completed = false
        baseTimeline[4].completed = false
      } else if (orderStatus === "Đang giao") {
        baseTimeline[0].completed = true
        baseTimeline[1].completed = true
        baseTimeline[2].completed = true
        baseTimeline[3].completed = !!order.out_for_delivery_at
        baseTimeline[4].completed = false
      } else if (orderStatus === "Đã giao") {
        baseTimeline[0].completed = true
        baseTimeline[1].completed = true
        baseTimeline[2].completed = true
        baseTimeline[3].completed = true
        baseTimeline[4].completed = true
      } else if (orderStatus === "Hủy") {
        baseTimeline.forEach(step => step.completed = false)
        baseTimeline[0].completed = true
      }

      return baseTimeline
    }

    const timeline = getTimelineFromStatus(order.status)

    // Xử lý payment status
    const getPaymentStatus = (paymentStatus: string) => {
      if (paymentStatus === "1" || paymentStatus === "paid") return "paid"
      if (paymentStatus === "0" || paymentStatus === "unpaid") return "unpaid"
      return paymentStatus
    }

    return NextResponse.json({
      id: order.inv_code,
      date: order.created_at?.toISOString(),
      status: order.status,
      paymentStatus: getPaymentStatus(order.payment_status),
      paymentMethod: order.payment_method || "Chưa xác định",
      total: order.totalamount,
      subtotal: order.subtotal,
      shipping: order.transportfee,
      tax: order.taxvat,
      items: orderDetails.map((item) => ({
        id: item.product_id,
        name: productMap.get(item.product_id)?.title || `Product ${item.product_id}`,
        image: productMap.get(item.product_id)?.image || null,
        quantity: item.quantity,
        price: item.price,
      })),
      estimatedDelivery: order.estimated_delivery?.toISOString(),
      actualDelivery: order.deliverydate?.toISOString(),
      shippingAddress: {
        name: order.fullname || "",
        address: order.address || "",
      },
      timeline,
    })
  } catch (error) {
    console.error('Failed to fetch order:', error)
    return NextResponse.json({ error: 'Server error' }, { status: 500 })
  }
}
