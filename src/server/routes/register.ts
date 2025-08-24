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

// Helper: tạo username từ name
function generateUsername(name: string, email: string): string {
  // Lấy phần trước @ của email
  const emailPrefix = email.split('@')[0]
  
  // Tạo username từ name, loại bỏ dấu và khoảng trắng
  const cleanName = name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '') // Loại bỏ dấu
    .replace(/[^a-z0-9]/g, '') // Chỉ giữ chữ cái và số
  
  // Kết hợp name và email prefix
  let username = cleanName
  if (cleanName.length < 3) {
    username = cleanName + emailPrefix.slice(0, 3)
  }
  
  // Đảm bảo username có ít nhất 3 ký tự
  if (username.length < 3) {
    username = emailPrefix.slice(0, 3) + cleanName
  }
  
  return username
}

export async function handleRegister(req: Request) {
  try {
    console.log('Register API called')
    
    const { email, password, name } = await req.json()
    console.log('Register data received:', { email, name, passwordLength: password?.length })

    // Kiem tra cac truong bat buoc
    if (!email || !password || !name) {
      console.log('Missing required fields:', { email: !!email, password: !!password, name: !!name })
      return NextResponse.json({ error: 'Thiếu thông tin bắt buộc.' }, { status: 400 })
    }

    console.log('Checking existing user...')
    const existingUser = await prisma.users.findFirst({
      where: { email },
      select: { id: true, email: true },
    })

    if (existingUser) {
      console.log('Email already exists:', email)
      return NextResponse.json({ error: 'Email đã được đăng ký' }, { status: 400 })
    }

    console.log('Validating password strength...')
    if (!isStrongPassword(password)) {
      return NextResponse.json(
        {
          error:
            'Mật khẩu phải có ít nhất 6 ký tự.',
        },
        { status: 400 }
      )
    }

    console.log('Hashing password...')
    const hashedPassword = await hashPassword(password)
    
    // Tạo username tự động
    console.log('Generating username...')
    let username = generateUsername(name, email)
    let counter = 1
    
    // Kiểm tra username có bị trùng không
    while (true) {
      const existingUsername = await prisma.users.findFirst({
        where: { username },
        select: { id: true },
      })
      
      if (!existingUsername) {
        break
      }
      
      username = generateUsername(name, email) + counter.toString()
      counter++
      
      // Tránh vòng lặp vô hạn
      if (counter > 100) {
        username = email.split('@')[0] + Date.now().toString().slice(-4)
        break
      }
    }

    console.log('Creating user in database...')
    const newUser = await prisma.users.create({
      data: {
        email,
        name,
        username,
        password: hashedPassword,
        role: 'customer',
        isactive: 1,
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

    console.log('User created successfully:', newUser.id)

    // Chuyển BigInt -> string trước khi trả về
    const publicUser = replaceBigInt(newUser)

    return NextResponse.json(
      { message: 'Đăng ký tài khoản thành công', user: publicUser },
      { status: 201 }
    )
  } catch (error) {
    console.error('Register error:', error)
    
    // Xử lý lỗi Prisma cụ thể
    if (error && typeof error === 'object' && 'code' in error) {
      const prismaError = error as any
      if (prismaError.code === 'P2002') {
        return NextResponse.json({ 
          error: 'Email hoặc username đã tồn tại' 
        }, { status: 400 })
      }
      if (prismaError.code === 'P1001') {
        return NextResponse.json({ 
          error: 'Không thể kết nối đến database' 
        }, { status: 500 })
      }
    }
    
    return NextResponse.json({ 
      error: 'Lỗi server nội bộ: ' + (error instanceof Error ? error.message : 'Unknown error') 
    }, { status: 500 })
  }
}