import { NextResponse } from "next/server"
import prisma from "@/lib/prisma"

export async function GET(
  _: Request,
  { params }: { params: { id: string } }
) {
  const id = parseInt(params.id)
  if (isNaN(id)) {
    return NextResponse.json(
      { error: "Invalid return ID" },
      { status: 400 }
    )
  }

  try {
    const record = await prisma.product_order_return.findUnique({
      where: { id },
    })

    if (!record) {
      return NextResponse.json(
        { error: "Return request not found" },
        { status: 404 }
      )
    }

    return NextResponse.json({ data: record })
  } catch (err) {
    console.error("Failed to fetch return by ID:", err)
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 }
    )
  }
}
