"use client"

import { useParams } from "next/navigation"
import Link from "next/link"
import { useEffect, useState } from "react"
import { ArrowLeft, Package, Truck, CheckCircle, Clock, Download, MapPin } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Separator } from "@/components/ui/separator"
import { Progress } from "@/components/ui/progress"

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

const statusIcons = {
  processing: Clock,
  shipped: Truck,
  delivered: CheckCircle,
  cancelled: Package,
  // Thêm các trạng thái khác từ database
  "Đang giao": Truck,
  "Đã giao": CheckCircle,
  "Hủy": Package,
  "Duyệt": Clock,
  "Mới": Clock,
}

// Hàm helper để lấy màu và icon cho trạng thái
const getStatusStyle = (status: string) => {
  const color = statusColors[status as keyof typeof statusColors] || "bg-gray-500"
  const Icon = statusIcons[status as keyof typeof statusIcons] || Clock
  return { color, Icon }
}

export default function OrderDetailPage() {
  const params = useParams()
  const orderId = params.id as string

  const [order, setOrder] = useState<any>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    const fetchOrder = async () => {
      setLoading(true)
      try {
        const res = await fetch(`/api/orders/${orderId}`)
        if (!res.ok) {
          setError("Không tìm thấy đơn hàng")
          setOrder(null)
        } else {
          const data = await res.json()
          setOrder(data)
          setError(null)
        }
      } catch (err) {
        setError("Không thể tải thông tin đơn hàng")
        setOrder(null)
      }
      setLoading(false)
    }
    fetchOrder()
  }, [orderId])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">Đang tải...</div>
      </div>
    )
  }

  if (error || !order) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">{error || "Không tìm thấy đơn hàng"}</h1>
          <Link href="/orders">
            <Button>Quay lại danh sách</Button>
          </Link>
        </div>
      </div>
    )
  }

  const { color: statusColor, Icon: StatusIcon } = getStatusStyle(order.status)
  const completedSteps = order.timeline.filter((step: any) => step.completed).length
  const progressPercentage = (completedSteps / order.timeline.length) * 100

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/orders" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Quay lại danh sách
            </Link>
            <h1 className="text-2xl font-bold">Chi tiết đơn hàng</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto space-y-8">
          {/* Order Header */}
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div>
                  <CardTitle className="text-2xl">{order.id}</CardTitle>
                  <p className="text-muted-foreground">
                    Đặt hàng ngày {new Date(order.date).toLocaleDateString('vi-VN')}
                  </p>
                </div>
                <div className="text-right">
                  <Badge className={`${statusColor} mb-2`}>
                    <StatusIcon className="h-4 w-4 mr-1" />
                    {order.status}
                  </Badge>
                  <p className="text-2xl font-bold">{order.total.toLocaleString('vi-VN')} VNĐ</p>
                </div>
              </div>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div>
                  <h4 className="font-semibold mb-2">Payment Status</h4>
                  <Badge variant={order.paymentStatus === "paid" ? "default" : "destructive"}>
                    {order.paymentStatus === "paid" ? "Đã thanh toán" : "Chưa thanh toán"}
                  </Badge>
                  <p className="text-sm text-muted-foreground mt-1">{order.paymentMethod}</p>
                </div>

                {order.trackingNumber && (
                  <div>
                    <h4 className="font-semibold mb-2">Tracking Number</h4>
                    <p className="font-mono text-sm">{order.trackingNumber}</p>
                  </div>
                )}

                <div>
                  <h4 className="font-semibold mb-2">
                    {order.status === "Đã giao" ? "Ngày giao hàng" : "Dự kiến giao hàng"}
                  </h4>
                  <p className="text-sm">
                    {order.status === "Đã giao" && order.actualDelivery
                      ? new Date(order.actualDelivery).toLocaleDateString()
                      : order.estimatedDelivery 
                        ? new Date(order.estimatedDelivery).toLocaleDateString()
                        : "Chưa xác định"}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Order Progress */}
          <Card>
            <CardHeader>
              <CardTitle>Tiến trình đơn hàng</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-6">
                <div>
                  <div className="flex justify-between text-sm mb-2">
                    <span>Tiến độ</span>
                    <span>{Math.round(progressPercentage)}% Hoàn thành</span>
                  </div>
                  <Progress value={progressPercentage} className="h-2" />
                </div>

                <div className="space-y-4">
                  {order.timeline.map((step: any, index: number) => (
                    <div key={index} className="flex items-start gap-4">
                      <div
                        className={`w-8 h-8 rounded-full flex items-center justify-center ${
                          step.completed ? "bg-green-500 text-white" : "bg-gray-200 text-gray-500"
                        }`}
                      >
                        {step.completed ? <CheckCircle className="h-4 w-4" /> : <Clock className="h-4 w-4" />}
                      </div>
                      <div className="flex-1">
                        <h4 className={`font-semibold ${step.completed ? "text-green-700" : "text-gray-500"}`}>
                          {step.status}
                        </h4>
                        <p className="text-sm text-muted-foreground">{step.description}</p>
                        {step.date && <p className="text-xs text-muted-foreground mt-1">
                          {new Date(step.date).toLocaleDateString('vi-VN')}
                        </p>}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </CardContent>
          </Card>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Order Items */}
            <Card>
              <CardHeader>
                <CardTitle>Sản phẩm đặt hàng</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {order.items.map((item: any) => (
                    <div key={item.id} className="flex gap-4">
                      <div className="w-16 h-16 bg-gray-100 rounded-md flex items-center justify-center overflow-hidden">
                        {item.image ? (
                          <img 
                            src={item.image} 
                            alt={item.name}
                            className="w-full h-full object-cover"
                          />
                        ) : (
                          <Package className="h-8 w-8 text-gray-400" />
                        )}
                      </div>
                      <div className="flex-1">
                        <h4 className="font-semibold">{item.name}</h4>
                        <p className="text-sm text-muted-foreground">Số lượng: {item.quantity}</p>
                        <p className="font-semibold">{(item.price * item.quantity).toLocaleString('vi-VN')} VNĐ</p>
                      </div>
                    </div>
                  ))}

                  <Separator />

                  <div className="space-y-2">
                    <div className="flex justify-between">
                      <span>Tạm tính</span>
                      <span>{order.subtotal?.toLocaleString('vi-VN')} VNĐ</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Phí vận chuyển</span>
                      <span>{order.shipping === 0 ? "Miễn phí" : `${order.shipping?.toLocaleString('vi-VN')} VNĐ`}</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Thuế</span>
                      <span>{order.tax?.toLocaleString('vi-VN')} VNĐ</span>
                    </div>
                    <Separator />
                    <div className="flex justify-between font-semibold text-lg">
                      <span>Tổng cộng</span>
                      <span>{order.total?.toLocaleString('vi-VN')} VNĐ</span>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Shipping Address */}
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <MapPin className="h-5 w-5" />
                  Địa chỉ giao hàng
                </CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-2">
                  <p className="font-semibold">{order.shippingAddress.name}</p>
                  <p>{order.shippingAddress.address}</p>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
