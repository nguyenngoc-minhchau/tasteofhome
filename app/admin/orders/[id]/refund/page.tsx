"use client"

import { useState } from "react"
import { useParams, useRouter } from "next/navigation"
import Link from "next/link"
import { ArrowLeft, DollarSign, AlertTriangle, CheckCircle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Separator } from "@/components/ui/separator"
import { Badge } from "@/components/ui/badge"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"

// Mock order data for refund
const orderData = {
  "ORD-2024-001": {
    id: "ORD-2024-001",
    customer: "John Doe",
    email: "john@example.com",
    date: "2024-01-15",
    status: "delivered",
    paymentStatus: "paid",
    paymentMethod: "Credit Card ending in 4242",
    total: 67.48,
    subtotal: 62.48,
    shipping: 0,
    tax: 5.0,
    items: [
      {
        id: 1,
        name: "Premium Ethiopian Coffee Beans",
        quantity: 2,
        price: 24.99,
        image: "/placeholder.svg?height=80&width=80&text=Coffee",
      },
      {
        id: 2,
        name: "Himalayan Pink Salt",
        quantity: 1,
        price: 12.5,
        image: "/placeholder.svg?height=80&width=80&text=Salt",
      },
    ],
    refundEligible: true,
  },
}

export default function RefundPage() {
  const params = useParams()
  const router = useRouter()
  const orderId = params.id as string
  const order = orderData[orderId as keyof typeof orderData]

  const [refundAmount, setRefundAmount] = useState(order?.total.toString() || "0")
  const [refundReason, setRefundReason] = useState("")
  const [customReason, setCustomReason] = useState("")
  const [isProcessing, setIsProcessing] = useState(false)
  const [refundComplete, setRefundComplete] = useState(false)

  if (!order) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Order Not Found</h1>
          <Link href="/admin">
            <Button>Back to Admin</Button>
          </Link>
        </div>
      </div>
    )
  }

  const handleRefundSubmit = async () => {
    setIsProcessing(true)

    // Simulate payment gateway processing
    await new Promise((resolve) => setTimeout(resolve, 3000))

    // Simulate successful refund
    setRefundComplete(true)
    setIsProcessing(false)

    // In a real app, you would:
    // 1. Call payment gateway API
    // 2. Update order status in database
    // 3. Send email notification to customer
    // 4. Log the refund transaction
  }

  if (refundComplete) {
    return (
      <div className="min-h-screen bg-background">
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link href="/admin" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
                <ArrowLeft className="h-5 w-5" />
                Back to Admin
              </Link>
              <h1 className="text-2xl font-bold">Refund Complete</h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        <div className="container mx-auto px-4 py-8">
          <div className="max-w-2xl mx-auto">
            <Card>
              <CardHeader className="text-center">
                <div className="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                  <CheckCircle className="h-8 w-8 text-green-600" />
                </div>
                <CardTitle className="text-2xl">Refund Processed Successfully</CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="bg-gray-50 p-4 rounded-lg space-y-2">
                  <div className="flex justify-between">
                    <span className="font-medium">Order ID:</span>
                    <span className="font-mono">{order.id}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Customer:</span>
                    <span>{order.customer}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Refund Amount:</span>
                    <span className="font-bold text-green-600">${refundAmount}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Reason:</span>
                    <span>{refundReason === "other" ? customReason : refundReason}</span>
                  </div>
                </div>

                <div className="space-y-2 text-sm text-muted-foreground">
                  <p>✓ Payment gateway refund processed</p>
                  <p>✓ Order status updated to 'Refunded'</p>
                  <p>✓ Customer notification email sent</p>
                  <p>✓ Transaction logged in system</p>
                </div>

                <div className="flex gap-3">
                  <Link href="/admin" className="flex-1">
                    <Button className="w-full">Back to Admin Dashboard</Button>
                  </Link>
                  <Link href={`/admin/orders/${order.id}`} className="flex-1">
                    <Button variant="outline" className="w-full bg-transparent">
                      View Order Details
                    </Button>
                  </Link>
                </div>
              </CardContent>
            </Card>
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
            <Link href="/admin" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Admin
            </Link>
            <h1 className="text-2xl font-bold">Process Refund</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Order Details */}
          <Card>
            <CardHeader>
              <CardTitle>Order Details</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <div className="flex justify-between">
                  <span className="font-medium">Order ID:</span>
                  <span className="font-mono">{order.id}</span>
                </div>
                <div className="flex justify-between">
                  <span className="font-medium">Customer:</span>
                  <span>{order.customer}</span>
                </div>
                <div className="flex justify-between">
                  <span className="font-medium">Email:</span>
                  <span>{order.email}</span>
                </div>
                <div className="flex justify-between">
                  <span className="font-medium">Date:</span>
                  <span>{new Date(order.date).toLocaleDateString()}</span>
                </div>
                <div className="flex justify-between">
                  <span className="font-medium">Status:</span>
                  <Badge className="bg-green-500">{order.status}</Badge>
                </div>
                <div className="flex justify-between">
                  <span className="font-medium">Payment:</span>
                  <span>{order.paymentMethod}</span>
                </div>
              </div>

              <Separator />

              <div className="space-y-3">
                <h4 className="font-semibold">Order Items</h4>
                {order.items.map((item) => (
                  <div key={item.id} className="flex gap-3">
                    <img
                      src={item.image || "/placeholder.svg"}
                      alt={item.name}
                      className="w-12 h-12 object-cover rounded-md"
                    />
                    <div className="flex-1">
                      <p className="font-medium text-sm">{item.name}</p>
                      <p className="text-sm text-muted-foreground">
                        Qty: {item.quantity} × ${item.price}
                      </p>
                    </div>
                    <p className="font-semibold">${(item.price * item.quantity).toFixed(2)}</p>
                  </div>
                ))}
              </div>

              <Separator />

              <div className="space-y-2">
                <div className="flex justify-between">
                  <span>Subtotal:</span>
                  <span>${order.subtotal.toFixed(2)}</span>
                </div>
                <div className="flex justify-between">
                  <span>Shipping:</span>
                  <span>{order.shipping === 0 ? "Free" : `$${order.shipping.toFixed(2)}`}</span>
                </div>
                <div className="flex justify-between">
                  <span>Tax:</span>
                  <span>${order.tax.toFixed(2)}</span>
                </div>
                <Separator />
                <div className="flex justify-between text-lg font-semibold">
                  <span>Total:</span>
                  <span>${order.total.toFixed(2)}</span>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Refund Form */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <DollarSign className="h-5 w-5" />
                Refund Details
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
                <div className="flex items-start gap-2">
                  <AlertTriangle className="h-5 w-5 text-yellow-600 mt-0.5" />
                  <div className="text-sm">
                    <p className="font-medium text-yellow-800">Refund Verification</p>
                    <p className="text-yellow-700">
                      Please verify order details and confirm eligibility before processing refund.
                    </p>
                  </div>
                </div>
              </div>

              <div className="space-y-4">
                <div>
                  <Label htmlFor="refundAmount">Refund Amount</Label>
                  <Input
                    id="refundAmount"
                    type="number"
                    step="0.01"
                    max={order.total}
                    value={refundAmount}
                    onChange={(e) => setRefundAmount(e.target.value)}
                    className="text-lg font-semibold"
                  />
                  <p className="text-sm text-muted-foreground mt-1">
                    Maximum refundable amount: ${order.total.toFixed(2)}
                  </p>
                </div>

                <div>
                  <Label htmlFor="refundReason">Refund Reason</Label>
                  <Select value={refundReason} onValueChange={setRefundReason}>
                    <SelectTrigger>
                      <SelectValue placeholder="Select a reason for refund" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="defective-product">Defective Product</SelectItem>
                      <SelectItem value="wrong-item">Wrong Item Sent</SelectItem>
                      <SelectItem value="customer-request">Customer Request</SelectItem>
                      <SelectItem value="shipping-damage">Shipping Damage</SelectItem>
                      <SelectItem value="quality-issues">Quality Issues</SelectItem>
                      <SelectItem value="other">Other</SelectItem>
                    </SelectContent>
                  </Select>
                </div>

                {refundReason === "other" && (
                  <div>
                    <Label htmlFor="customReason">Custom Reason</Label>
                    <Textarea
                      id="customReason"
                      placeholder="Please specify the reason for refund..."
                      value={customReason}
                      onChange={(e) => setCustomReason(e.target.value)}
                    />
                  </div>
                )}

                <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                  <h4 className="font-medium text-blue-800 mb-2">Refund Process</h4>
                  <ul className="text-sm text-blue-700 space-y-1">
                    <li>• Refund will be processed to original payment method</li>
                    <li>• Customer will receive email notification</li>
                    <li>• Refund may take 3-5 business days to appear</li>
                    <li>• Order status will be updated to 'Refunded'</li>
                  </ul>
                </div>

                <Button
                  onClick={handleRefundSubmit}
                  disabled={!refundAmount || !refundReason || isProcessing}
                  className="w-full"
                  size="lg"
                >
                  {isProcessing ? "Processing Refund..." : `Process Refund - $${refundAmount}`}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
