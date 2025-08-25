"use client"

import { useState, useEffect } from "react"
import { Clock, MessageCircle, Truck, LogOut, Package, Users } from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { useAuth } from "@/hooks/use-auth"
import { useRouter } from "next/navigation"
import Link from "next/link"

interface Order {
  id: number
  inv_code: string
  fullname: string
  totalamount: number
  status: string
  created_at: string
}

interface DashboardStats {
  pendingOrders: number
  shippedOrders: number
  totalOrders: number
}

export default function StaffDashboardPage() {
  const { user, isAuthenticated, loading, logout } = useAuth()
  const router = useRouter()
  const [recentOrders, setRecentOrders] = useState<Order[]>([])
  const [stats, setStats] = useState<DashboardStats>({
    pendingOrders: 0,
    shippedOrders: 0,
    totalOrders: 0
  })
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    if (loading) return

    if (!isAuthenticated) {
      router.replace("/auth")
    } else if (user && user.role !== "staff") {
      router.replace(user.role === "customer" ? "/" : "/dashboard")
    }
  }, [isAuthenticated, user, router, loading])

  useEffect(() => {
    if (user && user.role === "staff") {
      fetchDashboardData()
    }
  }, [user])

  const fetchDashboardData = async () => {
    try {
      setIsLoading(true)
      
      // Fetch orders from database
      const response = await fetch("/api/orders/staff")
      if (!response.ok) {
        throw new Error("Failed to fetch orders")
      }
      
      const orders: Order[] = await response.json()
      
      // Calculate stats
      const pendingOrders = orders.filter(order => order.status === "pending").length
      const shippedOrders = orders.filter(order => 
        ["shipped", "out_for_delivery", "delivered"].includes(order.status)
      ).length
      
      setStats({
        pendingOrders,
        shippedOrders,
        totalOrders: orders.length
      })
      
      // Get 5 most recent orders
      const sortedOrders = orders
        .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
        .slice(0, 5)
      
      setRecentOrders(sortedOrders)
    } catch (error) {
      console.error("Error fetching dashboard data:", error)
    } finally {
      setIsLoading(false)
    }
  }

  const getStatusBadgeVariant = (status: string) => {
    switch (status) {
      case "shipped":
      case "out_for_delivery":
      case "delivered":
        return "default"
      case "processing":
        return "secondary"
      case "pending":
      default:
        return "outline"
    }
  }

  const getStatusLabel = (status: string) => {
    switch (status) {
      case "pending":
        return "Chờ xử lý"
      case "processing":
        return "Đang xử lý"
      case "shipped":
        return "Đã gửi"
      case "out_for_delivery":
        return "Đang giao"
      case "delivered":
        return "Đã giao"
      case "cancelled":
        return "Đã hủy"
      default:
        return status
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p>Loading...</p>
      </div>
    )
  }

  if (!isAuthenticated || !user) {
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
          <h2 className="text-3xl font-bold mb-2">Bảng điều khiển Staff</h2>
          <p className="text-muted-foreground">
            Theo dõi đơn hàng, quản lý vận chuyển và xử lý yêu cầu hỗ trợ khách hàng
          </p>
        </div>
        <Button variant="outline" onClick={handleLogout}>
          <LogOut className="h-4 w-4 mr-2" />
          Đăng xuất
        </Button>
      </header>

      {/* Quick Actions */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <Link href="/staff/orders">
          <Card className="hover:shadow-lg transition-shadow cursor-pointer">
            <CardContent className="p-6">
              <div className="flex items-center space-x-4">
                <div className="p-3 bg-blue-100 rounded-lg">
                  <Package className="h-8 w-8 text-blue-600" />
                </div>
                <div>
                  <h3 className="font-semibold">Quản lý đơn hàng</h3>
                  <p className="text-sm text-muted-foreground">Cập nhật trạng thái đơn hàng</p>
                </div>
              </div>
            </CardContent>
          </Card>
        </Link>

        <Link href="/staff/support">
          <Card className="hover:shadow-lg transition-shadow cursor-pointer">
            <CardContent className="p-6">
              <div className="flex items-center space-x-4">
                <div className="p-3 bg-green-100 rounded-lg">
                  <MessageCircle className="h-8 w-8 text-green-600" />
                </div>
                <div>
                  <h3 className="font-semibold">Hỗ trợ khách hàng</h3>
                  <p className="text-sm text-muted-foreground">Xử lý yêu cầu hỗ trợ</p>
                </div>
              </div>
            </CardContent>
          </Card>
        </Link>

        <Link href="/staff/inventory">
          <Card className="hover:shadow-lg transition-shadow cursor-pointer">
            <CardContent className="p-6">
              <div className="flex items-center space-x-4">
                <div className="p-3 bg-purple-100 rounded-lg">
                  <Users className="h-8 w-8 text-purple-600" />
                </div>
                <div>
                  <h3 className="font-semibold">Quản lý kho</h3>
                  <p className="text-sm text-muted-foreground">Kiểm tra tồn kho</p>
                </div>
              </div>
            </CardContent>
          </Card>
        </Link>
      </div>

      {/* Staff Metrics */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Đơn hàng chờ xử lý</CardTitle>
            <Clock className="h-4 w-4 text-yellow-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-yellow-600">
              {isLoading ? "..." : stats.pendingOrders}
            </div>
            <p className="text-xs text-muted-foreground">Cần xử lý</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Đơn hàng đã gửi</CardTitle>
            <Truck className="h-4 w-4 text-green-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-green-600">
              {isLoading ? "..." : stats.shippedOrders}
            </div>
            <p className="text-xs text-muted-foreground">Tuần này</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Tổng số đơn hàng</CardTitle>
            <Package className="h-4 w-4 text-blue-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-blue-600">
              {isLoading ? "..." : stats.totalOrders}
            </div>
            <p className="text-xs text-muted-foreground">Tất cả thời gian</p>
          </CardContent>
        </Card>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Recent Orders */}
        <Card>
          <CardHeader>
            <CardTitle>Đơn hàng gần đây</CardTitle>
          </CardHeader>
          <CardContent>
            {isLoading ? (
              <div className="space-y-4">
                {[1, 2, 3].map((i) => (
                  <div key={i} className="flex items-center justify-between">
                    <div className="space-y-2">
                      <div className="h-4 bg-gray-200 rounded w-24"></div>
                      <div className="h-3 bg-gray-200 rounded w-32"></div>
                    </div>
                    <div className="space-y-2 text-right">
                      <div className="h-4 bg-gray-200 rounded w-16"></div>
                      <div className="h-5 bg-gray-200 rounded w-20"></div>
                    </div>
                  </div>
                ))}
              </div>
            ) : recentOrders.length === 0 ? (
              <div className="text-center py-8 text-muted-foreground">
                Chưa có đơn hàng nào
              </div>
            ) : (
              <div className="space-y-4">
                {recentOrders.map((order) => (
                  <div key={order.id} className="flex items-center justify-between">
                    <div>
                      <p className="font-medium">{order.inv_code}</p>
                      <p className="text-sm text-muted-foreground">
                        {order.fullname || "Khách hàng"}
                      </p>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold">
                        {new Intl.NumberFormat("vi-VN", {
                          style: "currency",
                          currency: "VND"
                        }).format(order.totalamount)}
                      </p>
                      <Badge variant={getStatusBadgeVariant(order.status)}>
                        {getStatusLabel(order.status)}
                      </Badge>
                    </div>
                  </div>
                ))}
                <div className="pt-2">
                  <Link href="/staff/orders">
                    <Button variant="outline" size="sm" className="w-full">
                      Xem tất cả đơn hàng
                    </Button>
                  </Link>
                </div>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Support Requests - Giữ nguyên mock data cho phần này */}
        <Card>
          <CardHeader>
            <CardTitle>Yêu cầu hỗ trợ gần đây</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              <div className="text-center py-8 text-muted-foreground">
                Tính năng hỗ trợ khách hàng sẽ được phát triển sau
              </div>
              <div className="pt-2">
                <Link href="/staff/support">
                  <Button variant="outline" size="sm" className="w-full">
                    Xem tất cả yêu cầu hỗ trợ
                  </Button>
                </Link>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
