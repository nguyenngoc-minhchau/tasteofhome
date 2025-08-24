"use client"

import { useState, useEffect } from "react"
import Link from "next/link"
import { ArrowLeft, Package, Eye, Download, RefreshCw, Star, LogIn } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { useAuth } from "@/hooks/use-auth"

const statusColors = {
  processing: "bg-blue-500",
  shipped: "bg-orange-500",
  delivered: "bg-green-500",
  cancelled: "bg-red-500",
  // Thêm các trạng thái khác từ database
  "Đang giao": "bg-orange-500",
  "Đã giao": "bg-green-500",
  "Hủy": "bg-red-500",
  "Duyệt": "bg-blue-500",
  "Mới": "bg-gray-500",
}

const statusLabels = {
  processing: "Processing",
  shipped: "Shipped",
  delivered: "Delivered",
  cancelled: "Cancelled",
  // Thêm các trạng thái khác từ database
  "Đang giao": "Đang giao",
  "Đã giao": "Đã giao",
  "Hủy": "Hủy",
  "Duyệt": "Duyệt",
  "Mới": "Mới",
}

// Hàm helper để lấy màu và label cho trạng thái
const getStatusStyle = (status: string) => {
  const color = statusColors[status as keyof typeof statusColors] || "bg-gray-500"
  const label = statusLabels[status as keyof typeof statusLabels] || status
  return { color, label }
}

