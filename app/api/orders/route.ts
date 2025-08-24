import { NextRequest, NextResponse } from "next/server"
import prisma from "@/lib/prisma"

// GET /api/orders
export async function GET(request: NextRequest) {
  try {
    // Lấy session token từ cookie hoặc header
    const sessionToken = request.cookies.get("session_token")?.value || 
                        request.headers.get("authorization")?.replace("Bearer ", "")

    if (!sessionToken) {
      return NextResponse.json({ 
        error: "Bạn cần đăng nhập để xem đơn hàng" 
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

    const userId = user.id

    // Lấy orders của user đã đăng nhập
    const orders = await prisma.product_order.findMany({
      where: {
        user_id: Number(userId) // Chuyển BigInt sang Number
      },
      orderBy: { created_at: "desc" },
      take: 50,
      select: {
        id: true,
        inv_code: true,
        fullname: true,
        email: true,
        phone: true,
        address: true,
        status: true,
        totalamount: true,
        subtotal: true,
        transportfee: true,
        taxvat: true,
        payment_status: true,
        payment_method: true,
        created_at: true,
        updated_at: true,
        estimated_delivery: true,
        deliverydate: true
      }
    })

    const results = orders.map((order) => ({
      id: order.inv_code,
      fullname: order.fullname,
      email: order.email,
      phone: order.phone,
      address: order.address,
      status: order.status,
      total: order.totalamount,
      subtotal: order.subtotal,
      shipping: order.transportfee,
      tax: order.taxvat,
      paymentStatus: order.payment_status,
      paymentMethod: order.payment_method,
      created_at: order.created_at,
      updated_at: order.updated_at,
      estimatedDelivery: order.estimated_delivery,
      actualDelivery: order.deliverydate
    }))

    return NextResponse.json(results)
  } catch (error) {
    console.error("Error fetching orders:", error)
    return NextResponse.json(
      { error: "Không thể lấy danh sách đơn hàng" },
      { status: 500 }
    )
  }
}
