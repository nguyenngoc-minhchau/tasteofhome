import { NextRequest, NextResponse } from 'next/server'
import prisma from '@/lib/prisma'

export async function POST(request: NextRequest) {
  try {
    const sessionToken = request.cookies.get("session_token")?.value

    if (sessionToken) {
      // Xóa remember_token trong database
      await prisma.users.updateMany({
        where: { remember_token: sessionToken },
        data: { remember_token: null }
      })
    }

    const response = NextResponse.json({ 
      message: 'Đăng xuất thành công' 
    })

    // Xóa session token cookie
    response.cookies.set('session_token', '', {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      path: '/',
      sameSite: 'lax',
      maxAge: 0,
    })

    return response
  } catch (error) {
    console.error('Logout error:', error)
    return NextResponse.json({ 
      message: 'Có lỗi xảy ra khi đăng xuất' 
    }, { status: 500 })
  }
}
