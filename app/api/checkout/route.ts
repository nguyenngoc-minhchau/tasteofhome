import { NextRequest, NextResponse } from "next/server"
import prisma from "@/lib/prisma"

export async function POST(request: NextRequest) {
  try {
    // Lấy session token từ cookie hoặc header
    const sessionToken = request.cookies.get("session_token")?.value || 
                        request.headers.get("authorization")?.replace("Bearer ", "")

    if (!sessionToken) {
      return NextResponse.json({ 
        success: false,
        message: "Bạn cần đăng nhập để đặt hàng" 
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
        success: false,
        message: "Token không hợp lệ hoặc user không tồn tại" 
      }, { status: 401 })
    }

    const body = await request.json()
    const {
      items,
      shippingInfo,
      paymentInfo,
      orderSummary
    } = body

    // Validate required fields
    if (!items || !Array.isArray(items) || items.length === 0) {
      return NextResponse.json({
        success: false,
        message: "Giỏ hàng không được để trống"
      }, { status: 400 })
    }

    // Validate và log kiểu dữ liệu của items
    console.log("Items data:", JSON.stringify(items, null, 2))
    
    for (const item of items) {
      if (!item.id || !item.quantity || !item.price) {
        return NextResponse.json({
          success: false,
          message: "Dữ liệu sản phẩm không hợp lệ"
        }, { status: 400 })
      }
      
      // Log kiểu dữ liệu của từng field
      console.log(`Item ${item.id}:`, {
        id: { value: item.id, type: typeof item.id },
        quantity: { value: item.quantity, type: typeof item.quantity },
        price: { value: item.price, type: typeof item.price }
      })
    }

    if (!shippingInfo || !shippingInfo.firstName || !shippingInfo.lastName || !shippingInfo.email || !shippingInfo.address) {
      return NextResponse.json({
        success: false,
        message: "Vui lòng điền đầy đủ thông tin giao hàng"
      }, { status: 400 })
    }

    // Tạo mã đơn hàng duy nhất
    const orderCode = `ORD${Date.now()}${Math.random().toString(36).substr(2, 5).toUpperCase()}`
    
    // Xác định trạng thái thanh toán dựa trên phương thức
    let paymentStatus = "1" // Mặc định là đã thanh toán
    let orderStatus = "Mới"
    
    if (paymentInfo.paymentMethod === "Cash on Delivery") {
      paymentStatus = "0" // Chưa thanh toán
      orderStatus = "Chờ thanh toán"
    } else if (paymentInfo.paymentMethod === "Bank Transfer") {
      paymentStatus = "0" // Chưa thanh toán (chờ xác nhận)
      orderStatus = "Chờ xác nhận thanh toán"
    } else if (paymentInfo.paymentMethod === "E-wallet") {
      paymentStatus = "0" // Chưa thanh toán (chờ xác nhận)
      orderStatus = "Chờ xác nhận thanh toán"
    }
    // Credit Card mặc định là đã thanh toán (paymentStatus = "1")

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
        transportfee: Math.round(orderSummary.shipping * 100), // Chuyển về cent
        taxvat: orderSummary.tax,
        user_id: Number(user.id), // Sử dụng ID của user đã đăng nhập
        agent_id: null,
        voucher: null,
        npp: null,
        daily: null,
        ctv: null,
        commission_npp: null,
        commission_daily: null,
        estimated_delivery: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000), // 7 ngày sau
        status: orderStatus, // Trạng thái dựa trên phương thức thanh toán
        shipped_at: new Date(0), // Chưa ship
        out_for_delivery_at: new Date(0), // Chưa out for delivery
        deliverydate: null, // Chưa giao
        payment_status: paymentStatus, // Trạng thái thanh toán dựa trên phương thức
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
            product_id: Number(item.id), // Chuyển đổi sang number
            capacity_id: 1, // Tạm thời
            quantity: Number(item.quantity), // Đảm bảo là number
            price: Number(item.price), // Đảm bảo là number
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
        user_id: Number(user.id), // Sử dụng ID của user đã đăng nhập
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
    
    // Log chi tiết lỗi để debug
    if (error instanceof Error) {
      console.error("Error details:", error.message)
      console.error("Error stack:", error.stack)
    }
    
    return NextResponse.json(
      { 
        success: false, 
        message: "Có lỗi xảy ra khi tạo đơn hàng: " + (error instanceof Error ? error.message : "Unknown error")
      },
      { status: 500 }
    )
  }
}
