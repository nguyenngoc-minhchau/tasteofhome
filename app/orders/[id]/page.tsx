"use client"

import { useParams } from "next/navigation"
import Link from "next/link"
import { ArrowLeft, Package, Truck, CheckCircle, Clock, Download, MapPin } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Separator } from "@/components/ui/separator"
import { Progress } from "@/components/ui/progress"

// Mock detailed order data
const orderDetails = {
  "ORD-2024-001": {
    id: "ORD-2024-001",
    date: "2024-01-15",
    status: "delivered",
    paymentStatus: "paid",
    paymentMethod: "Credit Card ending in 4242",
    total: 67.48,
    subtotal: 62.48,
    shipping: 0,
    tax: 5.0,
    items: [
      {
        id: 1,
        name: "Premium Ethiopian Coffee Beans",
        quantity: 2,
        price: 24.99,
        image: "/placeholder.svg?height=80&width=80&text=Coffee",
      },
      {
        id: 2,
        name: "Himalayan Pink Salt",
        quantity: 1,
        price: 12.5,
        image: "/placeholder.svg?height=80&width=80&text=Salt",
      },
    ],
    trackingNumber: "1Z999AA1234567890",
    estimatedDelivery: "2024-01-18",
    actualDelivery: "2024-01-17",
    shippingAddress: {
      name: "John Doe",
      street: "123 Main Street",
      city: "New York",
      state: "NY",
      zip: "10001",
      country: "United States",
    },
    timeline: [
      {
        status: "Order Placed",
        date: "2024-01-15 10:30 AM",
        description: "Your order has been received and is being processed",
        completed: true,
      },
      {
        status: "Payment Confirmed",
        date: "2024-01-15 10:35 AM",
        description: "Payment has been successfully processed",
        completed: true,
      },
      {
        status: "Order Shipped",
        date: "2024-01-16 2:15 PM",
        description: "Your order has been shipped and is on its way",
        completed: true,
      },
      {
        status: "Out for Delivery",
        date: "2024-01-17 8:00 AM",
        description: "Your package is out for delivery",
        completed: true,
      },
      {
        status: "Delivered",
        date: "2024-01-17 3:45 PM",
        description: "Package delivered successfully",
        completed: true,
      },
    ],
  },
  "ORD-2024-002": {
    id: "ORD-2024-002",
    date: "2024-01-20",
    status: "shipped",
    paymentStatus: "paid",
    paymentMethod: "Credit Card ending in 4242",
    total: 45.75,
    subtotal: 47.74,
    shipping: 0,
    tax: 3.82,
    items: [
      {
        id: 3,
        name: "Organic Green Tea",
        quantity: 1,
        price: 18.75,
        image: "/placeholder.svg?height=80&width=80&text=Tea",
      },
      {
        id: 5,
        name: "Wild Honey",
        quantity: 1,
        price: 28.99,
        image: "/placeholder.svg?height=80&width=80&text=Honey",
      },
    ],
    trackingNumber: "1Z999AA1234567891",
    estimatedDelivery: "2024-01-25",
    shippingAddress: {
      name: "John Doe",
      street: "123 Main Street",
      city: "New York",
      state: "NY",
      zip: "10001",
      country: "United States",
    },
    timeline: [
      {
        status: "Order Placed",
        date: "2024-01-20 2:15 PM",
        description: "Your order has been received and is being processed",
        completed: true,
      },
      {
        status: "Payment Confirmed",
        date: "2024-01-20 2:20 PM",
        description: "Payment has been successfully processed",
        completed: true,
      },
      {
        status: "Order Shipped",
        date: "2024-01-21 11:30 AM",
        description: "Your order has been shipped and is on its way",
        completed: true,
      },
      {
        status: "Out for Delivery",
        date: "",
        description: "Your package will be out for delivery soon",
        completed: false,
      },
      {
        status: "Delivered",
        date: "",
        description: "Package will be delivered",
        completed: false,
      },
    ],
  },
  "ORD-2024-005": {
    id: "ORD-2024-005",
    date: "2024-01-18",
    status: "delivered",
    paymentStatus: "paid",
    paymentMethod: "Credit Card ending in 4242",
    total: 159.5,
    subtotal: 147.5,
    shipping: 0,
    tax: 12.0,
    items: [
      {
        id: 3,
        name: "Organic Green Tea",
        quantity: 1,
        price: 18.75,
        image: "/placeholder.svg?height=80&width=80&text=Tea",
      },
      {
        id: 4,
        name: "Artisan Dark Chocolate",
        quantity: 2,
        price: 32.0,
        image: "/placeholder.svg?height=80&width=80&text=Chocolate",
      },
      {
        id: 7,
        name: "French Lavender Oil",
        quantity: 1,
        price: 45.0,
        image: "/placeholder.svg?height=80&width=80&text=Lavender",
      },
    ],
    trackingNumber: "1Z999AA1234567892",
    estimatedDelivery: "2024-01-22",
    actualDelivery: "2024-01-20",
    shippingAddress: {
      name: "John Doe",
      street: "123 Main Street",
      city: "New York",
      state: "NY",
      zip: "10001",
      country: "United States",
    },
    timeline: [
      {
        status: "Order Placed",
        date: "2024-01-18 9:15 AM",
        description: "Your order has been received and is being processed",
        completed: true,
      },
      {
        status: "Payment Confirmed",
        date: "2024-01-18 9:20 AM",
        description: "Payment has been successfully processed",
        completed: true,
      },
      {
        status: "Order Shipped",
        date: "2024-01-19 1:30 PM",
        description: "Your order has been shipped and is on its way",
        completed: true,
      },
      {
        status: "Out for Delivery",
        date: "2024-01-20 7:45 AM",
        description: "Your package is out for delivery",
        completed: true,
      },
      {
        status: "Delivered",
        date: "2024-01-20 2:30 PM",
        description: "Package delivered successfully",
        completed: true,
      },
    ],
  },
}

