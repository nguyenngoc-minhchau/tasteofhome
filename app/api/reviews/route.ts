import { NextResponse } from 'next/server'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

// Convert BigInt values to numbers safely for JSON serialization
function convertBigInt(obj: any) {
  return JSON.parse(
    JSON.stringify(obj, (_, value) =>
      typeof value === 'bigint' ? Number(value) : value
    )
  )
}

// Helpers chuyển kiểu dữ liệu an toàn
const toBigInt = (value: unknown): bigint => {
  if (typeof value === 'bigint') return value
  if (typeof value === 'number') return BigInt(value)
  if (typeof value === 'string') return BigInt(value)
  throw new Error('Invalid BigInt input')
}

const toNumber = (value: unknown): number => {
  if (typeof value === 'number') return value
  if (typeof value === 'string') return parseInt(value, 10)
  if (typeof value === 'bigint') return Number(value)
  throw new Error('Invalid Number input')
}

// GET: Lấy reviews của sản phẩm theo product_id query param
export async function GET(req: Request) {
  try {
    const { searchParams } = new URL(req.url)
    const product_id = searchParams.get('product_id')
    if (!product_id)
      return NextResponse.json({ message: 'Missing product_id' }, { status: 400 })
    
    const productIdBigInt = toBigInt(product_id)

    const reviews = await prisma.tbl_reviews.findMany({
      where: {
        product_id: productIdBigInt,
        isactive: 1,
      },
      orderBy: {
        created_at: 'desc',
      },
      select: {
        id: true,
        product_id: true,
        user_id: true,
        star_id: true,
        title: true,
        brief: true,
        image: true,
        created_at: true,
      },
    })

    const safeReviews = convertBigInt(reviews)
    return NextResponse.json(safeReviews)
  } catch (error) {
    console.error('Error fetching reviews:', error)
    return NextResponse.json({ message: 'Internal Server Error' }, { status: 500 })
  } finally {
    await prisma.$disconnect()
  }
}

// POST: Tạo review mới
export async function POST(req: Request) {
  try {
    const body = await req.json()
    const { product_id, user_id, star_id, title, brief, image } = body

    // Sửa chỗ này: bắt buộc user_id phải có
    if (!product_id || !user_id || !star_id || !title)
      return NextResponse.json({ message: 'Missing required fields' }, { status: 400 })

    const starNumber = toNumber(star_id)
    if (starNumber < 1 || starNumber > 5)
      return NextResponse.json({ message: 'Invalid star rating' }, { status: 400 })

    const newReview = await prisma.tbl_reviews.create({
      data: {
        product_id: toBigInt(product_id),
        user_id: toBigInt(user_id),  // Bắt buộc user_id ko null => ép trực tiếp BigInt
        star_id: starNumber,
        title,
        brief,
        image,
        isactive: 1,
        priority: 1,
        created_at: new Date(),
      },
    })

    const safeReview = convertBigInt(newReview)
    return NextResponse.json(safeReview)
  } catch (error) {
    console.error('Error creating review:', error)
    return NextResponse.json({ message: 'Internal Server Error' }, { status: 500 })
  } finally {
    await prisma.$disconnect()
  }
}

