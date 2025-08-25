"use client"

import type React from "react"

import { useState, useEffect } from "react"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { ArrowLeft, CreditCard, Lock, LogIn } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { useCart } from "@/contexts/cart-context"
import { DiscountCodeInput } from "@/components/discount-code-input"
import { useAuth } from "@/hooks/use-auth"

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
  paymentMethod: string
  // Credit card fields
  cardNumber?: string
  expiryDate?: string
  cvv?: string
  cardName?: string
  // Bank transfer fields
  bankName?: string
  accountNumber?: string
  accountName?: string
  // Cash on delivery
  // No additional fields needed
  // E-wallet fields
  walletType?: string
  phoneNumber?: string
}

export default function CheckoutPage() {
  const { isAuthenticated, user, loading } = useAuth()
  const { state: cartState, dispatch: cartDispatch } = useCart()
  const router = useRouter()
  const [isProcessing, setIsProcessing] = useState(false)
  
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
  paymentMethod: "Credit Card",
  cardNumber: "",
  expiryDate: "",
  cvv: "",
  cardName: "",
  bankName: "",
  accountNumber: "",
  accountName: "",
  walletType: "",
  phoneNumber: ""
})

  // Tự động điền thông tin user nếu đã đăng nhập
  useEffect(() => {
    if (user && isAuthenticated) {
      setShippingInfo(prev => ({
        ...prev,
        email: user.email || "",
        firstName: user.name?.split(' ')[0] || "",
        lastName: user.name?.split(' ').slice(1).join(' ') || ""
      }))
    }
  }, [user, isAuthenticated])

  const shippingCost = cartState.total > 50 ? 0 : 5.99
  const tax = cartState.total * 0.08
  const discountAmount = cartState.appliedDiscount ? cartState.appliedDiscount.amount : 0
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
      // Validate payment fields based on payment method
      if (paymentInfo.paymentMethod === "Credit Card") {
        if (!paymentInfo.cardNumber || !paymentInfo.expiryDate || !paymentInfo.cvv || !paymentInfo.cardName) {
          alert("Vui lòng điền đầy đủ thông tin thẻ tín dụng")
          setIsProcessing(false)
          return
        }
      } else if (paymentInfo.paymentMethod === "Bank Transfer") {
        if (!paymentInfo.bankName || !paymentInfo.accountNumber || !paymentInfo.accountName) {
          alert("Vui lòng điền đầy đủ thông tin chuyển khoản")
          setIsProcessing(false)
          return
        }
      } else if (paymentInfo.paymentMethod === "E-wallet") {
        if (!paymentInfo.walletType || !paymentInfo.phoneNumber) {
          alert("Vui lòng chọn loại ví và điền số điện thoại")
          setIsProcessing(false)
          return
        }
      }
      // Cash on delivery doesn't need additional validation

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
        {/* Welcome bar */}
        <div className="bg-red-700 text-white text-sm text-center py-2">
        Chào mừng đến Taste Of Home
        </div>
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link href="/cart" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
                <ArrowLeft className="h-5 w-5" />
                Quay lại giỏ hàng
              </Link>
              <h1 className="text-2xl font-bold text-center -translate-x-8"> Thanh toán </h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        <div className="container mx-auto px-4 py-16">
          <div className="max-w-md mx-auto text-center">
            <LogIn className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
            <h2 className="text-2xl font-bold mb-4">Bạn cần đăng nhập</h2>
            <p className="text-muted-foreground mb-8">
              Để tiến hành thanh toán, bạn cần đăng nhập vào tài khoản của mình.
            </p>
            <div className="space-y-3">
              <Link href="/auth">
                <Button size="lg" className="w-full">
                  Đăng nhập
                </Button>
              </Link>
              <Link href="/cart">
                <Button variant="outline" className="w-full">
                  Quay lại giỏ hàng
                </Button>
              </Link>
            </div>
          </div>
        </div>
        {/* Footer */}
      <footer className="bg-beige text-black mt-12">
        <div className="container mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-3 gap-6 text-sm place-items-center items-start">
          {/* Logo & liên hệ */}
          <div>
            <img src="/logo.png" alt="TasteOfHome Logo" className="h-12 mb-3" />
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
          © 2025 TasteOfHome. Bản quyền thuộc về nhóm 08.
        </div>
      </footer>
      </div>
    )
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
      {/* Top welcome bar */}
    <div className="bg-red-700 text-white text-sm text-center py-2">
      Chào mừng đến Taste Of Home
    </div>

      {/* Header */}
      <header className="bg-beige text-black">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/cart" className="flex items-center gap-2 text-lg font-semibold hover:text-gray-200">
              <ArrowLeft className="h-5 w-5" />
              Quay lại giỏ hàng
            </Link>
            <div className="text-center">
              <h1 className="text-2xl font-bold">Thanh toán</h1>
              {user && (
                <p className="text-sm">Xin chào, {user.name || user.username}</p>
              )}
            </div>
            <div className="flex items-center gap-2 text-sm">
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
                    <Label htmlFor="paymentMethod">Phương thức thanh toán</Label>
                    <select
                      id="paymentMethod"
                      value={paymentInfo.paymentMethod}
                      onChange={(e) => handlePaymentChange("paymentMethod", e.target.value)}
                      className="w-full p-2 border rounded-md"
                    >
                      <option value="Credit Card">Thẻ tín dụng</option>
                      <option value="Bank Transfer">Chuyển khoản ngân hàng</option>
                      <option value="Cash on Delivery">Thanh toán khi nhận hàng</option>
                      <option value="E-wallet">Ví điện tử</option>
                    </select>
                  </div>

                  {paymentInfo.paymentMethod === "Credit Card" && (
                    <>
                      <div className="mb-4 p-3 bg-blue-50 border border-blue-200 rounded-md">
                        <p className="text-sm text-blue-800">
                          💳 Thông tin thẻ sẽ được mã hóa và xử lý an toàn. Chúng tôi không lưu trữ thông tin thẻ của bạn.
                        </p>
                      </div>
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
                    </>
                  )}

                  {paymentInfo.paymentMethod === "Bank Transfer" && (
                    <>
                      <div className="mb-4 p-3 bg-green-50 border border-green-200 rounded-md">
                        <p className="text-sm text-green-800">
                          🏦 Sau khi đặt hàng, bạn sẽ nhận được thông tin tài khoản ngân hàng để chuyển khoản. 
                          Đơn hàng sẽ được xử lý sau khi chúng tôi xác nhận thanh toán.
                        </p>
                      </div>
                      <div>
                        <Label htmlFor="bankName">Tên ngân hàng</Label>
                        <Input 
                          id="bankName" 
                          placeholder="Ngân hàng ABC" 
                          required 
                          value={paymentInfo.bankName}
                          onChange={(e) => handlePaymentChange("bankName", e.target.value)}
                        />
                      </div>
                      <div>
                        <Label htmlFor="accountNumber">Số tài khoản</Label>
                        <Input 
                          id="accountNumber" 
                          placeholder="1234567890" 
                          required 
                          value={paymentInfo.accountNumber}
                          onChange={(e) => handlePaymentChange("accountNumber", e.target.value)}
                        />
                      </div>
                      <div>
                        <Label htmlFor="accountName">Tên chủ tài khoản</Label>
                        <Input 
                          id="accountName" 
                          placeholder="NGUYEN VAN A" 
                          required 
                          value={paymentInfo.accountName}
                          onChange={(e) => handlePaymentChange("accountName", e.target.value)}
                        />
                      </div>
                    </>
                  )}

                  {paymentInfo.paymentMethod === "E-wallet" && (
                    <>
                      <div className="mb-4 p-3 bg-purple-50 border border-purple-200 rounded-md">
                        <p className="text-sm text-purple-800">
                          📱 Bạn sẽ nhận được thông báo thanh toán từ ví điện tử. 
                          Đơn hàng sẽ được xử lý sau khi thanh toán thành công.
                        </p>
                      </div>
                      <div>
                        <Label htmlFor="walletType">Loại ví</Label>
                        <select
                          id="walletType"
                          value={paymentInfo.walletType}
                          onChange={(e) => handlePaymentChange("walletType", e.target.value)}
                          className="w-full p-2 border rounded-md"
                        >
                          <option value="">Chọn loại ví</option>
                          <option value="Momo">Momo</option>
                          <option value="ZaloPay">ZaloPay</option>
                          <option value="VnPay">VnPay</option>
                        </select>
                      </div>
                      {paymentInfo.walletType && (
                        <div>
                          <Label htmlFor="phoneNumber">Số điện thoại {paymentInfo.walletType}</Label>
                          <Input 
                            id="phoneNumber" 
                            placeholder="0987654321" 
                            required 
                            value={paymentInfo.phoneNumber}
                            onChange={(e) => handlePaymentChange("phoneNumber", e.target.value)}
                          />
                        </div>
                      )}
                    </>
                  )}

                  {paymentInfo.paymentMethod === "Cash on Delivery" && (
                    <div className="mb-4 p-3 bg-orange-50 border border-orange-200 rounded-md">
                      <p className="text-sm text-orange-800">
                        💰 Bạn sẽ thanh toán bằng tiền mặt khi nhận hàng. 
                        Vui lòng chuẩn bị đủ tiền để thanh toán.
                      </p>
                    </div>
                  )}
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
                    
                    {cartState.appliedDiscount && (
                    <div className="flex justify-between text-green-600">
                      <span>Giảm giá ({cartState.appliedDiscount.code})</span>
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

      {/* Footer */}
      <footer className="bg-beige text-black mt-12">
        <div className="container mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-3 gap-6 text-sm place-items-center items-start">
          {/* Logo & liên hệ */}
          <div>
            <img src="/logo.png" alt="TasteOfHome Logo" className="h-12 mb-3" />
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
          © 2025 TasteOfHome. Bản quyền thuộc về team 08.
        </div>
      </footer>
    </div>
  )
}
