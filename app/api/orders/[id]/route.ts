import { NextRequest, NextResponse } from "next/server"
import prisma from "@/lib/prisma"

export async function GET(
  request: NextRequest,
  { params }: { params: { id: string } }
) {
  try {
    // Lấy session token từ cookie hoặc header
    const sessionToken = request.cookies.get("session_token")?.value || 
                        request.headers.get("authorization")?.replace("Bearer ", "")

    if (!sessionToken) {
      return NextResponse.json({ 
        error: "Bạn cần đăng nhập để xem chi tiết đơn hàng" 
      }, { status: 401 })
    }

    // Tìm user bằng remember_token
    const user = await prisma.users.findFirst({
      where: { 
        remember_token: sessionToken,
        isactive: 1
      },
      select: {
        id: true,
        username: true,
        email: true
      }
    })

    if (!user) {
      return NextResponse.json({ 
        error: "Token không hợp lệ hoặc user không tồn tại" 
      }, { status: 401 })
    }

    const orderId = await params.id

    // Tìm đơn hàng theo inv_code và user_id
    const order = await prisma.product_order.findFirst({
      where: {
        inv_code: orderId,
        user_id: Number(user.id) // Chỉ lấy order của user đã đăng nhập
      }
    })

    if (!order) {
      return NextResponse.json(
        { error: "Không tìm thấy đơn hàng hoặc bạn không có quyền xem đơn hàng này" },
        { status: 404 }
      )
    }

    // Lấy chi tiết đơn hàng
    const orderDetails = await prisma.product_orderdetail.findMany({
      where: { order_id: order.id }
    })

    // Lấy thông tin sản phẩm cho các item trong order
    const productIds = orderDetails.map(item => item.product_id)
    const products = await prisma.product_pro.findMany({
      where: { id: { in: productIds.map(id => BigInt(id)) } },
      select: {
        id: true,
        title: true,
        image: true
      }
    })

    // Tạo map để tìm sản phẩm nhanh
    const productMap = new Map(products.map(p => [Number(p.id), p]))

    // Tạo timeline dựa trên status
    const getTimelineFromStatus = (status: string) => {
      const timeline = [
        {
          title: "Đơn hàng đã được tạo",
          description: "Đơn hàng của bạn đã được tiếp nhận",
          date: order.created_at,
          completed: true
        }
      ]

      if (status === "Duyệt" || status === "Đang giao" || status === "Đã giao") {
        timeline.push({
          title: "Đơn hàng đã được duyệt",
          description: "Đơn hàng đang được chuẩn bị",
          date: order.updated_at,
          completed: true
        })
      }

      if (status === "Đang giao" || status === "Đã giao") {
        timeline.push({
          title: "Đang giao hàng",
          description: "Đơn hàng đang được vận chuyển",
          date: order.shipped_at,
          completed: true
        })
      }

      if (status === "Đã giao") {
        timeline.push({
          title: "Giao hàng thành công",
          description: "Đơn hàng đã được giao thành công",
          date: order.deliverydate,
          completed: true
        })
      }

      return timeline
    }

    // Helper function để map payment status
    const getPaymentStatus = (status: string) => {
      return status === "1" ? "paid" : "unpaid"
    }

    const result = {
      id: order.inv_code,
      status: order.status,
      date: order.created_at,
      total: order.totalamount,
      subtotal: order.subtotal,
      shipping: order.transportfee,
      tax: order.taxvat,
      paymentStatus: getPaymentStatus(order.payment_status),
      paymentMethod: order.payment_method,
      estimatedDelivery: order.estimated_delivery,
      actualDelivery: order.deliverydate,
      customer: {
        name: order.fullname,
        email: order.email,
        phone: order.phone,
        address: order.address
      },
      items: orderDetails.map(item => {
        const product = productMap.get(item.product_id)
        return {
          id: item.product_id,
          name: product ? product.title : `Sản phẩm ${item.product_id}`,
          image: product ? product.image : "/placeholder.svg",
          quantity: item.quantity,
          price: item.price,
          total: item.price * item.quantity
        }
      }),
      timeline: getTimelineFromStatus(order.status)
    }

    return NextResponse.json(result)
  } catch (error) {
    console.error("Error fetching order:", error)
    return NextResponse.json(
      { error: "Không thể lấy thông tin đơn hàng" },
      { status: 500 }
    )
  }
}
