"use client"

import { useState } from "react"
import Link from "next/link"
import { ArrowLeft, Package, Eye, Download, RefreshCw, Star } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { ReturnScenarioBanner } from "@/components/return-scenario-banner"

// Mock order data
const orders = [
  {
    id: "ORD-2024-001",
    date: "2024-01-15",
    status: "delivered",
    total: 67.48,
    items: [
      { name: "Premium Ethiopian Coffee Beans", quantity: 2, price: 24.99 },
      { name: "Himalayan Pink Salt", quantity: 1, price: 12.5 },
    ],
    trackingNumber: "1Z999AA1234567890",
    estimatedDelivery: "2024-01-18",
    actualDelivery: "2024-01-17",
  },
  {
    id: "ORD-2024-002",
    date: "2024-01-20",
    status: "shipped",
    total: 45.75,
    items: [
      { name: "Organic Green Tea", quantity: 1, price: 18.75 },
      { name: "Wild Honey", quantity: 1, price: 28.99 },
    ],
    trackingNumber: "1Z999AA1234567891",
    estimatedDelivery: "2024-01-25",
  },
  {
    id: "ORD-2024-003",
    date: "2024-01-22",
    status: "processing",
    total: 32.0,
    items: [{ name: "Artisan Dark Chocolate", quantity: 1, price: 32.0 }],
    estimatedDelivery: "2024-01-28",
  },
  {
    id: "ORD-2024-004",
    date: "2024-01-10",
    status: "cancelled",
    total: 15.25,
    items: [{ name: "Basmati Rice", quantity: 1, price: 15.25 }],
  },
  {
    id: "ORD-2024-005",
    date: "2024-01-18",
    status: "delivered",
    total: 159.5,
    items: [
      { name: "Organic Green Tea", quantity: 1, price: 18.75 },
      { name: "Artisan Dark Chocolate", quantity: 2, price: 32.0 },
      { name: "French Lavender Oil", quantity: 1, price: 45.0 },
    ],
    trackingNumber: "1Z999AA1234567892",
    estimatedDelivery: "2024-01-22",
    actualDelivery: "2024-01-20",
  },
]

const statusColors = {
  processing: "bg-blue-500",
  shipped: "bg-orange-500",
  delivered: "bg-green-500",
  cancelled: "bg-red-500",
}

const statusLabels = {
  processing: "Processing",
  shipped: "Shipped",
  delivered: "Delivered",
  cancelled: "Cancelled",
}

