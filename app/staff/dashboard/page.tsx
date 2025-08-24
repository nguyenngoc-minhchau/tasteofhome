"use client"

import { useState, useEffect } from "react"
import { Clock, MessageCircle, Truck, LogOut } from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { useAuth } from "@/hooks/use-auth"
import { useRouter } from "next/navigation"

const staffDashboardData = {
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
}

export default function StaffDashboardPage() {
  const { user, isLoggedIn, loading, logout } = useAuth()
  const router = useRouter()

  useEffect(() => {
    if (isLoggedIn === null) return

    if (isLoggedIn === false) {
      router.replace("/auth")
    } else if (user && user.role !== "staff") {
      router.replace(user.role === "customer" ? "/" : "/dashboard")
    }
  }, [isLoggedIn, user, router])

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
    <div className="min-h-screen bg-background p-6">
      <header className="border-b mb-6 pb-4 flex justify-between items-center">
        <div>
          <h2 className="text-3xl font-bold mb-2">Staff Dashboard</h2>
          <p className="text-muted-foreground">
            Track orders, manage shipments, and handle customer support requests
          </p>
        </div>
        <Button variant="outline" onClick={handleLogout}>
          <LogOut className="h-4 w-4 mr-2" />
          Logout
        </Button>
      </header>

      {/* Staff Metrics */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Pending Orders</CardTitle>
            <Clock className="h-4 w-4 text-yellow-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-yellow-600">{staffDashboardData.pendingOrders}</div>
            <p className="text-xs text-muted-foreground">Require processing</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Shipped Orders</CardTitle>
            <Truck className="h-4 w-4 text-green-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-green-600">{staffDashboardData.shippedOrders}</div>
            <p className="text-xs text-muted-foreground">This week</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Support Tickets</CardTitle>
            <MessageCircle className="h-4 w-4 text-blue-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-blue-600">{staffDashboardData.supportTickets}</div>
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
              {staffDashboardData.recentOrders.map((order) => (
                <div key={order.id} className="flex items-center justify-between">
                  <div>
                    <p className="font-medium">{order.id}</p>
                    <p className="text-sm text-muted-foreground">{order.customer}</p>
                  </div>
                  <div className="text-right">
                    <p className="font-semibold">${order.amount}</p>
                    <Badge
                      variant={
                        order.status === "shipped"
                          ? "default"
                          : order.status === "processing"
                          ? "secondary"
                          : "outline"
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
              {staffDashboardData.supportRequests.map((request) => (
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
}
