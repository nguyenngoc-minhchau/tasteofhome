import { NextRequest, NextResponse } from "next/server"
import prisma from "@/lib/prisma"

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const {
      items,
      shippingInfo,
      paymentInfo,
      orderSummary
    } = body

    // Tạo mã đơn hàng duy nhất
    const orderCode = `ORD${Date.now()}${Math.random().toString(36).substr(2, 5).toUpperCase()}`
    
    // Tạo đơn hàng chính
    const order = await prisma.product_order.create({
      data: {
        inv_id: Math.floor(Math.random() * 1000) + 1, // Tạm thời random
        invcode: orderCode.substring(0, 7),
        inv_code: orderCode,
        fullname: `${shippingInfo.firstName} ${shippingInfo.lastName}`,
        address: shippingInfo.address,
        sendingaddress: shippingInfo.address,
        company: null,
        email: shippingInfo.email,
        phone: shippingInfo.phone || "",
        content: null,
        totalcost: Math.round(orderSummary.total * 100), // Chuyển về cent
        totalamount: orderSummary.total,
        discount: orderSummary.discount || 0,
        subtotal: orderSummary.subtotal,
        payment_at: new Date(),
        transportfee: orderSummary.shipping,
        taxvat: orderSummary.tax,
        user_id: 1, // Tạm thời hardcode, sau này sẽ lấy từ session
        agent_id: null,
        voucher: null,
        npp: null,
        daily: null,
        ctv: null,
        commission_npp: null,
        commission_daily: null,
        estimated_delivery: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000), // 7 ngày sau
        status: "Mới", // Trạng thái ban đầu
        shipped_at: new Date(0), // Chưa ship
        out_for_delivery_at: new Date(0), // Chưa out for delivery
        deliverydate: null, // Chưa giao
        payment_status: "1", // Đã thanh toán
        payment_method: paymentInfo.paymentMethod || "Credit Card",
        created_at: new Date(),
        updated_at: new Date()
      }
    })

    // Tạo chi tiết đơn hàng
    const orderDetails = await Promise.all(
      items.map(async (item: any) => {
        return await prisma.product_orderdetail.create({
          data: {
            order_id: order.id,
            stock_id: 1, // Tạm thời
            product_id: item.id,
            capacity_id: 1, // Tạm thời
            quantity: item.quantity,
            price: item.price,
            commission_daily: 0,
            commission_npp: 0,
            commission_ctv: 0,
            price_im: null,
            pro_status: 1, // Tạm thời
            delivery_date: null
          }
        })
      })
    )

    // Tạo lịch sử đơn hàng
    await prisma.product_order_history.create({
      data: {
        order_id: order.id,
        amount: order.totalamount,
        user_id: 1, // Tạm thời
        notes: "Đơn hàng mới được tạo",
        created_at: new Date(),
        updated_at: new Date()
      }
    })

    return NextResponse.json({
      success: true,
      orderId: order.inv_code,
      message: "Đơn hàng đã được tạo thành công"
    })

  } catch (error) {
    console.error("Error creating order:", error)
    return NextResponse.json(
      { 
        success: false, 
        message: "Có lỗi xảy ra khi tạo đơn hàng" 
      },
      { status: 500 }
    )
  }
}