export default function OrderHistoryPage() {
  const { isAuthenticated, user, loading } = useAuth()
  const [selectedTab, setSelectedTab] = useState("all")
  const [orders, setOrders] = useState<any[]>([])
  const [ordersLoading, setOrdersLoading] = useState(false)

  // Fetch orders from API
  const fetchOrders = async () => {
    if (!isAuthenticated) return
    
    setOrdersLoading(true)
    try {
      const res = await fetch("/api/orders")
      if (res.ok) {
        const data = await res.json()
        setOrders(data)
      } else if (res.status === 401) {
        // Unauthorized - redirect to login
        setOrders([])
      } else {
        setOrders([])
      }
    } catch (error) {
      setOrders([])
    }
    setOrdersLoading(false)
  }

  useEffect(() => {
    if (isAuthenticated) {
      fetchOrders()
    }
  }, [isAuthenticated])

  const filteredOrders = Array.isArray(orders) ? orders.filter((order) => {
    if (selectedTab === "all") return true
    return order.status === selectedTab
  }) : []

  // Nếu đang loading auth, hiển thị loading
  if (loading) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="text-center">Đang tải...</div>
      </div>
    )
  }

  // Nếu chưa đăng nhập, hiển thị trang yêu cầu đăng nhập
  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-background">
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
                <ArrowLeft className="h-5 w-5" />
                Quay lại cửa hàng
              </Link>
              <h1 className="text-2xl font-bold">Lịch sử đơn hàng</h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        <div className="container mx-auto px-4 py-16">
          <div className="max-w-md mx-auto text-center">
            <LogIn className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
            <h2 className="text-2xl font-bold mb-4">Bạn cần đăng nhập</h2>
            <p className="text-muted-foreground mb-8">
              Để xem lịch sử đơn hàng, bạn cần đăng nhập vào tài khoản của mình.
            </p>
            <div className="space-y-3">
              <Link href="/auth">
                <Button size="lg" className="w-full">
                  Đăng nhập
                </Button>
              </Link>
              <Link href="/">
                <Button variant="outline" className="w-full">
                  Tiếp tục mua sắm
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Top welcome bar */}
    <div className="bg-red-700 text-white text-sm text-center py-2">
      Chào mừng đến Taste Of Home
    </div>

      {/* Header */}
      <header className="bg-beige text-black border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Quay lại cửa hàng
            </Link>
            <div className="text-center">
              <h1 className="text-2xl font-bold">Lịch sử đơn hàng</h1>
              {user && (
                <p className="text-sm text-muted-foreground">
                  Xin chào, {user.name || user.username}
                </p>
              )}
            </div>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto">
          <div className="flex items-center justify-between mb-8">
            <div>
              <h2 className="text-3xl font-bold">Đơn hàng của bạn</h2>
              <p className="text-muted-foreground">Theo dõi và quản lý lịch sử đơn hàng</p>
            </div>
            <Button variant="outline" size="sm" onClick={fetchOrders} disabled={ordersLoading}>
              <RefreshCw className={`h-4 w-4 mr-2 ${ordersLoading ? 'animate-spin' : ''}`} />
              Làm mới
            </Button>
          </div>
          {/* Order Filters */}
          <Tabs value={selectedTab} onValueChange={setSelectedTab} className="mb-8">
            <TabsList className="grid w-full grid-cols-5">
              <TabsTrigger value="all">Tất cả</TabsTrigger>
              <TabsTrigger value="processing">Đang xử lý</TabsTrigger>
              <TabsTrigger value="shipped">Đang giao</TabsTrigger>
              <TabsTrigger value="delivered">Đã giao</TabsTrigger>
              <TabsTrigger value="cancelled">Đã hủy</TabsTrigger>
            </TabsList>

            <TabsContent value={selectedTab} className="mt-6">
              {ordersLoading ? (
                <div className="text-center py-12">Đang tải...</div>
              ) : filteredOrders.length === 0 ? (
                <div className="text-center py-12">
                  <Package className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
                  <h3 className="text-xl font-semibold mb-2">Không tìm thấy đơn hàng</h3>
                  <p className="text-muted-foreground mb-6">
                    {selectedTab === "all" ? "Bạn chưa đặt đơn hàng nào." : `Không tìm thấy đơn hàng ${selectedTab}.`}
                  </p>
                  <Link href="/">
                    <Button>Bắt đầu mua sắm</Button>
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
                              Đặt hàng ngày {new Date(order.created_at).toLocaleDateString('vi-VN')}
                            </p>
                            {order.fullname && (
                              <p className="text-sm text-muted-foreground">
                                Khách hàng: {order.fullname}
                              </p>
                            )}
                          </div>
                          <div className="text-right">
                            <Badge className={getStatusStyle(order.status).color}>
                              {getStatusStyle(order.status).label}
                            </Badge>
                            <p className="text-lg font-semibold mt-1">
                              {order.total ? `${order.total.toLocaleString('vi-VN')} VNĐ` : ""}
                            </p>
                          </div>
                        </div>
                      </CardHeader>
                      <CardContent>
                        <div className="space-y-4">
                          <div className="grid grid-cols-2 gap-4 text-sm">
                            <div>
                              <span className="font-medium">Email: </span>
                              <span>{order.email || "Không có"}</span>
                            </div>
                            <div>
                              <span className="font-medium">SĐT: </span>
                              <span>{order.phone || "Không có"}</span>
                            </div>
                          </div>
                          {order.address && (
                            <div className="text-sm">
                              <span className="font-medium">Địa chỉ: </span>
                              <span>{order.address}</span>
                            </div>
                          )}
                          <div className="grid grid-cols-2 gap-4 text-sm">
                            <div>
                              <span className="font-medium">Thanh toán: </span>
                              <span className={order.paymentStatus === "1" ? "text-green-600" : "text-red-600"}>
                                {order.paymentStatus === "1" ? "Đã thanh toán" : "Chưa thanh toán"}
                              </span>
                            </div>
                            <div>
                              <span className="font-medium">Phương thức: </span>
                              <span>{order.paymentMethod || "Không xác định"}</span>
                            </div>
                          </div>
                          <div className="flex gap-2 pt-2">
                            <Link href={`/orders/${order.id}`}>
                              <Button variant="outline" size="sm">
                                <Eye className="h-4 w-4 mr-2" />
                                Xem chi tiết
                              </Button>
                            </Link>
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
      {/* Footer */}
      <footer className="bg-beige text-black mt-12">
        <div className="container mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-3 gap-6 text-sm text-center md:text-left">
          {/* Logo & liên hệ */}
          <div>
            <img src="/logo.png" alt="TasteOfHome Logo" className="h-12 mb-3 mx-auto md:mx-0" />
            <p>Địa chỉ: 227 Nguyễn Văn Cừ, phường Chợ Quán, TP.HCM</p>
            <p>Hotline: 0123 456 789</p>
            <p>Email: support@tasteofhome.com</p>
          </div>

          {/* Danh mục chính */}
          <div>
            <h3 className="font-semibold mb-2">Danh mục chính</h3>
            <ul className="space-y-1">
              <li>Rau củ quả</li>
              <li>Thịt cá</li>
              <li>Đặc sản vùng miền</li>
              <li>Gia vị & Nước chấm</li>
            </ul>
          </div>

          {/* Giới thiệu ngắn */}
          <div>
            <h3 className="font-semibold mb-2">Về chúng tôi</h3>
            <p>
              TasteOfHome mang hương vị quê hương đến từng bữa ăn của bạn. 
              Cam kết sản phẩm sạch, chất lượng, an toàn và giao hàng tận nơi.
            </p>
          </div>
        </div>

        {/* Bản quyền */}
        <div className="bg-black text-center text-white py-3 text-xs">
          © 2025 TasteOfHome. All rights reserved.
        </div>
      </footer>
    </div>
  )
}
