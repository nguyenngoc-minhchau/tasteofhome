import { NextResponse } from 'next/server'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export async function GET() {
  try {
    const prices = await prisma.product_pro.findMany({
      where: { isactive: 1 },
      select: {
        price: true,
        price_discount: true,
      },
    })

    const allPrices = prices.map(p => Number(p.price))
    const minPrice = Math.min(...allPrices)
    const maxPrice = Math.max(...allPrices)

    return NextResponse.json({ minPrice, maxPrice })
  } catch (error) {
    console.error('Error fetching price range:', error)
    return NextResponse.json({ message: 'Internal Server Error' }, { status: 500 })
  } finally {
    await prisma.$disconnect()
  }
}
