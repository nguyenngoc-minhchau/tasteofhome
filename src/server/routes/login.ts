import * as jwt from 'jsonwebtoken'
import { prisma } from '@/src/server/lib/prisma'
import { comparePassword } from '@/src/server/utils/hash'
import { NextResponse } from 'next/server'

const JWT_SECRET = process.env.JWT_SECRET
if (!JWT_SECRET) {
  throw new Error('Missing JWT_SECRET environment variable')
}

// Handle login and set token cookie
export async function handleLogin(req: Request) {
  const { email, password } = await req.json()
  console.log('Login API called:', email)

  const user = await prisma.users.findFirst({ where: { email } })
  if (!user) {
    return NextResponse.json({ message: 'Invalid credentials: user not found.' }, { status: 401 })
  }

  const isValid = await comparePassword(password, user.password)
  if (!isValid) {
    return NextResponse.json({ message: 'Invalid credentials: incorrect password.' }, { status: 401 })
  }

  const userId = typeof user.id === 'bigint' ? user.id.toString() : user.id
  const userRole = user.role ?? 'customer'

  const token = jwt.sign({ userId, role: userRole }, JWT_SECRET, { expiresIn: '1h' })

  const response = NextResponse.json({
    message: 'Login successful!',
    user: {
      id: userId,
      email: user.email,
      role: userRole,
      name: user.name,
      username: user.username,
    },
  })

  // Set HttpOnly token cookie (secure, sameSite)
  response.cookies.set('token', token, {
    httpOnly: true,
    secure: true,
    path: '/',
    sameSite: 'strict',
    maxAge: 3600,
  })

  return response
}
