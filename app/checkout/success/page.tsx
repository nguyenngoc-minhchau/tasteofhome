"use client"

import { useEffect, useState } from "react"
import { useSearchParams } from "next/navigation"
import Link from "next/link"
import { CheckCircle, Package, ArrowRight } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

export default function CheckoutSuccessPage() {
  const searchParams = useSearchParams()
  const orderId = searchParams.get('orderId')
  const [order, setOrder] = useState<any>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (orderId) {
      // Lấy thông tin đơn hàng từ API
      const fetchOrder = async () => {
        try {
          const res = await fetch(`/api/orders/${orderId}`)
          if (res.ok) {
            const data = await res.json()
            setOrder(data)
          }
        } catch (error) {
          console.error("Error fetching order:", error)
        } finally {
          setLoading(false)
        }
      }
      fetchOrder()
    } else {
      setLoading(false)
    }
  }, [orderId])

  if (loading) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="text-center">Đang tải...</div>
      </div>
    )
  }

  if (!orderId) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Không tìm thấy đơn hàng</h1>
          <Link href="/">
            <Button>Quay lại trang chủ</Button>
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-background flex items-center justify-center">
      <div className="container mx-auto px-4 py-8">
        <div className="max-w-2xl mx-auto text-center">
          <Card>
            <CardHeader className="pb-4">
              <div className="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                <CheckCircle className="h-8 w-8 text-green-600" />
              </div>
              <CardTitle className="text-2xl">Đặt hàng thành công!</CardTitle>
              <p className="text-muted-foreground">
                Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đã được tiếp nhận và đang được xử lý.
              </p>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="bg-gray-50 p-4 rounded-lg">
                <p className="text-sm text-muted-foreground">Mã đơn hàng</p>
                <p className="font-mono font-semibold text-lg">{orderId}</p>
              </div>

              {order && (
                <div className="bg-blue-50 p-4 rounded-lg text-left">
                  <h4 className="font-semibold mb-2">Thông tin đơn hàng:</h4>
                  <div className="space-y-1 text-sm">
                    <p><span className="font-medium">Tổng tiền:</span> {order.total?.toLocaleString('vi-VN')} VNĐ</p>
                    <p><span className="font-medium">Trạng thái:</span> {order.status}</p>
                    <p><span className="font-medium">Ngày đặt:</span> {new Date(order.date).toLocaleDateString('vi-VN')}</p>
                    <p><span className="font-medium">Số sản phẩm:</span> {order.items?.length || 0}</p>
                  </div>
                </div>
              )}

              <div className="space-y-4">
                <div className="flex items-center gap-3 text-sm">
                  <Package className="h-5 w-5 text-blue-600" />
                  <span>Bạn sẽ nhận được email xác nhận trong thời gian ngắn</span>
                </div>
                <div className="flex items-center gap-3 text-sm">
                  <Package className="h-5 w-5 text-blue-600" />
                  <span>Dự kiến giao hàng: 3-5 ngày làm việc</span>
                </div>
              </div>

              <div className="flex flex-col sm:flex-row gap-3">
                <Link href={`/orders/${orderId}`} className="flex-1">
                  <Button variant="outline" className="w-full bg-transparent">
                    Theo dõi đơn hàng
                    <ArrowRight className="h-4 w-4 ml-2" />
                  </Button>
                </Link>
                <Link href="/" className="flex-1">
                  <Button className="w-full">Tiếp tục mua sắm</Button>
                </Link>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
