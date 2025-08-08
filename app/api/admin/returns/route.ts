import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

export async function GET() {
  try {
    const returns = await prisma.product_order_return.findMany({
      orderBy: { created_at: 'desc' },
    })

    return NextResponse.json({ data: returns })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Failed to load return requests' }, { status: 500 })
  }
}