import { NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

function serialize(obj: any) {
  return JSON.parse(
    JSON.stringify(obj, (_, value) =>
      typeof value === "bigint" ? value.toString() : value
    )
  );
}

// GET all orders
export async function GET() {
  const orders = await prisma.product_order.findMany({
    orderBy: { created_at: "desc" },
    take: 20,
    include: { details: true },
  });

  return NextResponse.json(serialize(orders));
}

// GET single order by inv_code
export async function GETBYID(req: Request, { params }: { params: { id: string } }) {
  const { id } = params;
  const order = await prisma.product_order.findFirst({
    where: { inv_code: id },
    include: { details: true },
  });

  if (!order) return NextResponse.json({ error: "Order not found" }, { status: 404 });

  return NextResponse.json(serialize(order));
}

// POST → create new order
export async function POST(req: Request) {
  try {
    const body = await req.json();
    const { inv_id, invcode, inv_code, fullname, email, phone, totalamount, transportfee_id, items } = body;

    if (!inv_id) {
      return NextResponse.json({ error: "inv_id is required" }, { status: 400 });
    }

    const order = await prisma.product_order.create({
      data: {
        inv_id,
        invcode,
        inv_code,
        fullname,
        email,
        phone,
        totalamount,
		transportfee_id,
        details: {
          create: items.map((item: any) => ({
            product_id: item.product_id,
            capacity_id: item.capacity_id,
            quantity: item.quantity,
            price: item.price,
            pro_status: 0,
          })),
        },
      },
      include: { details: true },
    });

    return NextResponse.json(serialize(order));
  } catch (error) {
    console.error("POST /api/orderfin failed:", error);
    return NextResponse.json({ error: "Internal server error" }, { status: 500 });
  }
}

// PATCH → update order fields
export async function PATCH(req: Request) {
  try {
    const body = await req.json();
    const { id, status, deliverydate, isdelivery, totalamount } = body;

    if (!id) return NextResponse.json({ error: "Order id is required" }, { status: 400 });

    const order = await prisma.product_order.update({
      where: { id },
      data: {
        isdelivery,
        totalamount,
        deliverydate: deliverydate ? new Date(deliverydate) : undefined,
        ischeck: status !== undefined ? status : undefined,
      },
    });

    return NextResponse.json(serialize(order));
  } catch (error) {
    console.error("PATCH /api/orderfin failed:", error);
    return NextResponse.json({ error: "Internal server error" }, { status: 500 });
  }
}

// DELETE → remove an order
export async function DELETE(req: Request) {
  try {
    const body = await req.json();
    const { id } = body;

    if (!id) return NextResponse.json({ error: "Order id is required" }, { status: 400 });

    await prisma.product_order.delete({ where: { id } });
    return NextResponse.json({ message: "Order deleted successfully" });
  } catch (error) {
    console.error("DELETE /api/orderfin failed:", error);
    return NextResponse.json({ error: "Internal server error" }, { status: 500 });
  }
}
