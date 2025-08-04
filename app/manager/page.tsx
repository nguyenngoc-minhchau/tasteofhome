"use client"

import { useState, useEffect } from "react"
import Link from "next/link"
import {
  Package,
  Users,
  ShoppingCart,
  TrendingUp,
  AlertTriangle,
  DollarSign,
  BarChart3,
  RefreshCw,
  Settings,
} from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Alert, AlertDescription } from "@/components/ui/alert"

export default function ManagerDashboard() {
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [userRole, setUserRole] = useState("")
  const [businessStats, setBusinessStats] = useState({
    totalProducts: 156,
    lowStockProducts: 8,
    totalStaff: 12,
    activeOrders: 45,
    todayRevenue: 2847.5,
    monthlyRevenue: 45678.9,
    pendingReturns: 3,
    inventoryValue: 125000,
  })

  // Simulate authentication check - Only Manager can access
  useEffect(() => {
    const checkAuth = () => {
      const role = localStorage.getItem("userRole") || "staff"
      setUserRole(role)
      setIsAuthenticated(role === "manager")
    }
    checkAuth()
  }, [])

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <Card className="w-96">
          <CardHeader>
            <CardTitle className="text-center">Access Denied</CardTitle>
          </CardHeader>
          <CardContent className="text-center space-y-4">
            <AlertTriangle className="h-16 w-16 text-red-500 mx-auto" />
            <div>
              <p className="mb-2">
                You need <strong>Manager</strong> privileges to access the Manager Dashboard.
              </p>
              <p className="text-sm text-muted-foreground">Current role: {userRole || "Not authenticated"}</p>
              <p className="text-xs text-muted-foreground mt-2">
                Manager dashboard is for business operations management.
              </p>
            </div>
            <div className="space-y-2">
              <p className="text-sm text-muted-foreground">For demo purposes, you can simulate Manager role:</p>
              <Button
                onClick={() => {
                  localStorage.setItem("userRole", "manager")
                  window.location.reload()
                }}
              >
                Login as Manager
              </Button>
            </div>
            <div className="flex gap-2">
              <Link href="/admin">
                <Button variant="outline" size="sm">
                  Admin Dashboard
                </Button>
              </Link>
              <Link href="/">
                <Button variant="outline" size="sm">
                  Back to Store
                </Button>
              </Link>
            </div>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold">Manager Dashboard</h1>
              <p className="text-muted-foreground">Manage business operations, products, staff, and inventory</p>
            </div>
            <div className="flex items-center gap-4">
              <Badge variant="secondary">Manager Access</Badge>
              <Link href="/admin">
                <Button variant="outline">Admin Dashboard</Button>
              </Link>
              <Link href="/">
                <Button variant="outline">Back to Store</Button>
              </Link>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* Business Overview */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Today's Revenue</CardTitle>
              <DollarSign className="h-4 w-4 text-green-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-green-600">${businessStats.todayRevenue.toLocaleString()}</div>
              <p className="text-xs text-muted-foreground">+12% from yesterday</p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Active Orders</CardTitle>
              <ShoppingCart className="h-4 w-4 text-blue-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-blue-600">{businessStats.activeOrders}</div>
              <p className="text-xs text-muted-foreground">Processing & shipped</p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Low Stock Items</CardTitle>
              <AlertTriangle className="h-4 w-4 text-yellow-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-yellow-600">{businessStats.lowStockProducts}</div>
              <p className="text-xs text-muted-foreground">Need restocking</p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Staff Members</CardTitle>
              <Users className="h-4 w-4 text-purple-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-purple-600">{businessStats.totalStaff}</div>
              <p className="text-xs text-muted-foreground">Active employees</p>
            </CardContent>
          </Card>
        </div>

        {/* Quick Actions */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
          <Link href="/manager/products">
            <Card className="hover:shadow-md transition-shadow cursor-pointer">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Package className="h-5 w-5" />
                  Product Management
                </CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-muted-foreground mb-4">
                  Add, edit, and manage your product catalog. Update pricing, descriptions, and availability.
                </p>
                <div className="flex items-center justify-between">
                  <span className="text-sm font-medium">Total Products</span>
                  <Badge variant="outline">{businessStats.totalProducts}</Badge>
                </div>
              </CardContent>
            </Card>
          </Link>

          <Link href="/manager/inventory">
            <Card className="hover:shadow-md transition-shadow cursor-pointer">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <RefreshCw className="h-5 w-5" />
                  Inventory Management
                </CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-muted-foreground mb-4">
                  Monitor stock levels, adjust inventory, and manage supplier relationships.
                </p>
                <div className="flex items-center justify-between">
                  <span className="text-sm font-medium">Inventory Value</span>
                  <Badge variant="outline">${businessStats.inventoryValue.toLocaleString()}</Badge>
                </div>
              </CardContent>
            </Card>
          </Link>

          <Link href="/manager/staff">
            <Card className="hover:shadow-md transition-shadow cursor-pointer">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Users className="h-5 w-5" />
                  Staff Management
                </CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-muted-foreground mb-4">
                  Manage employee profiles, schedules, performance, and hiring processes.
                </p>
                <div className="flex items-center justify-between">
                  <span className="text-sm font-medium">Active Staff</span>
                  <Badge variant="outline">{businessStats.totalStaff}</Badge>
                </div>
              </CardContent>
            </Card>
          </Link>

          <Link href="/manager/orders">
            <Card className="hover:shadow-md transition-shadow cursor-pointer">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <ShoppingCart className="h-5 w-5" />
                  Order Management
                </CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-muted-foreground mb-4">
                  Process orders, update shipping status, and handle customer requests.
                </p>
                <div className="flex items-center justify-between">
                  <span className="text-sm font-medium">Active Orders</span>
                  <Badge variant="outline">{businessStats.activeOrders}</Badge>
                </div>
              </CardContent>
            </Card>
          </Link>

          <Link href="/manager/returns">
            <Card className="hover:shadow-md transition-shadow cursor-pointer">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <RefreshCw className="h-5 w-5" />
                  Return Management
                </CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-muted-foreground mb-4">
                  Handle return requests, process refunds, and manage return policies.
                </p>
                <div className="flex items-center justify-between">
                  <span className="text-sm font-medium">Pending Returns</span>
                  <Badge variant="outline">{businessStats.pendingReturns}</Badge>
                </div>
              </CardContent>
            </Card>
          </Link>

          <Link href="/manager/reports">
            <Card className="hover:shadow-md transition-shadow cursor-pointer">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <BarChart3 className="h-5 w-5" />
                  Sales Reports
                </CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-muted-foreground mb-4">
                  View sales analytics, performance metrics, and business insights.
                </p>
                <div className="flex items-center justify-between">
                  <span className="text-sm font-medium">Monthly Revenue</span>
                  <Badge variant="outline">${businessStats.monthlyRevenue.toLocaleString()}</Badge>
                </div>
              </CardContent>
            </Card>
          </Link>
        </div>

        {/* Recent Activity & Alerts */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <Card>
            <CardHeader>
              <CardTitle>Recent Business Activity</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-3">
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-green-500 rounded-full mt-2"></div>
                  <div>
                    <p className="text-sm font-medium">New product added: Organic Matcha Tea</p>
                    <p className="text-xs text-muted-foreground">30 minutes ago</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-blue-500 rounded-full mt-2"></div>
                  <div>
                    <p className="text-sm font-medium">Inventory restocked: Ethiopian Coffee</p>
                    <p className="text-xs text-muted-foreground">2 hours ago</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-purple-500 rounded-full mt-2"></div>
                  <div>
                    <p className="text-sm font-medium">New staff member hired: Sarah Johnson</p>
                    <p className="text-xs text-muted-foreground">5 hours ago</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-orange-500 rounded-full mt-2"></div>
                  <div>
                    <p className="text-sm font-medium">Return processed: Order #ORD-2024-001</p>
                    <p className="text-xs text-muted-foreground">1 day ago</p>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Alerts & Notifications</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <Alert>
                <AlertTriangle className="h-4 w-4" />
                <AlertDescription>
                  <strong>Low Stock Alert:</strong> 8 products are running low on inventory.
                  <Link href="/manager/inventory" className="underline ml-1">
                    Review now
                  </Link>
                </AlertDescription>
              </Alert>

              <Alert>
                <TrendingUp className="h-4 w-4" />
                <AlertDescription>
                  <strong>Sales Update:</strong> Monthly revenue is up 15% compared to last month.
                  <Link href="/manager/reports" className="underline ml-1">
                    View details
                  </Link>
                </AlertDescription>
              </Alert>

              <Alert>
                <Users className="h-4 w-4" />
                <AlertDescription>
                  <strong>Staff Schedule:</strong> 3 staff members need schedule updates for next week.
                  <Link href="/manager/staff" className="underline ml-1">
                    Update schedules
                  </Link>
                </AlertDescription>
              </Alert>
            </CardContent>
          </Card>
        </div>

        {/* Important Notice */}
        <Alert className="mt-8">
          <Settings className="h-4 w-4" />
          <AlertDescription>
            <strong>Manager Notice:</strong> This dashboard is for business operations management. For system
            administration, user management, and role configuration, please use the{" "}
            <Link href="/admin" className="underline font-medium">
              Admin Dashboard
            </Link>
            .
          </AlertDescription>
        </Alert>
      </div>
    </div>
  )
}
