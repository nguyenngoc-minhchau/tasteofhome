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
  const [appliedDiscount, setAppliedDiscount] = useState<{
    code: string
    amount: number
    type: string
    description: string
  } | null>(null)

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
      alert("Some items in your cart are out of stock. Please update quantities.")
      setIsValidating(false)
      return
    }

    // Redirect to checkout
    router.push("/checkout")
    setIsValidating(false)
  }

  const shippingCost = cartState.total > 50 ? 0 : 5.99
  const tax = cartState.total * 0.08
  const discountAmount = appliedDiscount?.amount || 0
  const finalTotal = cartState.total + shippingCost + tax - discountAmount

  if (cartState.items.length === 0) {
    return (
      <div className="min-h-screen bg-background">
        {/* Header */}
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
                <ArrowLeft className="h-5 w-5" />
                Continue Shopping
              </Link>
              <h1 className="text-2xl font-bold">Shopping Cart</h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        {/* Empty Cart */}
        <div className="container mx-auto px-4 py-16">
          <div className="text-center max-w-md mx-auto">
            <ShoppingBag className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
            <h2 className="text-2xl font-bold mb-4">Your cart is empty</h2>
            <p className="text-muted-foreground mb-8">
              Looks like you haven't added any items to your cart yet. Start shopping to fill it up!
            </p>
            <Link href="/">
              <Button size="lg">Start Shopping</Button>
            </Link>
          </div>
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
            <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Continue Shopping
            </Link>
            <h1 className="text-2xl font-bold">Shopping Cart</h1>
            <Badge variant="secondary">{cartState.itemCount} items</Badge>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Cart Items */}
          <div className="lg:col-span-2 space-y-4">
            <h2 className="text-xl font-semibold mb-4">Cart Items</h2>

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
                          <p className="font-semibold">${(item.price * item.quantity).toFixed(2)}</p>
                          <p className="text-sm text-muted-foreground">${item.price} each</p>
                        </div>
                      </div>

                      {item.quantity >= item.stock && <p className="text-sm text-red-500">Maximum quantity reached</p>}
                    </div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>

          {/* Order Summary */}
          <div className="lg:col-span-1">
            <Card className="sticky top-4">
              <CardHeader>
                <CardTitle>Order Summary</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="space-y-2">
                  <div className="flex justify-between">
                    <span>Subtotal ({cartState.itemCount} items)</span>
                    <span>${cartState.total.toFixed(2)}</span>
                  </div>

                  <div className="flex justify-between">
                    <span>Shipping</span>
                    <span>
                      {shippingCost === 0 ? (
                        <span className="text-green-600">Free</span>
                      ) : (
                        `$${shippingCost.toFixed(2)}`
                      )}
                    </span>
                  </div>

                  <div className="flex justify-between">
                    <span>Tax</span>
                    <span>${tax.toFixed(2)}</span>
                  </div>

                  {appliedDiscount && (
                    <div className="flex justify-between text-green-600">
                      <span>Discount ({appliedDiscount.code})</span>
                      <span>-${appliedDiscount.amount.toFixed(2)}</span>
                    </div>
                  )}

                  {cartState.total < 50 && (
                    <p className="text-sm text-muted-foreground">
                      Add ${(50 - cartState.total).toFixed(2)} more for free shipping
                    </p>
                  )}
                </div>

                <DiscountCodeInput
                  subtotal={cartState.total}
                  onDiscountApplied={setAppliedDiscount}
                  onDiscountRemoved={() => setAppliedDiscount(null)}
                  appliedDiscount={appliedDiscount}
                />

                <Separator />

                <div className="flex justify-between text-lg font-semibold">
                  <span>Total</span>
                  <span>${finalTotal.toFixed(2)}</span>
                </div>

                <Button onClick={handleProceedToCheckout} disabled={isValidating} className="w-full" size="lg">
                  <CreditCard className="h-5 w-5 mr-2" />
                  {isValidating ? "Validating..." : "Proceed to Checkout"}
                </Button>

                <div className="text-center">
                  <Link href="/">
                    <Button variant="ghost" className="text-sm">
                      Continue Shopping
                    </Button>
                  </Link>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
