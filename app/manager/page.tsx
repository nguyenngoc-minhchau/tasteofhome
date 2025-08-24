"use client"

import { useState, useEffect } from "react"
import { useRouter } from "next/navigation"
import Link from "next/link"
import { useAuth } from "@/hooks/use-auth"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Alert, AlertDescription } from "@/components/ui/alert"
import {
  Package,
  Users,
  ShoppingCart,
  TrendingUp,
  AlertTriangle,
  DollarSign,
  BarChart3,
  RefreshCw,
  LogOut
} from "lucide-react"

export default function ManagerDashboard() {
  const { user, isLoggedIn, loading, logout } = useAuth()
  const router = useRouter()

  const [businessStats] = useState({
    totalProducts: 156,
    lowStockProducts: 8,
    totalStaff: 12,
    activeOrders: 45,
    todayRevenue: 2847.5,
    monthlyRevenue: 45678.9,
    pendingReturns: 3,
    inventoryValue: 125000,
  })

  // Wait for auth to resolve before redirect
  useEffect(() => {
    // user or isLoggedIn not yet loaded
    if (isLoggedIn === null) return

    if (isLoggedIn === false) {
      router.replace("/auth")
    } else if (user && user.role !== "manager") {
      router.replace(user.role === "customer" ? "/" : "/dashboard")
    }
  }, [isLoggedIn, user, router])

  // Show loading only if user is undefined or null
  if (isLoggedIn === null || !user) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p>Loading...</p>
      </div>
    )
  }

  const handleLogout = () => {
    logout()
    router.replace("/auth")
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4 flex justify-between items-center">
          <div>
            <h1 className="text-3xl font-bold">Manager Dashboard</h1>
            <p className="text-muted-foreground">
              Manage products, staff, orders, and inventory
            </p>
          </div>
          <div className="flex gap-4 items-center">
            <Badge variant="secondary">Manager Access</Badge>
            <Button variant="outline" onClick={handleLogout}>
              <LogOut className="mr-2 h-4 w-4" />
              Logout
            </Button>
          </div>
        </div>
      </header>

      {/* Main dashboard cards */}
      <div className="container mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card>
          <CardHeader className="flex justify-between pb-2">
            <CardTitle className="text-sm font-medium">Today's Revenue</CardTitle>
            <DollarSign className="h-4 w-4 text-green-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-green-600">
              ${businessStats.todayRevenue.toLocaleString()}
            </div>
            <p className="text-xs text-muted-foreground">+12% from yesterday</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex justify-between pb-2">
            <CardTitle className="text-sm font-medium">Active Orders</CardTitle>
            <ShoppingCart className="h-4 w-4 text-blue-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-blue-600">
              {businessStats.activeOrders}
            </div>
            <p className="text-xs text-muted-foreground">Processing & shipped</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex justify-between pb-2">
            <CardTitle className="text-sm font-medium">Low Stock Items</CardTitle>
            <AlertTriangle className="h-4 w-4 text-yellow-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-yellow-600">
              {businessStats.lowStockProducts}
            </div>
            <p className="text-xs text-muted-foreground">Need restocking</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex justify-between pb-2">
            <CardTitle className="text-sm font-medium">Staff Members</CardTitle>
            <Users className="h-4 w-4 text-purple-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-purple-600">
              {businessStats.totalStaff}
            </div>
            <p className="text-xs text-muted-foreground">Active employees</p>
          </CardContent>
        </Card>
      </div>

      {/* Quick action links */}
      <div className="container mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <Link href="/manager/products">
          <Card className="hover:shadow-md transition-shadow cursor-pointer">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Package className="h-5 w-5" />
                Product Management
              </CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-sm text-muted-foreground mb-2">
                Add, edit, and manage your product catalog
              </p>
              <Badge variant="outline">{businessStats.totalProducts}</Badge>
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
              <p className="text-sm text-muted-foreground mb-2">
                Monitor stock and manage suppliers
              </p>
              <Badge variant="outline">${businessStats.inventoryValue.toLocaleString()}</Badge>
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
              <p className="text-sm text-muted-foreground mb-2">
                Manage employee profiles and schedules
              </p>
              <Badge variant="outline">{businessStats.totalStaff}</Badge>
            </CardContent>
          </Card>
        </Link>
      </div>
    </div>
  )
}
