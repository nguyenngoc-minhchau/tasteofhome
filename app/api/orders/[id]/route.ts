import { prisma } from '@/lib/prisma'
import { NextResponse } from 'next/server'

export async function GET(
  req: Request,
  { params }: { params: { id: string } }
) {
  const { id } = params

  try {
    // Find the order by inv_code
    const order = await prisma.product_order.findFirst({
      where: { inv_code: id },
    })

    if (!order) {
      return NextResponse.json({ error: 'Order not found' }, { status: 404 })
    }

    // Find items for the order
    const orderDetails = await prisma.product_orderdetail.findMany({
      where: { order_id: order.id },
    })

    return NextResponse.json({
      order: {
        id: order.id,
        inv_code: order.inv_code,
        deliverydate: order.deliverydate?.toISOString() ?? order.created_at?.toISOString(),
      },
      items: orderDetails.map((item) => ({
        product_id: item.product_id,
        product_name: `Product ${item.product_id}`, // Replace this with real product name if needed
        quantity: item.quantity,
        price: item.price,
      })),
    })
  } catch (error) {
    console.error('Failed to fetch order:', error)
    return NextResponse.json({ error: 'Server error' }, { status: 500 })
  }
}
