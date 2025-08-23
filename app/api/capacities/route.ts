import { NextResponse } from 'next/server'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export async function GET() {
  try {
    const capacities = await prisma.product_capacity.findMany({
      select: {
        id: true,
        title: true,
        priority: true,
      },
      orderBy: {
        priority: 'asc',
      },
    })

    if (!capacities || capacities.length === 0) {
      return NextResponse.json({ message: 'No capacities found' }, { status: 404 })
    }

    return NextResponse.json(capacities)
  } catch (error) {
    console.error('Error fetching capacities:', error)
    return NextResponse.json({ message: 'Internal Server Error' }, { status: 500 })
  } finally {
    await prisma.$disconnect()
  }
}
