"use client"

import { useState } from "react"
import Link from "next/link"
import {
  DollarSign,
  Package,
  Users,
  TrendingUp,
  ShoppingCart,
  MessageCircle,
  AlertTriangle,
  Activity,
  Clock,
  CheckCircle,
  Truck,
  Search,
  Eye,
  RefreshCw,
  MoreHorizontal,
  Download,
} from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button" 
import { Input } from "@/components/ui/input"     
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs" 
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu" // Dam bao DropdownMenu duoc import


// Mock data for manager role (Existing data)
const managerDashboardData = {
  todayOrders: 47,
  weekRevenue: 12456.78,
  monthRevenue: 45678.9,
  topProducts: [
    { name: "Premium Ethiopian Coffee Beans", sales: 156, revenue: 3899.44 },
    { name: "Organic Green Tea", sales: 89, revenue: 1668.75 },
    { name: "French Lavender Oil", sales: 34, revenue: 1530.0 },
  ],
  recentActivity: [
    { type: "order", message: "New order ORD-2024-047 placed", time: "2 minutes ago" },
    { type: "refund", message: "Refund processed for ORD-2024-032", time: "15 minutes ago" },
    { type: "product", message: "Low stock alert: Artisan Dark Chocolate", time: "1 hour ago" },
  ],
  alerts: [
    { type: "warning", message: "3 products are running low on stock" },
    { type: "info", message: "Weekly sales report is ready for review" },
  ],
}

// Mock admin order data (Copied from your AdminDashboard)
const managerOrders = [ // Doi ten bien de phan biet voi adminOrders goc
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


export default function ManagerDashboard() {
  const [searchQuery, setSearchQuery] = useState("")
  const [selectedStatus, setSelectedStatus] = useState("all")

  const filteredOrders = managerOrders.filter((order) => {
    const matchesSearch =
      order.id.toLowerCase().includes(searchQuery.toLowerCase()) ||
      order.customer.toLowerCase().includes(searchQuery.toLowerCase()) ||
      order.email.toLowerCase().includes(searchQuery.toLowerCase())

    const matchesStatus = selectedStatus === "all" || order.status === selectedStatus

    return matchesSearch && matchesStatus
  })

  const orderStats = {
    totalOrders: managerOrders.length,
    totalRevenue: managerOrders.reduce((sum, order) => sum + order.total, 0),
    pendingOrders: managerOrders.filter((order) => order.status === "processing").length,
    refundableOrders: managerOrders.filter((order) => order.refundEligible).length,
  }


  return (
    <div className="min-h-screen bg-background p-6">
      {/* Header cho Manager Dashboard */}
      <header className="border-b pb-4 mb-8">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold">Manager Dashboard</h1>
            <p className="text-muted-foreground">Comprehensive overview and operational controls</p>
          </div>
          <div className="flex items-center gap-4">
            <Link href="/manager/products"> {/* Link den trang quan ly san pham */}
              <Button variant="outline">
                <Package className="h-4 w-4 mr-2" />
                Products
              </Button>
            </Link>
            <Link href="/manager/reports"> {/* Link den trang bao cao */}
              <Button variant="outline">
                <TrendingUp className="h-4 w-4 mr-2" />
                Reports
              </Button>
            </Link>
            <Link href="/manager/staff"> {/* Link den trang quan ly nhan vien */}
              <Button variant="outline">
                <Users className="h-4 w-4 mr-2" />
                Staff
              </Button>
            </Link>
            <Link href="/"> {/* Quay ve trang chinh */}
              <Button variant="outline">Back to Store</Button>
            </Link>
            <Button variant="outline" size="sm">
              <RefreshCw className="h-4 w-4 mr-2" />
              Refresh
            </Button>
          </div>
        </div>
      </header>

      {/* Existing Manager Metrics */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Orders Today</CardTitle>
            <ShoppingCart className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{managerDashboardData.todayOrders}</div>
            <p className="text-xs text-green-600">+12% from yesterday</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Week Revenue</CardTitle>
            <DollarSign className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">${managerDashboardData.weekRevenue.toLocaleString()}</div>
            <p className="text-xs text-green-600">+8% from last week</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Month Revenue</CardTitle>
            <TrendingUp className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">${managerDashboardData.monthRevenue.toLocaleString()}</div>
            <p className="text-xs text-green-600">+15% from last month</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Avg Order Value</CardTitle>
            <Package className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">$36.64</div>
            <p className="text-xs text-green-600">+3% from last month</p>
          </CardContent>
        </Card>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
        {/* Top Products */}
        <Card>
          <CardHeader>
            <CardTitle>Top Selling Products</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {managerDashboardData.topProducts.map((product, index) => (
                <div key={index} className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">{product.name}</p>
                    <p className="text-sm text-muted-foreground">{product.sales} units sold</p>
                  </div>
                  <p className="font-semibold">${product.revenue.toLocaleString()}</p>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Recent Activity */}
        <Card>
          <CardHeader>
            <CardTitle>Recent Activity</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {managerDashboardData.recentActivity.map((activity, index) => (
                <div key={index} className="flex items-start gap-3">
                  <div className="w-2 h-2 rounded-full bg-blue-500 mt-2"></div>
                  <div className="flex-1">
                    <p className="text-sm">{activity.message}</p>
                    <p className="text-xs text-muted-foreground">{activity.time}</p>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Alerts */}
      <Card className="mb-8">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <AlertTriangle className="h-5 w-5" />
            Alerts & Notifications
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="space-y-3">
            {managerDashboardData.alerts.map((alert, index) => (
              <div
                key={index}
                className={`p-3 rounded-lg border ${
                  alert.type === "warning" ? "bg-yellow-50 border-yellow-200" : "bg-blue-50 border-blue-200"
                }`}
              >
                <p className="text-sm">{alert.message}</p>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* New Section: Order Management for Manager */}
      <h2 className="text-2xl font-bold mb-6">Order Management</h2>
      <p className="text-muted-foreground mb-4">Manage orders, refunds, and returns</p>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>All Orders</CardTitle>
            <Button variant="outline" size="sm">
              <Download className="h-4 w-4 mr-2" />
              Export Orders
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

          {/* Order Stats for Manager's Orders */}
          <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Total Orders</CardTitle>
                <Package className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{orderStats.totalOrders}</div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Total Revenue</CardTitle>
                <DollarSign className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">${orderStats.totalRevenue.toFixed(2)}</div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Pending Orders</CardTitle>
                <TrendingUp className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{orderStats.pendingOrders}</div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">Refund Eligible</CardTitle>
                <Users className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{orderStats.refundableOrders}</div>
              </CardContent>
            </Card>
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
                          <Link href={`/manager/orders/${order.id}`}> {/* Link for detailed order view */}
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
                                <Link href={`/manager/orders/${order.id}`} className="w-full">
                                  View Details
                                </Link>
                              </DropdownMenuItem>
                              {order.refundEligible && (
                                <DropdownMenuItem>
                                  <Link href={`/manager/orders/${order.id}/refund`} className="w-full">
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
  )
}