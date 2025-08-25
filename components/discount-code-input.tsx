"use client"

import { useState } from "react"
import { Tag, Check, X } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Card, CardContent } from "@/components/ui/card"
import { useCart } from "@/contexts/cart-context"

// Mock discount codes
const discountCodes = {
  WELCOME10: { type: "percentage", value: 10, minOrder: 0, description: "Giảm 10% giá trị đơn hàng của bạn" },
  SAVE20: { type: "percentage", value: 20, minOrder: 50, description: "Giảm 20% với đơn hàng trên 250.000 VNĐ" },
  FREESHIP: { type: "shipping", value: 0, minOrder: 25, description: "Miễn phí vận chuyển với đơn hàng trên 150.000 VNĐ" },
  NEWCUSTOMER: { type: "fixed", value: 15, minOrder: 30, description: "Giảm 15% với đơn hàng trên 100.000 VNĐ" },
  HOLIDAY25: { type: "percentage", value: 25, minOrder: 100, description: "Giảm 25% với đơn hàng trên 400.000 VNĐ" },
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
      setError("Mã không hợp lệ")
      setIsApplying(false)
      return
    }

    if (subtotal < discount.minOrder) {
      setError(`Đơn hàng cần đạt tối thiểu $${discount.minOrder} để sử dụng mã này`)
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
                <p className="font-semibold text-green-800">Mã được áp dụng: {appliedDiscount.code}</p>
                <p className="text-sm text-green-700">{appliedDiscount.description}</p>
              </div>
            </div>
            <div className="text-right">
              <p className="font-semibold text-green-800">-{appliedDiscount.amount.toLocaleString('vi-VN')} VNĐ</p>
              <Button
                variant="ghost"
                size="sm"
                onClick={handleRemoveDiscount}
                className="text-green-700 hover:text-green-800 p-0 h-auto"
              >
                Xóa
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
            <span className="font-medium">Mã Giảm Giá</span>
          </div>

          <div className="flex gap-2">
            <Input
              placeholder="Nhập mã giảm giá"
              value={discountCode}
              onChange={(e) => setDiscountCode(e.target.value)}
              onKeyPress={(e) => e.key === "Enter" && handleApplyDiscount()}
              className={error ? "border-red-500" : ""}
            />
            <Button onClick={handleApplyDiscount} disabled={!discountCode.trim() || isApplying} variant="outline">
              {isApplying ? "Đang áp dụng..." : "Áp dụng"}
            </Button>
          </div>

          {error && (
            <div className="flex items-center gap-2 text-sm text-red-600">
              <X className="h-4 w-4" />
              <span>{error}</span>
            </div>
          )}

          <div className="text-xs text-muted-foreground">
            <p className="font-medium mb-1">Mã giảm giá của bạn:</p>
            <ul className="space-y-1">
              <li>• WELCOME10 - Giảm 10% giá trị đơn hàng của bạn</li>
              <li>• SAVE20 - Giảm 20% với đơn hàng trên 250.000 VNĐ</li>
              <li>• FREESHIP - Miễn phí vận chuyển với đơn hàng trên 150.000 VNĐ</li>
              <li>• NEWCUSTOMER - Giảm 15% với đơn hàng trên 100.000 VNĐ</li>
            </ul>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}
