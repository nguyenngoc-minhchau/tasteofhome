// app/api/returns/route.ts
import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'

// POST /api/returns – submit return request
export async function POST(req: Request) {
  try {
    const body = await req.json()
    const { orderId, items, reason, comments } = body

    if (!orderId || !Array.isArray(items) || items.length === 0) {
      return NextResponse.json({ error: 'Missing required fields' }, { status: 400 })
    }

    const order = await prisma.product_order.findFirst({
      where: {
        inv_code: orderId,
      },
    })

    if (!order) {
      return NextResponse.json({ error: 'Order not found' }, { status: 404 })
    }

    const order_id = order.id

    const createdReturns = []
    for (const item of items) {
      const { productId, quantity } = item
      if (!productId || !quantity || quantity <= 0) continue

      const detail = await prisma.product_orderdetail.findFirst({
        where: { order_id, product_id: productId },
      })
      if (!detail || quantity > detail.quantity) continue

      const returnRecord = await prisma.product_order_return.create({
        data: {
          order_id,
          product_id: productId,
          amount: quantity,
          notes: `Reason: ${reason}. Comments: ${comments || ''}`,
          ischeck: 0,
          created_at: new Date(),
          updated_at: new Date(),
        },
      })

      createdReturns.push(returnRecord)
    }

    if (createdReturns.length === 0) {
      return NextResponse.json({ error: 'No valid return items created' }, { status: 400 })
    }

    return NextResponse.json({ message: 'Return request submitted', returns: createdReturns })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Server error' }, { status: 500 })
  }
}

export async function GET() {
  try {
    // Step 1: Get all return records that are not refunded/cancelled (ischeck !== 2)
    const returns = await prisma.product_order_return.findMany({
      where: {
        ischeck: { not: 2 },
      },
    })

    // Step 2: Extract unique order_code (string) from returns
    const orderCodes = Array.from(new Set(returns.map(r => r.order_id?.toString())))

    // Step 3: Fetch matching order_request records
    const orders = await prisma.order_request.findMany({
      where: {
        orderid: { in: orderCodes },
      },
    })

    // Step 4: Build a map of order_code → order_request
    const orderMap = Object.fromEntries(orders.map(o => [o.orderid, o]))

    // Step 5: Group return items by order_code with associated order_request info
    const grouped = Object.values(
      returns.reduce((acc, r) => {
        const orderKey = r.order_id?.toString()
        if (!acc[orderKey]) {
          acc[orderKey] = {
            order_code: orderKey,
            order: orderMap[orderKey] || null,
            items: [],
          }
        }
        acc[orderKey].items.push(r)
        return acc
      }, {} as Record<string, {
        order_code: string,
        order: any,
        items: typeof returns
      }>)
    )

    return NextResponse.json(grouped)
  } catch (error) {
    console.error('[GET /api/returns] Error', error)
    return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 })
  }
}