export default function OrderHistoryPage() {
  const [selectedTab, setSelectedTab] = useState("all")

  const filteredOrders = orders.filter((order) => {
    if (selectedTab === "all") return true
    return order.status === selectedTab
  })

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Shop
            </Link>
            <h1 className="text-2xl font-bold">Order History</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto">
          <div className="flex items-center justify-between mb-8">
            <div>
              <h2 className="text-3xl font-bold">Your Orders</h2>
              <p className="text-muted-foreground">Track and manage your order history</p>
            </div>
            <Button variant="outline" size="sm">
              <RefreshCw className="h-4 w-4 mr-2" />
              Refresh
            </Button>
          </div>

          {/* Add the banner here */}
          <div className="mb-6">
            <ReturnScenarioBanner />
          </div>

          {/* Order Filters */}
          <Tabs value={selectedTab} onValueChange={setSelectedTab} className="mb-8">
            <TabsList className="grid w-full grid-cols-5">
              <TabsTrigger value="all">All Orders</TabsTrigger>
              <TabsTrigger value="processing">Processing</TabsTrigger>
              <TabsTrigger value="shipped">Shipped</TabsTrigger>
              <TabsTrigger value="delivered">Delivered</TabsTrigger>
              <TabsTrigger value="cancelled">Cancelled</TabsTrigger>
            </TabsList>

            <TabsContent value={selectedTab} className="mt-6">
              {filteredOrders.length === 0 ? (
                <div className="text-center py-12">
                  <Package className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
                  <h3 className="text-xl font-semibold mb-2">No orders found</h3>
                  <p className="text-muted-foreground mb-6">
                    {selectedTab === "all" ? "You haven't placed any orders yet." : `No ${selectedTab} orders found.`}
                  </p>
                  <Link href="/">
                    <Button>Start Shopping</Button>
                  </Link>
                </div>
              ) : (
                <div className="space-y-4">
                  {filteredOrders.map((order) => (
                    <Card key={order.id} className="hover:shadow-md transition-shadow">
                      <CardHeader>
                        <div className="flex items-center justify-between">
                          <div>
                            <CardTitle className="text-lg">{order.id}</CardTitle>
                            <p className="text-sm text-muted-foreground">
                              Placed on {new Date(order.date).toLocaleDateString()}
                            </p>
                          </div>
                          <div className="text-right">
                            <Badge className={statusColors[order.status as keyof typeof statusColors]}>
                              {statusLabels[order.status as keyof typeof statusLabels]}
                            </Badge>
                            <p className="text-lg font-semibold mt-1">${order.total.toFixed(2)}</p>
                          </div>
                        </div>
                      </CardHeader>
                      <CardContent>
                        <div className="space-y-4">
                          {/* Order Items */}
                          <div>
                            <h4 className="font-medium mb-2">Items ({order.items.length})</h4>
                            <div className="space-y-1">
                              {order.items.map((item, index) => (
                                <div key={index} className="flex justify-between text-sm">
                                  <span>
                                    {item.quantity}x {item.name}
                                  </span>
                                  <span>${(item.price * item.quantity).toFixed(2)}</span>
                                </div>
                              ))}
                            </div>
                          </div>

                          {/* Tracking Information */}
                          {order.trackingNumber && (
                            <div className="text-sm">
                              <span className="font-medium">Tracking: </span>
                              <span className="font-mono">{order.trackingNumber}</span>
                            </div>
                          )}

                          {/* Delivery Information */}
                          {order.estimatedDelivery && (
                            <div className="text-sm">
                              <span className="font-medium">
                                {order.status === "delivered" ? "Delivered: " : "Estimated Delivery: "}
                              </span>
                              <span>
                                {order.status === "delivered" && order.actualDelivery
                                  ? new Date(order.actualDelivery).toLocaleDateString()
                                  : new Date(order.estimatedDelivery).toLocaleDateString()}
                              </span>
                            </div>
                          )}

                          {/* Action Buttons */}
                          <div className="flex gap-2 pt-2">
                            <Link href={`/orders/${order.id}`}>
                              <Button variant="outline" size="sm">
                                <Eye className="h-4 w-4 mr-2" />
                                View Details
                              </Button>
                            </Link>

                            {order.status === "delivered" && (
                              <Button variant="outline" size="sm">
                                <Download className="h-4 w-4 mr-2" />
                                Download Invoice
                              </Button>
                            )}

                            {order.status === "processing" && (
                              <Button
                                variant="outline"
                                size="sm"
                                className="text-red-600 hover:text-red-700 bg-transparent"
                              >
                                Cancel Order
                              </Button>
                            )}

                            {order.status === "delivered" && (
                              <>
                                <Link href={`/orders/${order.id}/return`}>
                                  <Button variant="outline" size="sm">
                                    <Package className="h-4 w-4 mr-2" />
                                    Request Return
                                  </Button>
                                </Link>

                                <Link href={`/product/${order.items[0]?.id || 1}/review`}>
                                  <Button variant="outline" size="sm">
                                    <Star className="h-4 w-4 mr-2" />
                                    Write Review
                                  </Button>
                                </Link>
                              </>
                            )}
                          </div>
                        </div>
                      </CardContent>
                    </Card>
                  ))}
                </div>
              )}
            </TabsContent>
          </Tabs>
        </div>
      </div>
    </div>
  )
}
