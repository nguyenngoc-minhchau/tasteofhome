import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

function serialize(obj: any) {
  return JSON.parse(
    JSON.stringify(obj, (_, value) =>
      typeof value === "bigint" ? value.toString() : value
    )
  );
}

export async function GET(
  req: Request,
  { params }: { params: { id: string } }
) {
  try {
    const detail = await prisma.product_detail.findUnique({
      where: { id: BigInt(params.id) },
      include: { product: true },
    });
    return NextResponse.json(serialize(detail));
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

export async function PATCH(
  req: Request,
  { params }: { params: { id: string } }
) {
  try {
    const data = await req.json();
    const updated = await prisma.product_detail.update({
      where: { id: BigInt(params.id) },
      data,
    });
    return NextResponse.json(serialize(updated));
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

export async function DELETE(
  req: Request,
  { params }: { params: { id: string } }
) {
  try {
    await prisma.product_detail.delete({
      where: { id: BigInt(params.id) },
    });
    return NextResponse.json({ message: "Detail deleted" });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
