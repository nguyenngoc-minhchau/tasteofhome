"use client"

import Image from "next/image"
import { useState, useEffect } from "react"
import { useParams, useRouter } from "next/navigation"
import Link from "next/link"
import { ArrowLeft, Package, CheckCircle, Truck, MapPin, CreditCard, Calendar } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Separator } from "@/components/ui/separator"
import { Progress } from "@/components/ui/progress"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { useAuth } from "@/hooks/use-auth"

const statusColors = {
  "Mới": "bg-gray-500",
  "Duyệt": "bg-blue-500",
  "Đang giao": "bg-orange-500",
  "Đã giao": "bg-green-500",
  "Hủy": "bg-red-500",
}

const statusIcons = {
  "Mới": Package,
  "Duyệt": CheckCircle,
  "Đang giao": Truck,
  "Đã giao": CheckCircle,
  "Hủy": Package,
}

const getStatusStyle = (status: string) => {
  const color = statusColors[status as keyof typeof statusColors] || "bg-gray-500"
  const Icon = statusIcons[status as keyof typeof statusIcons] || Package
  return { color, Icon }
}

const StatusIcon = ({ status }: { status: string }) => {
  const { Icon } = getStatusStyle(status)
  return <Icon className="h-4 w-4" />
}

export default function OrderDetailPage() {
  const { id } = useParams()
  const router = useRouter()
  const { isAuthenticated, loading } = useAuth()
  const [order, setOrder] = useState<any>(null)
  const [orderLoading, setOrderLoading] = useState(false)

  useEffect(() => {
    if (isAuthenticated && id) {
      fetchOrder()
    }
  }, [isAuthenticated, id])

  const fetchOrder = async () => {
    setOrderLoading(true)
    try {
      const res = await fetch(`/api/orders/${id}`)
      if (res.ok) {
        const data = await res.json()
        setOrder(data)
      } else if (res.status === 401) {
        // Unauthorized - redirect to orders page
        router.push('/orders')
      } else if (res.status === 404) {
        // Order not found
        setOrder(null)
      }
    } catch (error) {
      console.error("Error fetching order:", error)
      setOrder(null)
    }
    setOrderLoading(false)
  }

  // Nếu đang loading auth, hiển thị loading
  if (loading) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="text-center">Đang tải...</div>
      </div>
    )
  }

  // Nếu chưa đăng nhập, redirect về trang orders
  if (!isAuthenticated) {
    router.push('/orders')
    return null
  }

  // Nếu đang loading order, hiển thị loading
  if (orderLoading) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="text-center">Đang tải thông tin đơn hàng...</div>
      </div>
    )
  }

  // Nếu không tìm thấy order
  if (!order) {
    return (
      <div className="min-h-screen bg-background">
        {/* Welcome bar */}
        <div className="bg-red-700 text-white text-sm text-center py-2">
          Chào mừng đến Taste Of Home
        </div>

        <header className="bg-beige text-black border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link href="/orders" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
                <ArrowLeft className="h-5 w-5" />
                Quay lại lịch sử đơn hàng
              </Link>
              <h1 className="text-2xl font-bold">Chi tiết đơn hàng</h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        <div className="container mx-auto px-4 py-16">
          <div className="max-w-md mx-auto text-center">
            <Package className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
            <h2 className="text-2xl font-bold mb-4">Không tìm thấy đơn hàng</h2>
            <p className="text-muted-foreground mb-8">
              Đơn hàng bạn đang tìm kiếm không tồn tại hoặc bạn không có quyền xem.
            </p>
            <Link href="/orders">
              <Button>Quay lại lịch sử đơn hàng</Button>
            </Link>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-background">
        {/* Welcome bar */}
        <div className="bg-red-700 text-white text-sm text-center py-2">
          Chào mừng đến Taste Of Home
        </div>
      {/* Header */}
      <header className="bg-beige text-black border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/orders" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Quay lại lịch sử đơn hàng
            </Link>
            <h1 className="text-2xl font-bold text-center -translate-x-20">Chi tiết đơn hàng</h1>
            <Badge className={getStatusStyle(order.status).color}>
              <StatusIcon status={order.status} />
              <span className="ml-2">{order.status}</span>
            </Badge>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto space-y-6">
          {/* Order Summary */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Package className="h-5 w-5" />
                Thông tin đơn hàng
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="font-medium">Mã đơn hàng:</span>
                    <span className="font-mono">{order.id}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Ngày đặt:</span>
                    <span>{new Date(order.date).toLocaleDateString('vi-VN')}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Trạng thái:</span>
                    <Badge className={getStatusStyle(order.status).color}>
                      {order.status}
                    </Badge>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Tổng tiền:</span>
                    <span className="font-semibold text-lg">
                      {order.total?.toLocaleString('vi-VN')} VNĐ
                    </span>
                  </div>
                </div>
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="font-medium">Tạm tính:</span>
                    <span>{order.subtotal?.toLocaleString('vi-VN')} VNĐ</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Phí vận chuyển:</span>
                    <span>{order.shipping?.toLocaleString('vi-VN')} VNĐ</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Thuế:</span>
                    <span>{order.tax?.toLocaleString('vi-VN')} VNĐ</span>
                  </div>
                  <Separator />
                  <div className="flex justify-between font-semibold">
                    <span>Tổng cộng:</span>
                    <span className="text-lg">{order.total?.toLocaleString('vi-VN')} VNĐ</span>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Payment Information */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <CreditCard className="h-5 w-5" />
                Thông tin thanh toán
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="font-medium">Trạng thái thanh toán:</span>
                    <Badge className={order.paymentStatus === "paid" ? "bg-green-500" : "bg-red-500"}>
                      {order.paymentStatus === "paid" ? "Đã thanh toán" : "Chưa thanh toán"}
                    </Badge>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Phương thức:</span>
                    <span>
                      {order.paymentMethod === "Credit Card" ? "Thẻ tín dụng" :
                       order.paymentMethod === "Cash" ? "Tiền mặt" :
                       order.paymentMethod === "Bank Transfer" ? "Chuyển khoản ngân hàng" :
                       order.paymentMethod || "Không xác định"}
                    </span>
                  </div>
                </div>
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="font-medium">Ngày thanh toán:</span>
                    <span>{order.date ? new Date(order.date).toLocaleDateString('vi-VN') : "Chưa thanh toán"}</span>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Delivery Information */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Truck className="h-5 w-5" />
                Thông tin giao hàng
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="font-medium">Dự kiến giao hàng:</span>
                    <span>
                      {order.estimatedDelivery 
                        ? new Date(order.estimatedDelivery).toLocaleDateString('vi-VN')
                        : "Chưa xác định"
                      }
                    </span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Ngày giao thực tế:</span>
                    <span>
                      {order.actualDelivery 
                        ? new Date(order.actualDelivery).toLocaleDateString('vi-VN')
                        : "Chưa giao"
                      }
                    </span>
                  </div>
                </div>
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="font-medium">Địa chỉ giao hàng:</span>
                    <span className="text-right max-w-xs">{order.customer?.address || "Không có"}</span>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Order Progress */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Calendar className="h-5 w-5" />
                Tiến trình đơn hàng
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {(() => {
                  // Tạo timeline dựa trên trạng thái hiện tại
                  const timeline = [
                    {
                      title: "Đơn hàng đã được tạo",
                      description: "Đơn hàng của bạn đã được tiếp nhận",
                      completed: true,
                      date: order.date
                    },
                    {
                      title: "Đang xử lý",
                      description: "Đơn hàng đang được xử lý và chuẩn bị",
                      completed: ["processing", "shipped", "out_for_delivery", "delivered"].includes(order.status),
                      date: order.status === "processing" ? order.updated_at : null
                    },
                    {
                      title: "Đã gửi hàng",
                      description: "Đơn hàng đã được gửi từ kho",
                      completed: ["shipped", "out_for_delivery", "delivered"].includes(order.status),
                      date: order.shipped_at || (order.status === "shipped" ? order.updated_at : null)
                    },
                    {
                      title: "Đang giao hàng",
                      description: "Đơn hàng đang được vận chuyển đến bạn",
                      completed: ["out_for_delivery", "delivered"].includes(order.status),
                      date: order.out_for_delivery_at || (order.status === "out_for_delivery" ? order.updated_at : null)
                    },
                    {
                      title: "Đã giao hàng",
                      description: "Đơn hàng đã được giao thành công",
                      completed: order.status === "delivered",
                      date: order.deliverydate || (order.status === "delivered" ? order.updated_at : null)
                    }
                  ]

                  // Nếu đơn hàng bị hủy, thêm bước hủy
                  if (order.status === "cancelled") {
                    timeline.push({
                      title: "Đơn hàng đã bị hủy",
                      description: "Đơn hàng đã được hủy",
                      completed: true,
                      date: order.updated_at
                    })
                  }

                  return timeline.map((step, index) => (
                    <div key={index} className="flex items-start gap-4">
                      <div className={`w-8 h-8 rounded-full flex items-center justify-center ${
                        step.completed ? 'bg-green-500 text-white' : 'bg-gray-200 text-gray-500'
                      }`}>
                        {step.completed ? (
                          <CheckCircle className="h-5 w-5" />
                        ) : (
                          <span className="text-sm font-medium">{index + 1}</span>
                        )}
                      </div>
                      <div className="flex-1">
                        <h4 className="font-medium">{step.title}</h4>
                        <p className="text-sm text-muted-foreground">{step.description}</p>
                        {step.date && (
                          <p className="text-xs text-muted-foreground mt-1">
                            {new Date(step.date).toLocaleDateString('vi-VN')}
                          </p>
                        )}
                      </div>
                    </div>
                  ))
                })()}
              </div>
            </CardContent>
          </Card>

          {/* Order Items */}
          <Card>
            <CardHeader>
              <CardTitle>Danh sách sản phẩm</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {order.items?.map((item: any, index: number) => (
                  <div key={index} className="flex gap-4 p-4 border rounded-lg">
                     <Image
                      src={item.image?.startsWith("/") ? item.image : `/${item.image}`}
                      alt={item.name}          
                      width={80}
                      height={80}
                    />
                    <div className="flex-1">
                      <h4 className="font-medium">{item.name}</h4>
                      <p className="text-sm text-muted-foreground">
                        Số lượng: {item.quantity}
                      </p>
                      <p className="text-sm text-muted-foreground">
                        Giá: {item.price?.toLocaleString('vi-VN')} VNĐ
                      </p>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold">
                        {(item.total || item.price * item.quantity)?.toLocaleString('vi-VN')} VNĐ
                      </p>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Customer Information */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <MapPin className="h-5 w-5" />
                Thông tin khách hàng
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="font-medium">Họ tên:</span>
                    <span>{order.customer?.name || "Không có"}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Email:</span>
                    <span>{order.customer?.email || "Không có"}</span>
                  </div>
                </div>
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="font-medium">Số điện thoại:</span>
                    <span>{order.customer?.phone || "Không có"}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Địa chỉ:</span>
                    <span className="text-right max-w-xs">{order.customer?.address || "Không có"}</span>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex justify-center gap-4">
            <Link href="/orders">
              <Button variant="outline">
                <ArrowLeft className="h-4 w-4 mr-2" />
                Quay lại lịch sử đơn hàng
              </Button>
            </Link>
            <Link href="/">
              <Button className="bg-orange hover:bg-orange-600 text-black">
                Tiếp tục mua sắm
              </Button>
            </Link>
          </div>
        </div>
      </div>
      {/* Footer */}
      <footer className="bg-beige text-black mt-12">
        <div className="container mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-3 gap-6 text-sm text-center md:text-left">
          <div>
            <img src="/logo.png" alt="TasteOfHome Logo" className="h-12 mb-3 mx-auto md:mx-0" />
            <p>Địa chỉ: 123 Đường ABC, Quận 1, TP.HCM</p>
            <p>Hotline: 0123 456 789</p>
            <p>Email: support@tasteofhome.com</p>
          </div>
          <div>
            <h3 className="font-semibold mb-2">Danh mục chính</h3>
            <ul className="space-y-1">
              <li>Rau củ quả</li>
              <li>Thịt cá</li>
              <li>Đặc sản vùng miền</li>
              <li>Gia vị & Nước chấm</li>
            </ul>
          </div>
          <div>
            <h3 className="font-semibold mb-2">Về chúng tôi</h3>
            <p>
              TasteOfHome mang hương vị quê hương đến từng bữa ăn của bạn.
              Cam kết sản phẩm sạch, chất lượng, an toàn và giao hàng tận nơi.
            </p>
          </div>
        </div>
        <div className="bg-black text-center text-white py-3 text-xs">
          © 2025 TasteOfHome. All rights reserved.
        </div>
      </footer>
    </div>
  )
}
