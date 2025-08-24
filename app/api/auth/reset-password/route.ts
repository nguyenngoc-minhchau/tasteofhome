import { NextRequest, NextResponse } from 'next/server'
import prisma from '@/lib/prisma'

export async function POST(request: NextRequest) {
  try {
    const { email } = await request.json()

    if (!email) {
      return NextResponse.json({ 
        error: 'Email là bắt buộc' 
      }, { status: 400 })
    }

    // Kiểm tra email có tồn tại không
    const user = await prisma.users.findFirst({
      where: { 
        email,
        isactive: 1
      },
      select: { id: true, email: true, name: true }
    })

    if (!user) {
      // Không trả về lỗi để tránh lộ thông tin user
      return NextResponse.json({ 
        message: 'Nếu email tồn tại, chúng tôi sẽ gửi link reset mật khẩu' 
      })
    }

    // TODO: Gửi email reset mật khẩu thực sự
    // Hiện tại chỉ trả về thông báo thành công
    console.log(`Reset password requested for email: ${email}`)

    return NextResponse.json({ 
      message: 'Nếu email tồn tại, chúng tôi sẽ gửi link reset mật khẩu' 
    })
  } catch (error) {
    console.error('Reset password error:', error)
    return NextResponse.json({ 
      error: 'Có lỗi xảy ra khi xử lý yêu cầu reset mật khẩu' 
    }, { status: 500 })
  }
}
