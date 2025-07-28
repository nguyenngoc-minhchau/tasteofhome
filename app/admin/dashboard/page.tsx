"use client"

import { useState } from "react"
import Link from "next/link"
import {
  ArrowLeft,
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
} from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"

// Mock data for different user roles
const dashboardData = {
  manager: {
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
  },
  staff: {
    pendingOrders: 23,
    shippedOrders: 156,
    supportTickets: 8,
    recentOrders: [
      { id: "ORD-2024-047", customer: "John Smith", status: "processing", amount: 67.48 },
      { id: "ORD-2024-046", customer: "Sarah Johnson", status: "shipped", amount: 89.99 },
      { id: "ORD-2024-045", customer: "Mike Davis", status: "pending", amount: 156.75 },
    ],
    supportRequests: [
      { id: "SUP-123456", customer: "Alice Brown", subject: "Order delivery question", priority: "medium" },
      { id: "SUP-123455", customer: "Bob Wilson", subject: "Product return request", priority: "high" },
      { id: "SUP-123454", customer: "Carol Lee", subject: "Account login issue", priority: "low" },
    ],
  },
  administrator: {
    systemHealth: 98.5,
    userRegistrations: 1247,
    newUsersToday: 23,
    systemLogs: [
      { type: "info", message: "Database backup completed successfully", time: "3:00 AM" },
      { type: "warning", message: "High CPU usage detected on server-2", time: "2:45 AM" },
      { type: "success", message: "Security scan completed - no issues found", time: "2:00 AM" },
    ],
    platformMetrics: {
      uptime: "99.9%",
      responseTime: "245ms",
      errorRate: "0.1%",
      activeUsers: 892,
    },
  },
}

