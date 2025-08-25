"use client"

import { useState, useEffect } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Textarea } from "@/components/ui/textarea"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { useAuth } from "@/hooks/use-auth"
import { useRouter } from "next/navigation"
import { useToast } from "@/hooks/use-toast"
import { Package, Truck, CheckCircle, Clock, AlertCircle, ArrowLeft } from "lucide-react"
import Link from "next/link"

interface OrderItem {
  id: number
  product_id: number
  quantity: number
  price: number
  product?: {
    title: string
    image: string
    code: string
  }
}

interface Order {
  id: number
  inv_code: string
  fullname: string
  email: string
  phone: string
  totalamount: number
  status: string
  created_at: string
  details: OrderItem[]
}

const statusOptions = [
  { value: "pending", label: "Chờ xử lý", icon: Clock, color: "bg-yellow-100 text-yellow-800" },
  { value: "processing", label: "Đang xử lý", icon: Package, color: "bg-blue-100 text-blue-800" },
  { value: "shipped", label: "Đã gửi hàng", icon: Truck, color: "bg-purple-100 text-purple-800" },
  { value: "out_for_delivery", label: "Đang giao", icon: Truck, color: "bg-orange-100 text-orange-800" },
  { value: "delivered", label: "Đã giao", icon: CheckCircle, color: "bg-green-100 text-green-800" },
  { value: "cancelled", label: "Đã hủy", icon: AlertCircle, color: "bg-red-100 text-red-800" }
]

