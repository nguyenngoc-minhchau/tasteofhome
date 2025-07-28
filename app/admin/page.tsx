"use client"

import { useState } from "react"
import Link from "next/link"
import { Search, Eye, RefreshCw, DollarSign, Package, Users, TrendingUp, MoreHorizontal, Download } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Badge } from "@/components/ui/badge"
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"

// Mock admin order data
const adminOrders = [
  {
    id: "ORD-2024-001",
    customer: "John Doe",
    email: "john@example.com",
    date: "2024-01-15",
    status: "delivered",
    paymentStatus: "paid",
    total: 67.48,
    items: [
      { name: "Premium Ethiopian Coffee Beans", quantity: 2, price: 24.99 },
      { name: "Himalayan Pink Salt", quantity: 1, price: 12.5 },
    ],
    refundEligible: true,
    hasReturns: false,
  },
  {
    id: "ORD-2024-002",
    customer: "Jane Smith",
    email: "jane@example.com",
    date: "2024-01-20",
    status: "shipped",
    paymentStatus: "paid",
    total: 45.75,
    items: [
      { name: "Organic Green Tea", quantity: 1, price: 18.75 },
      { name: "Wild Honey", quantity: 1, price: 28.99 },
    ],
    refundEligible: true,
    hasReturns: false,
  },
  {
    id: "ORD-2024-003",
    customer: "Bob Johnson",
    email: "bob@example.com",
    date: "2024-01-22",
    status: "processing",
    paymentStatus: "paid",
    total: 32.0,
    items: [{ name: "Artisan Dark Chocolate", quantity: 1, price: 32.0 }],
    refundEligible: true,
    hasReturns: false,
  },
  {
    id: "ORD-2024-004",
    customer: "Alice Brown",
    email: "alice@example.com",
    date: "2024-01-10",
    status: "refunded",
    paymentStatus: "refunded",
    total: 15.25,
    items: [{ name: "Basmati Rice", quantity: 1, price: 15.25 }],
    refundEligible: false,
    hasReturns: false,
  },
]

const statusColors = {
  processing: "bg-blue-500",
  shipped: "bg-orange-500",
  delivered: "bg-green-500",
  cancelled: "bg-red-500",
  refunded: "bg-purple-500",
}

