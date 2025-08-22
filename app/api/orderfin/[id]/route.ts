import { NextResponse } from "next/server"
import prisma from "@/lib/prisma"

// GET /api/orderfin/[id] → fetch single order by inv_code
export async function GET(
  req: Request,
  { params }: { params: { id: string } }
) {
  // Await the params to satisfy Next.js
  const { id: inv_code } = await Promise.resolve(params);

  try {
    const order = await prisma.product_order.findFirst({
      where: { inv_code },
      include: { details: true },
    });

    if (!order) {
      return NextResponse.json({ error: "Order not found" }, { status: 404 });
    }

    return NextResponse.json({
      id: order.id,
      inv_code: order.inv_code,
      fullname: order.fullname,
      email: order.email,
      phone: order.phone,
      address: order.address,
      sendingaddress: order.sendingaddress,
      status: order.isdelivery,
      totalcost: order.totalcost,
      totalamount: order.totalamount,
      transportfee_id: order.transportfee_id,
      created_at: order.created_at,
      updated_at: order.updated_at,
      items: order.details.map((item) => ({
        id: item.id,
        product_id: item.product_id,
        capacity_id: item.capacity_id,
        quantity: item.quantity,
        price: item.price,
        pro_status: item.pro_status,
      })),
    });
  } catch (error) {
    console.error("Failed to fetch order:", error);
    return NextResponse.json({ error: "Server error" }, { status: 500 });
  }
}

export async function PATCH(
  req: Request,
  context: { params: { id: string } } // context is provided by Next.js
) {
  try {
    const id = Number(context.params.id); // convert to number

    if (isNaN(id)) {
      return NextResponse.json({ error: "Invalid order ID" }, { status: 400 });
    }

    const body = await req.json();
    const updateData: any = {};

    // Only allow updating these fields
    if ("fullname" in body) updateData.fullname = body.fullname;
    if ("email" in body) updateData.email = body.email;
    if ("phone" in body) updateData.phone = body.phone;
    if ("address" in body) updateData.address = body.address;
    if ("totalamount" in body) updateData.totalamount = body.totalamount;
    if ("transportfee_id" in body) updateData.transportfee_id = body.transportfee_id;
    if ("paymentdate" in body) updateData.paymentdate = new Date(body.paymentdate);

    const updatedOrder = await prisma.product_order.update({
      where: { id }, // must be unique
      data: updateData,
    });

    return NextResponse.json({ message: "Order updated", order: updatedOrder });
  } catch (error) {
    console.error("PATCH /api/orderfin/[id] failed:", error);
    return NextResponse.json({ error: "Internal server error" }, { status: 500 });
  }
}

// DELETE: remove order and its details
export async function DELETE(
  req: Request,
  { params }: { params: { id: string } }
) {
  const id = Number(params.id);

  if (isNaN(id)) {
    return NextResponse.json({ error: "Invalid order ID" }, { status: 400 });
  }

  try {
    // Delete the order and its details (cascade is set in Prisma schema)
    await prisma.product_order.delete({
      where: { id },
    });

    return NextResponse.json({ message: "Order deleted successfully" });
  } catch (error) {
    console.error("Failed to delete order:", error);
    return NextResponse.json(
      { error: "Failed to delete order" },
      { status: 500 }
    );
  }
}