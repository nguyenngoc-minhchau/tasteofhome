"use client"

import Link from "next/link"
import { CheckCircle, Package, ArrowRight } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

export default function CheckoutSuccessPage() {
  // In a real app, you'd get the order ID from the URL or state
  const orderId = "ORD-2024-005"

  return (
    <div className="min-h-screen bg-background flex items-center justify-center">
      <div className="container mx-auto px-4 py-8">
        <div className="max-w-2xl mx-auto text-center">
          <Card>
            <CardHeader className="pb-4">
              <div className="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                <CheckCircle className="h-8 w-8 text-green-600" />
              </div>
              <CardTitle className="text-2xl">Order Placed Successfully!</CardTitle>
              <p className="text-muted-foreground">
                Thank you for your purchase. Your order has been received and is being processed.
              </p>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="bg-gray-50 p-4 rounded-lg">
                <p className="text-sm text-muted-foreground">Order Number</p>
                <p className="font-mono font-semibold text-lg">{orderId}</p>
              </div>

              <div className="space-y-4">
                <div className="flex items-center gap-3 text-sm">
                  <Package className="h-5 w-5 text-blue-600" />
                  <span>You will receive an email confirmation shortly</span>
                </div>
                <div className="flex items-center gap-3 text-sm">
                  <Package className="h-5 w-5 text-blue-600" />
                  <span>Estimated delivery: 3-5 business days</span>
                </div>
              </div>

              <div className="flex flex-col sm:flex-row gap-3">
                <Link href={`/orders/${orderId}`} className="flex-1">
                  <Button variant="outline" className="w-full bg-transparent">
                    Track Your Order
                    <ArrowRight className="h-4 w-4 ml-2" />
                  </Button>
                </Link>
                <Link href="/" className="flex-1">
                  <Button className="w-full">Continue Shopping</Button>
                </Link>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