export default function AdminDashboard() {
  const [searchQuery, setSearchQuery] = useState("")
  const [selectedStatus, setSelectedStatus] = useState("all")

  const filteredOrders = adminOrders.filter((order) => {
    const matchesSearch =
      order.id.toLowerCase().includes(searchQuery.toLowerCase()) ||
      order.customer.toLowerCase().includes(searchQuery.toLowerCase()) ||
      order.email.toLowerCase().includes(searchQuery.toLowerCase())

    const matchesStatus = selectedStatus === "all" || order.status === selectedStatus

    return matchesSearch && matchesStatus
  })

  const stats = {
    totalOrders: adminOrders.length,
    totalRevenue: adminOrders.reduce((sum, order) => sum + order.total, 0),
    pendingOrders: adminOrders.filter((order) => order.status === "processing").length,
    refundableOrders: adminOrders.filter((order) => order.refundEligible).length,
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-bold">Admin Dashboard</h1>
              <p className="text-muted-foreground">Manage orders, refunds, and returns</p>
            </div>
            <div className="flex items-center gap-4">
              <Link href="/admin/products">
                <Button variant="outline">
                  <Package className="h-4 w-4 mr-2" />
                  Products
                </Button>
              </Link>
              <Link href="/admin/reports">
                <Button variant="outline">
                  <TrendingUp className="h-4 w-4 mr-2" />
                  Reports
                </Button>
              </Link>
              <Link href="/">
                <Button variant="outline">Back to Store</Button>
              </Link>
              <Button variant="outline" size="sm">
                <RefreshCw className="h-4 w-4 mr-2" />
                Refresh
              </Button>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Orders</CardTitle>
              <Package className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.totalOrders}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Revenue</CardTitle>
              <DollarSign className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">${stats.totalRevenue.toFixed(2)}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Pending Orders</CardTitle>
              <TrendingUp className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.pendingOrders}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Refund Eligible</CardTitle>
              <Users className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.refundableOrders}</div>
            </CardContent>
          </Card>
        </div>

        {/* Order Management */}
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <CardTitle>Order Management</CardTitle>
              <Button variant="outline" size="sm">
                <Download className="h-4 w-4 mr-2" />
                Export
              </Button>
            </div>
          </CardHeader>
          <CardContent>
            {/* Search and Filters */}
            <div className="flex gap-4 mb-6">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-4 w-4" />
                <Input
                  placeholder="Search orders, customers, or emails..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-10"
                />
              </div>
              <Tabs value={selectedStatus} onValueChange={setSelectedStatus}>
                <TabsList>
                  <TabsTrigger value="all">All</TabsTrigger>
                  <TabsTrigger value="processing">Processing</TabsTrigger>
                  <TabsTrigger value="shipped">Shipped</TabsTrigger>
                  <TabsTrigger value="delivered">Delivered</TabsTrigger>
                  <TabsTrigger value="refunded">Refunded</TabsTrigger>
                </TabsList>
              </Tabs>
            </div>

            {/* Orders Table */}
            <div className="space-y-4">
              {filteredOrders.length === 0 ? (
                <div className="text-center py-8">
                  <p className="text-muted-foreground">No orders found matching your criteria</p>
                </div>
              ) : (
                filteredOrders.map((order) => (
                  <Card key={order.id} className="hover:shadow-md transition-shadow">
                    <CardContent className="p-6">
                      <div className="flex items-center justify-between">
                        <div className="space-y-2">
                          <div className="flex items-center gap-4">
                            <h3 className="font-semibold">{order.id}</h3>
                            <Badge className={statusColors[order.status as keyof typeof statusColors]}>
                              {order.status.charAt(0).toUpperCase() + order.status.slice(1)}
                            </Badge>
                            {order.refundEligible && (
                              <Badge variant="outline" className="text-green-600 border-green-600">
                                Refund Eligible
                              </Badge>
                            )}
                          </div>
                          <div className="text-sm text-muted-foreground">
                            <p>
                              <strong>Customer:</strong> {order.customer} ({order.email})
                            </p>
                            <p>
                              <strong>Date:</strong> {new Date(order.date).toLocaleDateString()}
                            </p>
                            <p>
                              <strong>Items:</strong> {order.items.length} item(s)
                            </p>
                          </div>
                        </div>

                        <div className="text-right space-y-2">
                          <p className="text-2xl font-bold">${order.total.toFixed(2)}</p>
                          <div className="flex gap-2">
                            <Link href={`/admin/orders/${order.id}`}>
                              <Button variant="outline" size="sm">
                                <Eye className="h-4 w-4 mr-1" />
                                View
                              </Button>
                            </Link>
                            <DropdownMenu>
                              <DropdownMenuTrigger asChild>
                                <Button variant="outline" size="sm">
                                  <MoreHorizontal className="h-4 w-4" />
                                </Button>
                              </DropdownMenuTrigger>
                              <DropdownMenuContent>
                                <DropdownMenuItem>
                                  <Link href={`/admin/orders/${order.id}`} className="w-full">
                                    View Details
                                  </Link>
                                </DropdownMenuItem>
                                {order.refundEligible && (
                                  <DropdownMenuItem>
                                    <Link href={`/admin/orders/${order.id}/refund`} className="w-full">
                                      Process Refund
                                    </Link>
                                  </DropdownMenuItem>
                                )}
                                <DropdownMenuItem>Download Invoice</DropdownMenuItem>
                              </DropdownMenuContent>
                            </DropdownMenu>
                          </div>
                        </div>
                      </div>
                    </CardContent>
                  </Card>
                ))
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
