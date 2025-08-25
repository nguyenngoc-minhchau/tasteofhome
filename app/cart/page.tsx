"use client"

import { useState } from "react"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { ArrowLeft, Plus, Minus, Trash2, ShoppingBag, CreditCard } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Separator } from "@/components/ui/separator"
import { Badge } from "@/components/ui/badge"
import { useCart } from "@/contexts/cart-context"
import { DiscountCodeInput } from "@/components/discount-code-input"

export default function CartPage() {
  const { state: cartState, dispatch: cartDispatch } = useCart()
  const router = useRouter()
  const [isValidating, setIsValidating] = useState(false)

  const updateQuantity = (id: number, quantity: number) => {
    cartDispatch({
      type: "UPDATE_QUANTITY",
      payload: { id, quantity },
    })
  }

  const removeItem = (id: number) => {
    cartDispatch({
      type: "REMOVE_ITEM",
      payload: id,
    })
  }

  const handleProceedToCheckout = async () => {
    setIsValidating(true)

    // Simulate cart validation
    await new Promise((resolve) => setTimeout(resolve, 1000))

    // Check stock availability
    const outOfStockItems = cartState.items.filter((item) => item.quantity > item.stock)

    if (outOfStockItems.length > 0) {
      alert("Một số sản phẩm trong giỏ hàng đã hết hàng. Vui lòng cập nhật số lượng.")
      setIsValidating(false)
      return
    }

    // Redirect to checkout
    router.push("/checkout")
    setIsValidating(false)
  }

  const shippingCost = cartState.total > 50 ? 0 : 5.99
  const tax = cartState.total * 0.08
  const discountAmount = cartState.appliedDiscount?.amount || 0
  const finalTotal = cartState.total + shippingCost + tax - discountAmount

  if (cartState.items.length === 0) {
    return (
      <div className="min-h-screen bg-background">
        {/* Welcome bar */}
        <div className="bg-red-700 text-white text-sm text-center py-2">
        Chào mừng đến Taste Of Home
        </div>
        {/* Header */}
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
                <ArrowLeft className="h-5 w-5" />
                Tiếp tục mua sắm
              </Link>
              <h1 className="text-2xl font-bold translate-x-[-50px]">Giỏ hàng</h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        {/* Empty Cart */}
        <div className="container mx-auto px-4 py-16">
          <div className="text-center max-w-md mx-auto">
            <ShoppingBag className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
            <h2 className="text-2xl font-bold mb-4">Giỏ hàng trống</h2>
            <p className="text-muted-foreground mb-8">
              Có vẻ như bạn chưa thêm sản phẩm nào vào giỏ hàng. Hãy bắt đầu mua sắm để làm đầy giỏ hàng!
            </p>
            <Link href="/">
              <Button size="lg">Bắt đầu mua sắm</Button>
            </Link>
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

  return (
    <div className="min-h-screen bg-background">
      {/* Welcome bar */}
        <div className="bg-red-700 text-white text-sm text-center py-2">
        Chào mừng đến Taste Of Home
        </div>
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Tiếp tục mua sắm
            </Link>
            <h1 className="text-2xl font-bold translate-x-[-50px]">Giỏ hàng</h1>
            <Badge variant="secondary">{cartState.itemCount} sản phẩm</Badge>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-5 gap-8">
          {/* Cart Items */}
          <div className="col-span-3 space-y-4">
            <h2 className="text-xl font-semibold mb-4">Sản phẩm trong giỏ hàng</h2>

            {cartState.items.map((item) => (
              <Card key={item.id}>
                <CardContent className="p-6">
                  <div className="flex gap-4">
                    <Link href={`/product/${item.id}`}>
                      <img
                        src={item.image || "/placeholder.svg"}
                        alt={item.name}
                        className="w-24 h-24 object-cover rounded-md cursor-pointer"
                      />
                    </Link>

                    <div className="flex-1 space-y-2">
                      <div className="flex justify-between items-start">
                        <div>
                          <Link href={`/product/${item.id}`}>
                            <h3 className="font-semibold hover:text-primary cursor-pointer">{item.name}</h3>
                          </Link>
                          <p className="text-sm text-muted-foreground">{item.category}</p>
                        </div>
                        <Button
                          variant="ghost"
                          size="icon"
                          onClick={() => removeItem(item.id)}
                          className="text-red-500 hover:text-red-700"
                        >
                          <Trash2 className="h-4 w-4" />
                        </Button>
                      </div>

                      <div className="flex items-center justify-between">
                        <div className="flex items-center gap-2">
                          <Button
                            variant="outline"
                            size="icon"
                            onClick={() => updateQuantity(item.id, item.quantity - 1)}
                            disabled={item.quantity <= 1}
                            className="h-8 w-8"
                          >
                            <Minus className="h-3 w-3" />
                          </Button>
                          <span className="w-12 text-center">{item.quantity}</span>
                          <Button
                            variant="outline"
                            size="icon"
                            onClick={() => updateQuantity(item.id, item.quantity + 1)}
                            disabled={item.quantity >= item.stock}
                            className="h-8 w-8"
                          >
                            <Plus className="h-3 w-3" />
                          </Button>
                        </div>

                        <div className="text-right">
                          <p className="font-semibold">{(item.price * item.quantity).toLocaleString('vi-VN')} VNĐ</p>
                          <p className="text-sm text-muted-foreground">{item.price.toLocaleString('vi-VN')} VNĐ mỗi sản phẩm</p>
                        </div>
                      </div>

                      {item.quantity >= item.stock && <p className="text-sm text-red-500">Đã đạt số lượng tối đa</p>}
                    </div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>

          {/* Order Summary */}
          <div className="col-span-2">
            <Card className="sticky top-4">
              <CardHeader>
                <CardTitle>Tóm tắt đơn hàng</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="space-y-2">
                  <div className="flex justify-between">
                    <span>Tạm tính ({cartState.itemCount} sản phẩm)</span>
                    <span>{cartState.total.toLocaleString('vi-VN')} VNĐ</span>
                  </div>

                  <div className="flex justify-between">
                    <span>Phí vận chuyển</span>
                    <span>
                      {shippingCost === 0 ? (
                        <span className="text-green-600">Miễn phí</span>
                      ) : (
                        `${shippingCost.toLocaleString('vi-VN')} VNĐ`
                      )}
                    </span>
                  </div>

                  <div className="flex justify-between">
                    <span>Thuế</span>
                    <span>{tax.toLocaleString('vi-VN')} VNĐ</span>
                  </div>

                  {cartState.appliedDiscount && (
                    <div className="flex justify-between text-green-600">
                      <span>Giảm giá ({cartState.appliedDiscount.code})</span>
                      <span>-{cartState.appliedDiscount.amount.toLocaleString('vi-VN')} VNĐ</span>
                    </div>
                  )}

                  {cartState.total < 50 && (
                    <p className="text-sm text-muted-foreground">
                      Thêm {(50 - cartState.total).toLocaleString('vi-VN')} VNĐ để được miễn phí vận chuyển
                    </p>
                  )}
                </div>

                <DiscountCodeInput
                  subtotal={cartState.total}
                  appliedDiscount={cartState.appliedDiscount}
                />

                <Separator />

                <div className="flex justify-between text-lg font-semibold">
                  <span>Tổng cộng</span>
                  <span>{finalTotal.toLocaleString('vi-VN')} VNĐ</span>
                </div>

                <Button
                  onClick={handleProceedToCheckout}
                  disabled={isValidating}
                  className="w-full bg-orange text-black hover:bg-orange/80"
                  size="lg"
                >
                  <CreditCard className="h-5 w-5 mr-2" />
                  {isValidating ? "Đang xác thực..." : "Tiến hành thanh toán"}
                </Button>

                <div className="text-center">
                  <Link href="/">
                    <Button variant="ghost" className="text-sm">
                      Tiếp tục mua sắm
                    </Button>
                  </Link>
                </div>
              </CardContent>
            </Card>
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