export default function StaffOrdersPage() {
  const { user, isAuthenticated, loading } = useAuth()
  const router = useRouter()
  const { toast } = useToast()
  const [orders, setOrders] = useState<Order[]>([])
  const [isLoading, setIsLoading] = useState(true)
  const [selectedOrder, setSelectedOrder] = useState<Order | null>(null)
  const [newStatus, setNewStatus] = useState("")
  const [statusNotes, setStatusNotes] = useState("")
  const [isUpdating, setIsUpdating] = useState(false)

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
      fetchOrders()
    }
  }, [user])

  const fetchOrders = async () => {
    try {
      setIsLoading(true)
      const response = await fetch("/api/orders/staff")
      if (!response.ok) {
        throw new Error("Failed to fetch orders")
      }
      const data = await response.json()
      setOrders(data)
    } catch (error) {
      console.error("Error fetching orders:", error)
      toast({
        title: "Lỗi",
        description: "Không thể tải danh sách đơn hàng",
        variant: "destructive"
      })
    } finally {
      setIsLoading(false)
    }
  }

  const handleStatusUpdate = async () => {
    if (!selectedOrder || !newStatus) return

    try {
      setIsUpdating(true)
      const response = await fetch("/api/orders/staff", {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          orderId: selectedOrder.id,
          status: newStatus,
          notes: statusNotes
        }),
      })

      if (!response.ok) {
        throw new Error("Failed to update order status")
      }

      // Update local state
      setOrders(prevOrders => 
        prevOrders.map(order => 
          order.id === selectedOrder.id 
            ? { ...order, status: newStatus }
            : order
        )
      )

      // Hiển thị thông báo thành công
      toast({
        title: "🎉 Cập nhật thành công!",
        description: `Đã cập nhật trạng thái đơn hàng ${selectedOrder.inv_code} thành "${getStatusInfo(newStatus).label}"`,
      })

      // Reset form và đóng dialog
      setSelectedOrder(null)
      setNewStatus("")
      setStatusNotes("")

      // Tự động refresh danh sách đơn hàng sau 1 giây
      setTimeout(() => {
        fetchOrders()
      }, 1000)

    } catch (error) {
      console.error("Error updating order status:", error)
      toast({
        title: "Lỗi",
        description: "Không thể cập nhật trạng thái đơn hàng",
        variant: "destructive"
      })
    } finally {
      setIsUpdating(false)
    }
  }

  const getStatusInfo = (status: string) => {
    return statusOptions.find(option => option.value === status) || statusOptions[0]
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString("vi-VN", {
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
      hour: "2-digit",
      minute: "2-digit"
    })
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p>Đang tải...</p>
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

  return (
    <div className="min-h-screen bg-background p-6">
      <header className="border-b mb-6 pb-4">
        <div className="flex items-center gap-4 mb-4">
          <Link href="/staff/dashboard">
            <Button variant="outline" size="sm">
              <ArrowLeft className="h-4 w-4 mr-2" />
              Về Dashboard
            </Button>
          </Link>
        </div>
        <h2 className="text-3xl font-bold mb-2">Quản lý đơn hàng</h2>
        <p className="text-muted-foreground">
          Theo dõi và cập nhật trạng thái đơn hàng của khách hàng
        </p>
      </header>

      {isLoading ? (
        <div className="flex items-center justify-center py-12">
          <p>Đang tải danh sách đơn hàng...</p>
        </div>
      ) : (
        <div className="space-y-6">
          {orders.length === 0 ? (
            <Card>
              <CardContent className="py-12 text-center">
                <Package className="h-12 w-12 mx-auto text-muted-foreground mb-4" />
                <p className="text-muted-foreground">Chưa có đơn hàng nào</p>
              </CardContent>
            </Card>
          ) : (
            orders.map((order) => {
              const statusInfo = getStatusInfo(order.status)
              const StatusIcon = statusInfo.icon

              return (
                <Card key={order.id} className="overflow-hidden">
                  <CardHeader className="bg-muted/50">
                    <div className="flex items-center justify-between">
                      <div>
                        <CardTitle className="text-lg">Đơn hàng #{order.inv_code}</CardTitle>
                        <p className="text-sm text-muted-foreground">
                          {order.fullname} • {order.email} • {order.phone}
                        </p>
                      </div>
                      <div className="text-right">
                        <p className="text-lg font-semibold">
                          {new Intl.NumberFormat("vi-VN", {
                            style: "currency",
                            currency: "VND"
                          }).format(order.totalamount)}
                        </p>
                        <Badge className={`${statusInfo.color} border-0`}>
                          <StatusIcon className="h-3 w-3 mr-1" />
                          {statusInfo.label}
                        </Badge>
                      </div>
                    </div>
                  </CardHeader>
                  <CardContent className="p-6">
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                      <div>
                        <h4 className="font-semibold mb-3">Chi tiết đơn hàng</h4>
                        <div className="space-y-2">
                          {order.details.map((item, index) => (
                            <div key={index} className="flex items-center justify-between text-sm">
                              <span>
                                {item.product?.title || `Sản phẩm ${item.product_id}`} x{item.quantity}
                              </span>
                              <span className="font-medium">
                                {new Intl.NumberFormat("vi-VN", {
                                  style: "currency",
                                  currency: "VND"
                                }).format(item.price * item.quantity)}
                              </span>
                            </div>
                          ))}
                        </div>
                      </div>
                      <div>
                        <h4 className="font-semibold mb-3">Thông tin đơn hàng</h4>
                        <div className="space-y-2 text-sm">
                          <div className="flex justify-between">
                            <span className="text-muted-foreground">Ngày đặt:</span>
                            <span>{formatDate(order.created_at)}</span>
                          </div>
                          <div className="flex justify-between">
                            <span className="text-muted-foreground">Trạng thái:</span>
                            <Badge variant="outline">{statusInfo.label}</Badge>
                          </div>
                        </div>
                        
                        <div className="mt-4">
                          <Dialog>
                            <DialogTrigger asChild>
                              <Button 
                                variant="outline" 
                                size="sm"
                                onClick={() => {
                                  setSelectedOrder(order)
                                  setNewStatus(order.status)
                                  setStatusNotes("")
                                }}
                              >
                                Cập nhật trạng thái
                              </Button>
                            </DialogTrigger>
                            <DialogContent>
                              <DialogHeader>
                                <DialogTitle>Cập nhật trạng thái đơn hàng #{order.inv_code}</DialogTitle>
                              </DialogHeader>
                              <div className="space-y-4">
                                <div>
                                  <label className="text-sm font-medium">Trạng thái mới</label>
                                  <Select value={newStatus} onValueChange={setNewStatus}>
                                    <SelectTrigger>
                                      <SelectValue placeholder="Chọn trạng thái" />
                                    </SelectTrigger>
                                    <SelectContent>
                                      {statusOptions.map((option) => (
                                        <SelectItem key={option.value} value={option.value}>
                                          <div className="flex items-center">
                                            <option.icon className="h-4 w-4 mr-2" />
                                            {option.label}
                                          </div>
                                        </SelectItem>
                                      ))}
                                    </SelectContent>
                                  </Select>
                                </div>
                                <div>
                                  <label className="text-sm font-medium">Ghi chú (tùy chọn)</label>
                                  <Textarea
                                    placeholder="Ghi chú về việc cập nhật trạng thái..."
                                    value={statusNotes}
                                    onChange={(e) => setStatusNotes(e.target.value)}
                                    rows={3}
                                  />
                                </div>
                                <div className="flex justify-end space-x-2">
                                  <Button
                                    variant="outline"
                                    onClick={() => {
                                      setSelectedOrder(null)
                                      setNewStatus("")
                                      setStatusNotes("")
                                    }}
                                  >
                                    Hủy
                                  </Button>
                                  <Button
                                    onClick={handleStatusUpdate}
                                    disabled={isUpdating || !newStatus}
                                  >
                                    {isUpdating ? "Đang cập nhật..." : "Cập nhật"}
                                  </Button>
                                </div>
                              </div>
                            </DialogContent>
                          </Dialog>
                        </div>
                      </div>
                    </div>
                  </CardContent>
                </Card>
              )
            })
          )}
        </div>
      )}
    </div>
  )
}
