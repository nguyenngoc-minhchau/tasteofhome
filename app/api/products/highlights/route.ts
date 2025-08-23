import { NextResponse } from 'next/server'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

function convertBigInt(obj: any) {
  return JSON.parse(
    JSON.stringify(obj, (_, value) =>
      typeof value === 'bigint' ? Number(value) : value
    )
  )
}

export async function GET() {
  try {
    const [hotProducts, newProducts] = await Promise.all([
      prisma.product_pro.findMany({
        where: { isactive: 1, ishot: 1 },
        orderBy: { priority: 'desc' },
        select: {
          id: true,
          title: true,
          image: true,
          price: true,
          price_discount: true,
          re_name: true,
        },
      }),
      prisma.product_pro.findMany({
        where: { isactive: 1, isnew: 1 },
        orderBy: { created_at: 'desc' },
        select: {
          id: true,
          title: true,
          image: true,
          price: true,
          price_discount: true,
          re_name: true,
        },
      }),
    ])

    const safeHot = convertBigInt(hotProducts)
    const safeNew = convertBigInt(newProducts)

    return NextResponse.json({
      hot: safeHot,
      new: safeNew,
    })
  } catch (error) {
    console.error('Error fetching highlights:', error)
    return NextResponse.json({ message: 'Internal Server Error' }, { status: 500 })
  } finally {
    await prisma.$disconnect()
  }
}
