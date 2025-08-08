import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

export async function PATCH(req: Request) {
  try {
    const { orderId, ischeck } = await req.json()

    if (typeof orderId !== 'number' || typeof ischeck !== 'number') {
      return NextResponse.json({ error: 'Missing or invalid fields' }, { status: 400 })
    }

    // Update all return records for this order
    const updated = await prisma.product_order_return.updateMany({
      where: { order_id: orderId },
      data: {
        ischeck,
        updated_at: new Date(),
      },
    })

    return NextResponse.json({ message: 'Return status updated', count: updated.count })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Server error' }, { status: 500 })
  }
}
