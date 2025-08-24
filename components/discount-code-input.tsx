"use client"

import { useState } from "react"
import { Tag, Check, X } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Card, CardContent } from "@/components/ui/card"
import { useCart } from "@/contexts/cart-context"

// Mock discount codes
const discountCodes = {
  WELCOME10: { type: "percentage", value: 10, minOrder: 0, description: "10% off your order" },
  SAVE20: { type: "percentage", value: 20, minOrder: 50, description: "20% off orders over $50" },
  FREESHIP: { type: "shipping", value: 0, minOrder: 25, description: "Free shipping on orders over $25" },
  NEWCUSTOMER: { type: "fixed", value: 15, minOrder: 30, description: "$15 off orders over $30" },
  HOLIDAY25: { type: "percentage", value: 25, minOrder: 100, description: "25% off orders over $100" },
}

interface DiscountCodeInputProps {
  subtotal: number
  appliedDiscount?: { code: string; amount: number; type: string; description: string } | null
}

export function DiscountCodeInput({
  subtotal,
  appliedDiscount,
}: DiscountCodeInputProps) {
  const { dispatch } = useCart()
  const [discountCode, setDiscountCode] = useState("")
  const [isApplying, setIsApplying] = useState(false)
  const [error, setError] = useState("")

  const handleApplyDiscount = async () => {
    if (!discountCode.trim()) return

    setIsApplying(true)
    setError("")

    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 1000))

    const code = discountCode.toUpperCase()
    const discount = discountCodes[code as keyof typeof discountCodes]

    if (!discount) {
      setError("Invalid discount code")
      setIsApplying(false)
      return
    }

    if (subtotal < discount.minOrder) {
      setError(`Minimum order of $${discount.minOrder} required for this code`)
      setIsApplying(false)
      return
    }

    let discountAmount = 0
    if (discount.type === "percentage") {
      discountAmount = (subtotal * discount.value) / 100
    } else if (discount.type === "fixed") {
      discountAmount = discount.value
    } else if (discount.type === "shipping") {
      discountAmount = 5.99 // Assuming standard shipping cost
    }

    dispatch({
      type: "APPLY_DISCOUNT",
      payload: {
        code,
        amount: discountAmount,
        type: discount.type,
        description: discount.description,
      }
    })

    setDiscountCode("")
    setIsApplying(false)
  }

  const handleRemoveDiscount = () => {
    dispatch({ type: "REMOVE_DISCOUNT" })
    setError("")
  }

  if (appliedDiscount) {
    return (
      <Card className="border-green-200 bg-green-50">
        <CardContent className="p-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <div className="w-8 h-8 rounded-full bg-green-100 flex items-center justify-center">
                <Check className="h-4 w-4 text-green-600" />
              </div>
              <div>
                <p className="font-semibold text-green-800">Code Applied: {appliedDiscount.code}</p>
                <p className="text-sm text-green-700">{appliedDiscount.description}</p>
              </div>
            </div>
            <div className="text-right">
              <p className="font-semibold text-green-800">-${appliedDiscount.amount.toFixed(2)}</p>
              <Button
                variant="ghost"
                size="sm"
                onClick={handleRemoveDiscount}
                className="text-green-700 hover:text-green-800 p-0 h-auto"
              >
                Remove
              </Button>
            </div>
          </div>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card>
      <CardContent className="p-4">
        <div className="space-y-3">
          <div className="flex items-center gap-2">
            <Tag className="h-4 w-4 text-muted-foreground" />
            <span className="font-medium">Discount Code</span>
          </div>

          <div className="flex gap-2">
            <Input
              placeholder="Enter discount code"
              value={discountCode}
              onChange={(e) => setDiscountCode(e.target.value)}
              onKeyPress={(e) => e.key === "Enter" && handleApplyDiscount()}
              className={error ? "border-red-500" : ""}
            />
            <Button onClick={handleApplyDiscount} disabled={!discountCode.trim() || isApplying} variant="outline">
              {isApplying ? "Applying..." : "Apply"}
            </Button>
          </div>

          {error && (
            <div className="flex items-center gap-2 text-sm text-red-600">
              <X className="h-4 w-4" />
              <span>{error}</span>
            </div>
          )}

          <div className="text-xs text-muted-foreground">
            <p className="font-medium mb-1">Available codes to try:</p>
            <ul className="space-y-1">
              <li>• WELCOME10 - 10% off any order</li>
              <li>• SAVE20 - 20% off orders over $50</li>
              <li>• FREESHIP - Free shipping over $25</li>
              <li>• NEWCUSTOMER - $15 off orders over $30</li>
            </ul>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}
