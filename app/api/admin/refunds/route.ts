import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

export async function POST(req: Request) {
  const body = await req.json()
  const { return_id, refundAmount } = body

  if (!return_id || refundAmount == null) {
    return NextResponse.json({ error: 'Missing return_id or refundAmount' }, { status: 400 })
  }

  try {
    // Update return status
    const updatedReturn = await prisma.product_order_return.update({
      where: { id: return_id },
      data: {
        ischeck: 1, // Approved
        amount: refundAmount,
        updated_at: new Date(),
      },
    })

    // Optional: update order status to 'Refunded'
    const REFUNDED_STATUS_ID = 3 // change based on your seed data
    if (updatedReturn.order_id) {
      await prisma.orders.update({
        where: { id: updatedReturn.order_id },
        data: {
          status_id: REFUNDED_STATUS_ID,
        },
      })
    }

    return NextResponse.json({ message: 'Refund approved', data: updatedReturn })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Failed to process refund' }, { status: 500 })
  }
}