export default function RoleBasedDashboard() {
  const [userRole, setUserRole] = useState("manager")

  const renderManagerDashboard = () => (
    <div className="space-y-6">
      {/* Key Metrics */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Orders Today</CardTitle>
            <ShoppingCart className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{dashboardData.manager.todayOrders}</div>
            <p className="text-xs text-green-600">+12% from yesterday</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Week Revenue</CardTitle>
            <DollarSign className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">${dashboardData.manager.weekRevenue.toLocaleString()}</div>
            <p className="text-xs text-green-600">+8% from last week</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Month Revenue</CardTitle>
            <TrendingUp className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">${dashboardData.manager.monthRevenue.toLocaleString()}</div>
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

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Top Products */}
        <Card>
          <CardHeader>
            <CardTitle>Top Selling Products</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {dashboardData.manager.topProducts.map((product, index) => (
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
              {dashboardData.manager.recentActivity.map((activity, index) => (
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
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <AlertTriangle className="h-5 w-5" />
            Alerts & Notifications
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="space-y-3">
            {dashboardData.manager.alerts.map((alert, index) => (
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
    </div>
  )

  const renderStaffDashboard = () => (
    <div className="space-y-6">
      {/* Staff Metrics */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Pending Orders</CardTitle>
            <Clock className="h-4 w-4 text-yellow-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-yellow-600">{dashboardData.staff.pendingOrders}</div>
            <p className="text-xs text-muted-foreground">Require processing</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Shipped Orders</CardTitle>
            <Truck className="h-4 w-4 text-green-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-green-600">{dashboardData.staff.shippedOrders}</div>
            <p className="text-xs text-muted-foreground">This week</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Support Tickets</CardTitle>
            <MessageCircle className="h-4 w-4 text-blue-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-blue-600">{dashboardData.staff.supportTickets}</div>
            <p className="text-xs text-muted-foreground">Open tickets</p>
          </CardContent>
        </Card>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Recent Orders */}
        <Card>
          <CardHeader>
            <CardTitle>Recent Orders</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {dashboardData.staff.recentOrders.map((order) => (
                <div key={order.id} className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">{order.id}</p>
                    <p className="text-sm text-muted-foreground">{order.customer}</p>
                  </div>
                  <div className="text-right">
                    <p className="font-semibold">${order.amount}</p>
                    <Badge
                      variant={
                        order.status === "shipped" ? "default" : order.status === "processing" ? "secondary" : "outline"
                      }
                    >
                      {order.status}
                    </Badge>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Support Requests */}
        <Card>
          <CardHeader>
            <CardTitle>Recent Support Requests</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {dashboardData.staff.supportRequests.map((request) => (
                <div key={request.id} className="space-y-2">
                  <div className="flex items-center justify-between">
                    <p className="font-medium text-sm">{request.id}</p>
                    <Badge
                      variant={
                        request.priority === "high"
                          ? "destructive"
                          : request.priority === "medium"
                            ? "default"
                            : "secondary"
                      }
                    >
                      {request.priority}
                    </Badge>
                  </div>
                  <p className="text-sm text-muted-foreground">{request.customer}</p>
                  <p className="text-sm">{request.subject}</p>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )

  const renderAdministratorDashboard = () => (
    <div className="space-y-6">
      {/* System Metrics */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">System Health</CardTitle>
            <Activity className="h-4 w-4 text-green-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-green-600">{dashboardData.administrator.systemHealth}%</div>
            <p className="text-xs text-muted-foreground">All systems operational</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Total Users</CardTitle>
            <Users className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{dashboardData.administrator.userRegistrations.toLocaleString()}</div>
            <p className="text-xs text-green-600">+{dashboardData.administrator.newUsersToday} today</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Uptime</CardTitle>
            <CheckCircle className="h-4 w-4 text-green-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{dashboardData.administrator.platformMetrics.uptime}</div>
            <p className="text-xs text-muted-foreground">Last 30 days</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Response Time</CardTitle>
            <TrendingUp className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{dashboardData.administrator.platformMetrics.responseTime}</div>
            <p className="text-xs text-green-600">Excellent performance</p>
          </CardContent>
        </Card>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* System Logs */}
        <Card>
          <CardHeader>
            <CardTitle>Recent System Logs</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {dashboardData.administrator.systemLogs.map((log, index) => (
                <div key={index} className="flex items-start gap-3">
                  <div
                    className={`w-2 h-2 rounded-full mt-2 ${
                      log.type === "success" ? "bg-green-500" : log.type === "warning" ? "bg-yellow-500" : "bg-blue-500"
                    }`}
                  ></div>
                  <div className="flex-1">
                    <p className="text-sm">{log.message}</p>
                    <p className="text-xs text-muted-foreground">{log.time}</p>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Platform Health */}
        <Card>
          <CardHeader>
            <CardTitle>Platform Health Indicators</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              <div className="flex justify-between">
                <span className="text-sm">System Uptime</span>
                <span className="text-sm font-medium text-green-600">
                  {dashboardData.administrator.platformMetrics.uptime}
                </span>
              </div>
              <div className="flex justify-between">
                <span className="text-sm">Average Response Time</span>
                <span className="text-sm font-medium">{dashboardData.administrator.platformMetrics.responseTime}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-sm">Error Rate</span>
                <span className="text-sm font-medium text-green-600">
                  {dashboardData.administrator.platformMetrics.errorRate}
                </span>
              </div>
              <div className="flex justify-between">
                <span className="text-sm">Active Users</span>
                <span className="text-sm font-medium">{dashboardData.administrator.platformMetrics.activeUsers}</span>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div>
              <Link href="/admin" className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-2">
                <ArrowLeft className="h-5 w-5" />
                Back to Admin
              </Link>
              <h1 className="text-2xl font-bold">Role-Based Dashboard</h1>
              <p className="text-muted-foreground">Customized view based on your role and responsibilities</p>
            </div>
            <div className="flex items-center gap-4">
              <Select value={userRole} onValueChange={setUserRole}>
                <SelectTrigger className="w-40">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="manager">Manager</SelectItem>
                  <SelectItem value="staff">Staff</SelectItem>
                  <SelectItem value="administrator">Administrator</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="mb-6">
          <h2 className="text-xl font-semibold capitalize">{userRole} Dashboard</h2>
          <p className="text-muted-foreground">
            {userRole === "manager" && "Overview of sales performance, top products, and business metrics"}
            {userRole === "staff" && "Track orders, manage shipments, and handle customer support requests"}
            {userRole === "administrator" && "Monitor system health, user activity, and platform performance"}
          </p>
        </div>

        {userRole === "manager" && renderManagerDashboard()}
        {userRole === "staff" && renderStaffDashboard()}
        {userRole === "administrator" && renderAdministratorDashboard()}
      </div>
    </div>
  )
}
