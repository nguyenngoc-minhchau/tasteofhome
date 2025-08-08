import { NextResponse } from "next/server"
import prisma from "@/lib/prisma"

// GET /api/orders
export async function GET() {
  const orders = await prisma.order_request.findMany({
    orderBy: { created_at: "desc" },
    take: 20,
  })

  const results = orders.map((order) => ({
    id: order.orderid,
    email: order.email,
    phone: order.phone,
    status: order.status,
    created_at: order.created_at,
    updated_at: order.updated_at,
  }))

  return NextResponse.json(results)
}
