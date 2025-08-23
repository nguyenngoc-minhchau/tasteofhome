import { prisma } from '@/src/server/lib/prisma'
import { hashPassword } from '@/src/server/utils/hash'
import { isStrongPassword } from '@/src/server/utils/validatePassword'
import { NextResponse } from 'next/server'

// Helper: chuyển BigInt -> string (deep)
function replaceBigInt<T>(data: T): T {
  if (data === null || data === undefined) return data
  if (typeof data === 'bigint') return (data.toString() as unknown) as T
  if (Array.isArray(data)) return (data.map(replaceBigInt) as unknown) as T
  if (typeof data === 'object') {
    return Object.fromEntries(
      Object.entries(data as Record<string, unknown>).map(([k, v]) => [k, replaceBigInt(v)])
    ) as T
  }
  return data
}

export async function handleRegister(req: Request) {
  const { email, password, name, username } = await req.json()

  // Kiem tra cac truong bat buoc
  if (!email || !password || !name || !username) {
    return NextResponse.json({ error: 'Missing required fields.' }, { status: 400 })
  }

  try {
    const existingUser = await prisma.users.findFirst({
      where: { OR: [{ email }, { username }] },
      select: { id: true, email: true, username: true }, // chỉ lấy cần thiết
    })

    if (existingUser) {
      if (existingUser.email === email) {
        return NextResponse.json({ error: 'Email already registered' }, { status: 400 })
      }
      if (existingUser.username === username) {
        return NextResponse.json({ error: 'Username already taken' }, { status: 400 })
      }
    }

    if (!isStrongPassword(password)) {
      return NextResponse.json(
        {
          error:
            'Password must be at least 8 characters long and include an uppercase letter, a lowercase letter, a number, and a special character.',
        },
        { status: 400 }
      )
    }

    const hashedPassword = await hashPassword(password)

    const newUser = await prisma.users.create({
      data: {
        email,
        name,
        username,
        password: hashedPassword,
        role: 'customer',
        created_at: new Date(),
        updated_at: new Date(),
      },
      // chỉ lấy field public, không lấy password
      select: {
        id: true,
        email: true,
        name: true,
        username: true,
        role: true,
        created_at: true,
        updated_at: true,
      },
    })

    // Chuyển BigInt -> string trước khi trả về
    const publicUser = replaceBigInt(newUser)

    return NextResponse.json(
      { message: 'User registered successfully', user: publicUser },
      { status: 201 }
    )
  } catch (error) {
    console.error('Register error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
