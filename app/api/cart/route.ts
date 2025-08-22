// app/api/cart/route.ts
import { NextResponse } from "next/server"
import { prisma } from "@/lib/prisma"
import { cookies } from "next/headers"
import { randomUUID } from "crypto"

// Helper to get or create a cart identifier
export function getCartIdentifier() {
  const cookieStore = cookies() // synchronous access in route.ts
  let cartId = cookieStore.get("cart_id")?.value

  if (!cartId) {
    cartId = randomUUID()
    cookieStore.set("cart_id", cartId, {
      path: "/",
      httpOnly: true,
    })
  }

  return cartId
}
// GET /api/cart → fetch current cart
export async function GET() {
  try {
    const cartId = await getCartIdentifier()

    const cart = await prisma.shoppingcart.findFirst({
      where: { identifier: cartId, instance: "default" },
    })

    const items = cart ? JSON.parse(cart.content || "[]") : []
    const total = items.reduce((sum: number, item: any) => sum + item.price * item.quantity, 0)

    return NextResponse.json({ items, total })
  } catch (error) {
    console.error("GET /api/cart failed:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}

// POST /api/cart → add item to cart
export async function POST(req: Request) {
  try {
    const body = await req.json()
    const cartId = await getCartIdentifier()

    let cart = await prisma.shoppingcart.findFirst({
      where: { identifier: cartId, instance: "default" },
    })

    let items = cart ? JSON.parse(cart.content || "[]") : []

    const index = items.findIndex(
      (i: any) => i.product_id === body.product_id && i.capacity_id === body.capacity_id
    )
    if (index > -1) {
      items[index].quantity += body.quantity
    } else {
      items.push(body)
    }

await prisma.shoppingcart.upsert({
  where: {
    identifier_instance: { identifier: cartId, instance: "default" },
  },
  update: {
    content: JSON.stringify(items),
    updated_at: new Date(),
  },
  create: {
    identifier: cartId,
    instance: "default",
    content: JSON.stringify(items),
    created_at: new Date(),
    updated_at: new Date(),
  },
})

    return NextResponse.json({ message: "Item added to cart", items })
  } catch (error) {
    console.error("POST /api/cart failed:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}

// PATCH /api/cart → update quantity of an item
export async function PATCH(req: Request) {
  try {
    const body = await req.json()
    const cartId = await getCartIdentifier()

    const cart = await prisma.shoppingcart.findFirst({
      where: { identifier: cartId, instance: "default" },
    })
    if (!cart) return NextResponse.json({ error: "Cart not found" }, { status: 404 })

    let items = JSON.parse(cart.content || "[]")
    const index = items.findIndex(
      (i: any) => i.product_id === body.product_id && i.capacity_id === body.capacity_id
    )

    if (index > -1) items[index].quantity = body.quantity

	await prisma.shoppingcart.update({
	  where: {
		identifier_instance: { identifier: cartId, instance: "default" },
	  },
	  data: {
		content: JSON.stringify(items),
		updated_at: new Date(),
	  },
	})

    return NextResponse.json({ message: "Cart updated", items })
  } catch (error) {
    console.error("PATCH /api/cart failed:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}

// DELETE /api/cart → remove an item from cart
export async function DELETE(req: Request) {
  try {
    const body = await req.json()
    const cartId = await getCartIdentifier()

    const cart = await prisma.shoppingcart.findFirst({
      where: { identifier: cartId, instance: "default" },
    })
    if (!cart) return NextResponse.json({ error: "Cart not found" }, { status: 404 })

    let items = JSON.parse(cart.content || "[]")
    items = items.filter(
      (i: any) => !(i.product_id === body.product_id && i.capacity_id === body.capacity_id)
    )

	await prisma.shoppingcart.update({
	  where: {
		identifier_instance: { identifier: cartId, instance: "default" }
	  },
	  data: {
		content: JSON.stringify(items),
		updated_at: new Date(),
	  },
	})


    return NextResponse.json({ message: "Item removed", items })
  } catch (error) {
    console.error("DELETE /api/cart failed:", error)
    return NextResponse.json({ error: "Internal server error" }, { status: 500 })
  }
}