const statusColors = {
  processing: "bg-blue-500",
  shipped: "bg-orange-500",
  delivered: "bg-green-500",
  cancelled: "bg-red-500",
}

const statusIcons = {
  processing: Clock,
  shipped: Truck,
  delivered: CheckCircle,
  cancelled: Package,
}

export default function OrderDetailPage() {
  const params = useParams()
  const orderId = params.id as string
  const order = orderDetails[orderId as keyof typeof orderDetails]

  if (!order) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Order Not Found</h1>
          <Link href="/orders">
            <Button>Back to Orders</Button>
          </Link>
        </div>
      </div>
    )
  }

  const StatusIcon = statusIcons[order.status as keyof typeof statusIcons]
  const completedSteps = order.timeline.filter((step) => step.completed).length
  const progressPercentage = (completedSteps / order.timeline.length) * 100

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/orders" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Orders
            </Link>
            <h1 className="text-2xl font-bold">Order Details</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto space-y-8">
          {/* Order Header */}
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div>
                  <CardTitle className="text-2xl">{order.id}</CardTitle>
                  <p className="text-muted-foreground">
                    Placed on {new Date(order.date).toLocaleDateString()} at {new Date(order.date).toLocaleTimeString()}
                  </p>
                </div>
                <div className="text-right">
                  <Badge className={`${statusColors[order.status as keyof typeof statusColors]} mb-2`}>
                    <StatusIcon className="h-4 w-4 mr-1" />
                    {order.status.charAt(0).toUpperCase() + order.status.slice(1)}
                  </Badge>
                  <p className="text-2xl font-bold">${order.total.toFixed(2)}</p>
                </div>
              </div>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div>
                  <h4 className="font-semibold mb-2">Payment Status</h4>
                  <Badge variant={order.paymentStatus === "paid" ? "default" : "destructive"}>
                    {order.paymentStatus.charAt(0).toUpperCase() + order.paymentStatus.slice(1)}
                  </Badge>
                  <p className="text-sm text-muted-foreground mt-1">{order.paymentMethod}</p>
                </div>

                {order.trackingNumber && (
                  <div>
                    <h4 className="font-semibold mb-2">Tracking Number</h4>
                    <p className="font-mono text-sm">{order.trackingNumber}</p>
                  </div>
                )}

                <div>
                  <h4 className="font-semibold mb-2">
                    {order.status === "delivered" ? "Delivered" : "Estimated Delivery"}
                  </h4>
                  <p className="text-sm">
                    {order.status === "delivered" && order.actualDelivery
                      ? new Date(order.actualDelivery).toLocaleDateString()
                      : new Date(order.estimatedDelivery).toLocaleDateString()}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Order Progress */}
          <Card>
            <CardHeader>
              <CardTitle>Order Progress</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-6">
                <div>
                  <div className="flex justify-between text-sm mb-2">
                    <span>Progress</span>
                    <span>{Math.round(progressPercentage)}% Complete</span>
                  </div>
                  <Progress value={progressPercentage} className="h-2" />
                </div>

                <div className="space-y-4">
                  {order.timeline.map((step, index) => (
                    <div key={index} className="flex items-start gap-4">
                      <div
                        className={`w-8 h-8 rounded-full flex items-center justify-center ${
                          step.completed ? "bg-green-500 text-white" : "bg-gray-200 text-gray-500"
                        }`}
                      >
                        {step.completed ? <CheckCircle className="h-4 w-4" /> : <Clock className="h-4 w-4" />}
                      </div>
                      <div className="flex-1">
                        <h4 className={`font-semibold ${step.completed ? "text-green-700" : "text-gray-500"}`}>
                          {step.status}
                        </h4>
                        <p className="text-sm text-muted-foreground">{step.description}</p>
                        {step.date && <p className="text-xs text-muted-foreground mt-1">{step.date}</p>}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </CardContent>
          </Card>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Order Items */}
            <Card>
              <CardHeader>
                <CardTitle>Order Items</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {order.items.map((item) => (
                    <div key={item.id} className="flex gap-4">
                      <img
                        src={item.image || "/placeholder.svg"}
                        alt={item.name}
                        className="w-16 h-16 object-cover rounded-md"
                      />
                      <div className="flex-1">
                        <h4 className="font-semibold">{item.name}</h4>
                        <p className="text-sm text-muted-foreground">Quantity: {item.quantity}</p>
                        <p className="font-semibold">${(item.price * item.quantity).toFixed(2)}</p>
                      </div>
                    </div>
                  ))}

                  <Separator />

                  <div className="space-y-2">
                    <div className="flex justify-between">
                      <span>Subtotal</span>
                      <span>${order.subtotal.toFixed(2)}</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Shipping</span>
                      <span>{order.shipping === 0 ? "Free" : `$${order.shipping.toFixed(2)}`}</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Tax</span>
                      <span>${order.tax.toFixed(2)}</span>
                    </div>
                    <Separator />
                    <div className="flex justify-between font-semibold text-lg">
                      <span>Total</span>
                      <span>${order.total.toFixed(2)}</span>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Shipping Address */}
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <MapPin className="h-5 w-5" />
                  Shipping Address
                </CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-2">
                  <p className="font-semibold">{order.shippingAddress.name}</p>
                  <p>{order.shippingAddress.street}</p>
                  <p>
                    {order.shippingAddress.city}, {order.shippingAddress.state} {order.shippingAddress.zip}
                  </p>
                  <p>{order.shippingAddress.country}</p>
                </div>

                <div className="mt-6 space-y-2">
                  {order.status === "delivered" && (
                    <Button className="w-full bg-transparent" variant="outline">
                      <Download className="h-4 w-4 mr-2" />
                      Download Invoice
                    </Button>
                  )}

                  {order.trackingNumber && order.status !== "delivered" && (
                    <Button className="w-full bg-transparent" variant="outline">
                      <Truck className="h-4 w-4 mr-2" />
                      Track Package
                    </Button>
                  )}
                </div>

                {order.status === "delivered" && (
                  <>
                    <Button className="w-full bg-transparent" variant="outline">
                      <Link href={`/orders/${order.id}/return`} className="w-full flex items-center justify-center">
                        <Package className="h-4 w-4 mr-2" />
                        Request Return
                      </Link>
                    </Button>

                    <div className="space-y-2">
                      <p className="text-sm font-medium">Write Reviews:</p>
                      {order.items.map((item) => (
                        <Link key={item.id} href={`/product/${item.id}/review`}>
                          <Button variant="outline" size="sm" className="w-full text-xs bg-transparent">
                            Review: {item.name}
                          </Button>
                        </Link>
                      ))}
                    </div>
                  </>
                )}
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
