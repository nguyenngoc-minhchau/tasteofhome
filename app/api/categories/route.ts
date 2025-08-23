import { NextResponse } from 'next/server'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export async function GET() {
  try {
    const categories = await prisma.product_cat.findMany({
      where: { isactive: 1 },
      select: {
        id: true,
        title: true,
        re_name: true,
        ishot: true,
        isnew: true,
        priority: true,
      },
      orderBy: {
        priority: 'asc',
      },
    })

    if (!categories || categories.length === 0) {
      return NextResponse.json({ message: 'No categories found' }, { status: 404 })
    }

    return NextResponse.json(categories)
  } catch (error) {
    console.error('Error fetching categories:', error)
    return NextResponse.json({ message: 'Internal Server Error' }, { status: 500 })
  } finally {
    await prisma.$disconnect()
  }
}
