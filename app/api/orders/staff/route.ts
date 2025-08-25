import { NextResponse } from "next/server"
import { prisma } from "@/lib/prisma"

function serialize(obj: any) {
  return JSON.parse(
    JSON.stringify(obj, (_, value) =>
      typeof value === "bigint" ? value.toString() : value
    )
  )
}

// GET all orders for staff
export async function GET(req: Request) {
  try {
    console.log("Fetching orders from database...")
    
    // Get all orders from database
    const orders = await prisma.product_order.findMany({
      orderBy: { created_at: "desc" },
      select: {
        id: true,
        inv_code: true,
        fullname: true,
        email: true,
        phone: true,
        totalamount: true,
        status: true,
        created_at: true,
        updated_at: true,
      }
    })

    console.log(`Found ${orders.length} orders`)

    if (orders.length === 0) {
      return NextResponse.json([])
    }

    // Get order details for all orders
    const orderDetails = await prisma.product_orderdetail.findMany({
      where: {
        order_id: {
          in: orders.map(order => order.id)
        }
      },
      select: {
        id: true,
        order_id: true,
        product_id: true,
        quantity: true,
        price: true,
        pro_status: true,
      }
    })

    console.log(`Found ${orderDetails.length} order details`)

    // Get product information for all products in orders
    const productIds = [...new Set(orderDetails.map(detail => detail.product_id))]
    console.log(`Product IDs: ${productIds}`)

    let products: any[] = []
    if (productIds.length > 0) {
      products = await prisma.product_pro.findMany({
        where: {
          id: {
            in: productIds.map(id => BigInt(id))
          }
        },
        select: {
          id: true,
          title: true,
          image: true,
          code: true
        }
      })
      console.log(`Found ${products.length} products`)
    }

    // Create a map for quick product lookup
    const productMap = new Map(products.map(product => [product.id, product]))

    // Combine orders with their details and product info
    const ordersWithDetails = orders.map(order => {
      const details = orderDetails
        .filter(detail => detail.order_id === order.id)
        .map(detail => ({
          id: detail.id,
          product_id: detail.product_id,
          quantity: detail.quantity,
          price: detail.price,
          product: productMap.get(BigInt(detail.product_id)) || null
        }))

      return {
        ...order,
        details
      }
    })

    console.log("Returning orders with details from database")
    return NextResponse.json(serialize(ordersWithDetails))
  } catch (error) {
    console.error("GET /api/orders/staff failed:", error)
    return NextResponse.json({ 
      error: "Internal server error", 
      details: error instanceof Error ? error.message : "Unknown error" 
    }, { status: 500 })
  }
}

// PATCH → update order status
export async function PATCH(req: Request) {
  try {
    const body = await req.json()
    const { orderId, status, notes } = body

    if (!orderId || !status) {
      return NextResponse.json({ error: "Order ID and status are required" }, { status: 400 })
    }

    console.log(`Updating order ${orderId} to status: ${status}`)

    // Update order status in database
    const updatedOrder = await prisma.product_order.update({
      where: { id: parseInt(orderId) },
      data: {
        status: status,
        updated_at: new Date(),
        // Update specific status fields based on status
        ...(status === "shipped" && { shipped_at: new Date() }),
        ...(status === "out_for_delivery" && { out_for_delivery_at: new Date() }),
        ...(status === "delivered" && { deliverydate: new Date() }),
      }
    })

    console.log("Order updated successfully")

    // Add to order history
    try {
      await prisma.product_order_history.create({
        data: {
          order_id: parseInt(orderId),
          amount: updatedOrder.totalamount,
          notes: notes || `Status updated to: ${status}`,
          created_at: new Date(),
          updated_at: new Date()
        }
      })
      console.log("Order history created")
    } catch (historyError) {
      console.warn("Failed to create order history:", historyError)
      // Don't fail the whole request if history creation fails
    }

    return NextResponse.json({
      message: "Order status updated successfully",
      order: serialize(updatedOrder)
    })
  } catch (error) {
    console.error("PATCH /api/orders/staff failed:", error)
    return NextResponse.json({ 
      error: "Internal server error",
      details: error instanceof Error ? error.message : "Unknown error"
    }, { status: 500 })
  }
}
