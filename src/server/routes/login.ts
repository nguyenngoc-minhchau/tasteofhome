import { prisma } from '@/src/server/lib/prisma'
import { comparePassword } from '@/src/server/utils/hash'
import { NextResponse } from 'next/server'
import { randomBytes } from 'crypto'

// Handle login and set session token cookie
export async function handleLogin(req: Request) {
  const { email, password } = await req.json()
  console.log('Login API called:', email)

  try {
    const user = await prisma.users.findFirst({ 
      where: { 
        email,
        isactive: 1
      } 
    })
    
    if (!user) {
      return NextResponse.json({ 
        message: 'Email hoặc mật khẩu không đúng.' 
      }, { status: 401 })
    }

    const isValid = await comparePassword(password, user.password)
    if (!isValid) {
      return NextResponse.json({ 
        message: 'Email hoặc mật khẩu không đúng.' 
      }, { status: 401 })
    }

    // Tạo remember_token mới
    const rememberToken = randomBytes(32).toString('hex')
    
    // Cập nhật remember_token trong database
    await prisma.users.update({
      where: { id: user.id },
      data: { 
        remember_token: rememberToken,
        updated_at: new Date()
      }
    })

    const userId = typeof user.id === 'bigint' ? user.id.toString() : user.id
    const userRole = user.role ?? 'customer'

    const response = NextResponse.json({
      message: 'Đăng nhập thành công!',
      user: {
        id: userId,
        email: user.email,
        role: userRole,
        name: user.name,
        username: user.username,
      },
    })

    // Set session token cookie
    response.cookies.set('session_token', rememberToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      path: '/',
      sameSite: 'lax',
      maxAge: 30 * 24 * 60 * 60, // 30 days
    })

    return response
  } catch (error) {
    console.error('Login error:', error)
    return NextResponse.json({ 
      message: 'Có lỗi xảy ra khi đăng nhập.' 
    }, { status: 500 })
  }
}
