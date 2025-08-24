"use client"

import type React from "react"

import { useState } from "react"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { ArrowLeft, CreditCard, Lock } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { useCart } from "@/contexts/cart-context"
import { DiscountCodeInput } from "@/components/discount-code-input"

interface ShippingInfo {
  firstName: string
  lastName: string
  email: string
  phone: string
  address: string
  city: string
  zipCode: string
}

interface PaymentInfo {
  cardNumber: string
  expiryDate: string
  cvv: string
  cardName: string
  paymentMethod: string
}

export default function CheckoutPage() {
  const { state: cartState, dispatch: cartDispatch } = useCart()
  const router = useRouter()
  const [isProcessing, setIsProcessing] = useState(false)
  const [appliedDiscount, setAppliedDiscount] = useState<{ code: string; amount: number } | null>(null)
  
  // State cho form
  const [shippingInfo, setShippingInfo] = useState<ShippingInfo>({
    firstName: "",
    lastName: "",
    email: "",
    phone: "",
    address: "",
    city: "",
    zipCode: ""
  })

  const [paymentInfo, setPaymentInfo] = useState<PaymentInfo>({
    cardNumber: "",
    expiryDate: "",
    cvv: "",
    cardName: "",
    paymentMethod: "Credit Card"
  })

  const shippingCost = cartState.total > 50 ? 0 : 5.99
  const tax = cartState.total * 0.08
  const discountAmount = appliedDiscount ? appliedDiscount.amount : 0
  const finalTotal = cartState.total + shippingCost + tax - discountAmount

  const handleShippingChange = (field: keyof ShippingInfo, value: string) => {
    setShippingInfo(prev => ({ ...prev, [field]: value }))
  }

  const handlePaymentChange = (field: keyof PaymentInfo, value: string) => {
    setPaymentInfo(prev => ({ ...prev, [field]: value }))
  }

  const handlePlaceOrder = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsProcessing(true)

    try {
      // Chuẩn bị dữ liệu đơn hàng
      const orderData = {
        items: cartState.items,
        shippingInfo,
        paymentInfo,
        orderSummary: {
          subtotal: cartState.total,
          shipping: shippingCost,
          tax,
          discount: discountAmount,
          total: finalTotal
        }
      }

      // Gọi API để tạo đơn hàng
      const response = await fetch("/api/checkout", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(orderData),
      })

      const result = await response.json()

      if (result.success) {
        // Xóa giỏ hàng và chuyển đến trang thành công
        cartDispatch({ type: "CLEAR_CART" })
        router.push(`/checkout/success?orderId=${result.orderId}`)
      } else {
        alert(`Lỗi: ${result.message}`)
      }
    } catch (error) {
      console.error("Error placing order:", error)
      alert("Có lỗi xảy ra khi đặt hàng. Vui lòng thử lại.")
    } finally {
      setIsProcessing(false)
    }
  }

  if (cartState.items.length === 0) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Giỏ hàng trống</h1>
          <Link href="/">
            <Button>Tiếp tục mua sắm</Button>
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/cart" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Quay lại giỏ hàng
            </Link>
            <h1 className="text-2xl font-bold">Thanh toán</h1>
            <div className="flex items-center gap-2 text-sm text-muted-foreground">
              <Lock className="h-4 w-4" />
              Thanh toán an toàn
            </div>
          </div>
        </div>
      </header>

      <form onSubmit={handlePlaceOrder}>
        <div className="container mx-auto px-4 py-8">
          <div className="max-w-6xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Checkout Form */}
            <div className="space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle>Thông tin giao hàng</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <Label htmlFor="firstName">Họ</Label>
                      <Input 
                        id="firstName" 
                        placeholder="Nguyễn" 
                        required 
                        value={shippingInfo.firstName}
                        onChange={(e) => handleShippingChange("firstName", e.target.value)}
                      />
                    </div>
                    <div>
                      <Label htmlFor="lastName">Tên</Label>
                      <Input 
                        id="lastName" 
                        placeholder="Văn A" 
                        required 
                        value={shippingInfo.lastName}
                        onChange={(e) => handleShippingChange("lastName", e.target.value)}
                      />
                    </div>
                  </div>
                  <div>
                    <Label htmlFor="email">Email</Label>
                    <Input 
                      id="email" 
                      type="email" 
                      placeholder="nguyenvana@example.com" 
                      required 
                      value={shippingInfo.email}
                      onChange={(e) => handleShippingChange("email", e.target.value)}
                    />
                  </div>
                  <div>
                    <Label htmlFor="phone">Số điện thoại</Label>
                    <Input 
                      id="phone" 
                      placeholder="0123456789" 
                      required 
                      value={shippingInfo.phone}
                      onChange={(e) => handleShippingChange("phone", e.target.value)}
                    />
                  </div>
                  <div>
                    <Label htmlFor="address">Địa chỉ</Label>
                    <Input 
                      id="address" 
                      placeholder="123 Đường ABC, Quận 1" 
                      required 
                      value={shippingInfo.address}
                      onChange={(e) => handleShippingChange("address", e.target.value)}
                    />
                  </div>
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <Label htmlFor="city">Thành phố</Label>
                      <Input 
                        id="city" 
                        placeholder="TP. Hồ Chí Minh" 
                        required 
                        value={shippingInfo.city}
                        onChange={(e) => handleShippingChange("city", e.target.value)}
                      />
                    </div>
                    <div>
                      <Label htmlFor="zipCode">Mã bưu điện</Label>
                      <Input 
                        id="zipCode" 
                        placeholder="70000" 
                        required 
                        value={shippingInfo.zipCode}
                        onChange={(e) => handleShippingChange("zipCode", e.target.value)}
                      />
                    </div>
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader>
                  <CardTitle className="flex items-center gap-2">
                    <CreditCard className="h-5 w-5" />
                    Thông tin thanh toán
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div>
                    <Label htmlFor="cardNumber">Số thẻ</Label>
                    <Input 
                      id="cardNumber" 
                      placeholder="1234 5678 9012 3456" 
                      required 
                      value={paymentInfo.cardNumber}
                      onChange={(e) => handlePaymentChange("cardNumber", e.target.value)}
                    />
                  </div>
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <Label htmlFor="expiryDate">Ngày hết hạn</Label>
                      <Input 
                        id="expiryDate" 
                        placeholder="MM/YY" 
                        required 
                        value={paymentInfo.expiryDate}
                        onChange={(e) => handlePaymentChange("expiryDate", e.target.value)}
                      />
                    </div>
                    <div>
                      <Label htmlFor="cvv">CVV</Label>
                      <Input 
                        id="cvv" 
                        placeholder="123" 
                        required 
                        value={paymentInfo.cvv}
                        onChange={(e) => handlePaymentChange("cvv", e.target.value)}
                      />
                    </div>
                  </div>
                  <div>
                    <Label htmlFor="cardName">Tên chủ thẻ</Label>
                    <Input 
                      id="cardName" 
                      placeholder="NGUYEN VAN A" 
                      required 
                      value={paymentInfo.cardName}
                      onChange={(e) => handlePaymentChange("cardName", e.target.value)}
                    />
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Order Summary */}
            <div className="space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle>Tóm tắt đơn hàng</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="space-y-3">
                    {cartState.items.map((item) => (
                      <div key={item.id} className="flex gap-3">
                        <img
                          src={item.image || "/placeholder.svg"}
                          alt={item.name}
                          className="w-16 h-16 object-cover rounded-md"
                        />
                        <div className="flex-1">
                          <h4 className="font-semibold text-sm">{item.name}</h4>
                          <p className="text-sm text-muted-foreground">Số lượng: {item.quantity}</p>
                          <p className="font-semibold">{(item.price * item.quantity).toLocaleString('vi-VN')} VNĐ</p>
                        </div>
                      </div>
                    ))}
                  </div>

                  <Separator />

                  <div className="space-y-2">
                    <div className="flex justify-between">
                      <span>Tạm tính</span>
                      <span>{cartState.total.toLocaleString('vi-VN')} VNĐ</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Phí vận chuyển</span>
                      <span>{shippingCost === 0 ? "Miễn phí" : `${shippingCost.toLocaleString('vi-VN')} VNĐ`}</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Thuế</span>
                      <span>{tax.toLocaleString('vi-VN')} VNĐ</span>
                    </div>
                    
                    {appliedDiscount && (
                    <div className="flex justify-between text-green-600">
                      <span>Giảm giá ({appliedDiscount.code})</span>
                      <span>- {discountAmount.toLocaleString('vi-VN')} VNĐ</span>
                    </div>
                    )}
                    <Separator />
                    <div className="flex justify-between text-lg font-semibold">
                      <span>Tổng cộng</span>
                      <span>{finalTotal.toLocaleString('vi-VN')} VNĐ</span>
                    </div>
                  </div>

                  <Button
                    type="submit"
                    disabled={isProcessing}
                    className="w-full bg-orange text-black hover:bg-orange/80"
                    size="lg"
                  >
                    {isProcessing ? "Đang xử lý..." : `Đặt hàng - ${finalTotal.toLocaleString('vi-VN')} VNĐ`}
                  </Button>

                  <p className="text-xs text-muted-foreground text-center">
                    Bằng việc đặt hàng, bạn đồng ý với Điều khoản dịch vụ và Chính sách bảo mật của chúng tôi.
                  </p>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </form>
    </div>
  )
}
