// File: app/api/auth/validate-session/route.ts
import { NextRequest, NextResponse } from "next/server"
import prisma from "@/lib/prisma"

export async function GET(request: NextRequest) {
  try {
    // Lấy session token từ cookie hoặc header
    const sessionToken = request.cookies.get("session_token")?.value || 
                        request.headers.get("authorization")?.replace("Bearer ", "")

    if (!sessionToken) {
      return NextResponse.json({ 
        isAuthenticated: false, 
        message: "Không tìm thấy session token" 
      }, { status: 401 })
    }

    // Tìm user bằng remember_token
    const user = await prisma.users.findFirst({
      where: { 
        remember_token: sessionToken,
        isactive: 1 // Chỉ user đang active
      },
      select: {
        id: true,
        username: true,
        email: true,
        name: true,
        isadmin: true,
        role: true
      }
    })

    if (!user) {
      return NextResponse.json({ 
        isAuthenticated: false, 
        message: "Token không hợp lệ hoặc user không tồn tại" 
      }, { status: 401 })
    }

    // Xác định role chính xác
    let finalRole = user.role || "customer"
    
    // Nếu isadmin = 1, override role thành admin
    if (user.isadmin === 1) {
      finalRole = "admin"
    }

    // Chuyển BigInt id thành string
    const userWithStringId = {
      ...user,
      id: user.id.toString(),
      role: finalRole
    }

    return NextResponse.json({
      isAuthenticated: true,
      user: userWithStringId,
      message: "Xác thực thành công"
    })

  } catch (error) {
    console.error("Error validating session:", error)
    return NextResponse.json({ 
      isAuthenticated: false, 
      message: "Lỗi xác thực session" 
    }, { status: 500 })
  }
}
