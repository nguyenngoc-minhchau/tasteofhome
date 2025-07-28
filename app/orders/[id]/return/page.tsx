"use client"

import { useState } from "react"
import { useParams, useRouter } from "next/navigation"
import Link from "next/link"
import { ArrowLeft, Package, CheckCircle, AlertCircle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Checkbox } from "@/components/ui/checkbox"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Separator } from "@/components/ui/separator"
import { Badge } from "@/components/ui/badge"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"

// Mock order data for returns - Updated with recent delivery
const orderData = {
  "ORD-2024-001": {
    id: "ORD-2024-001",
    date: "2024-01-15",
    status: "delivered",
    deliveryDate: "2024-01-17",
    items: [
      {
        id: 1,
        name: "Premium Ethiopian Coffee Beans",
        quantity: 2,
        price: 24.99,
        image: "/placeholder.svg?height=80&width=80&text=Coffee",
        returnEligible: true,
        returnWindow: 30, // days
      },
      {
        id: 2,
        name: "Himalayan Pink Salt",
        quantity: 1,
        price: 12.5,
        image: "/placeholder.svg?height=80&width=80&text=Salt",
        returnEligible: true,
        returnWindow: 30,
      },
    ],
  },
  "ORD-2024-005": {
    id: "ORD-2024-005",
    date: "2024-01-18",
    status: "delivered",
    deliveryDate: "2024-01-20", // Recently delivered - perfect for returns
    items: [
      {
        id: 3,
        name: "Organic Green Tea",
        quantity: 1,
        price: 18.75,
        image: "/placeholder.svg?height=80&width=80&text=Tea",
        returnEligible: true,
        returnWindow: 30,
      },
      {
        id: 4,
        name: "Artisan Dark Chocolate",
        quantity: 2,
        price: 32.0,
        image: "/placeholder.svg?height=80&width=80&text=Chocolate",
        returnEligible: true,
        returnWindow: 30,
      },
      {
        id: 7,
        name: "French Lavender Oil",
        quantity: 1,
        price: 45.0,
        image: "/placeholder.svg?height=80&width=80&text=Lavender",
        returnEligible: true,
        returnWindow: 30,
      },
    ],
  },
}

export default function ReturnRequestPage() {
  const params = useParams()
  const router = useRouter()
  const orderId = params.id as string
  const order = orderData[orderId as keyof typeof orderData]

  const [selectedItems, setSelectedItems] = useState<{ [key: number]: { selected: boolean; quantity: number } }>({})
  const [returnReason, setReturnReason] = useState("")
  const [comments, setComments] = useState("")
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [returnSubmitted, setReturnSubmitted] = useState(false)

  if (!order) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Order Not Found</h1>
          <Link href="/orders">
            <Button>Back to Orders</Button>
          </Link>
        </div>
      </div>
    )
  }

  const handleItemSelection = (itemId: number, selected: boolean) => {
    setSelectedItems((prev) => ({
      ...prev,
      [itemId]: {
        selected,
        quantity: selected ? 1 : 0,
      },
    }))
  }

  const handleQuantityChange = (itemId: number, quantity: number) => {
    setSelectedItems((prev) => ({
      ...prev,
      [itemId]: {
        ...prev[itemId],
        quantity,
      },
    }))
  }

  const handleSubmitReturn = async () => {
    setIsSubmitting(true)

    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 2000))

    setReturnSubmitted(true)
    setIsSubmitting(false)

    // In a real app, you would:
    // 1. Create return request in database
    // 2. Send email confirmation to customer
    // 3. Notify administrator staff
    // 4. Generate return shipping label
  }

  const selectedItemsList = Object.entries(selectedItems)
    .filter(([_, data]) => data.selected)
    .map(([itemId, data]) => {
      const item = order.items.find((i) => i.id === Number.parseInt(itemId))
      return { ...item, returnQuantity: data.quantity }
    })

  const totalRefundAmount = selectedItemsList.reduce(
    (sum, item) => sum + (item?.price || 0) * (item?.returnQuantity || 0),
    0,
  )

  if (returnSubmitted) {
    return (
      <div className="min-h-screen bg-background">
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link href="/orders" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
                <ArrowLeft className="h-5 w-5" />
                Back to Orders
              </Link>
              <h1 className="text-2xl font-bold">Return Request Submitted</h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        <div className="container mx-auto px-4 py-8">
          <div className="max-w-2xl mx-auto">
            <Card>
              <CardHeader className="text-center">
                <div className="mx-auto w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-4">
                  <CheckCircle className="h-8 w-8 text-blue-600" />
                </div>
                <CardTitle className="text-2xl">Return Request Submitted</CardTitle>
                <p className="text-muted-foreground">Your return request has been received and is pending approval.</p>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="bg-gray-50 p-4 rounded-lg space-y-2">
                  <div className="flex justify-between">
                    <span className="font-medium">Return Request ID:</span>
                    <span className="font-mono">RET-{order.id}-001</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Order ID:</span>
                    <span className="font-mono">{order.id}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Items to Return:</span>
                    <span>{selectedItemsList.length} item(s)</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Expected Refund:</span>
                    <span className="font-bold text-green-600">${totalRefundAmount.toFixed(2)}</span>
                  </div>
                </div>

                <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                  <h4 className="font-medium text-blue-800 mb-2">Return Instructions</h4>
                  <ul className="text-sm text-blue-700 space-y-1">
                    <li>• Package items securely in original packaging if available</li>
                    <li>• Include return authorization number: RET-{order.id}-001</li>
                    <li>• Ship to: Returns Department, 123 Warehouse St, City, State 12345</li>
                    <li>• Use trackable shipping method</li>
                    <li>• Returns must be received within 14 days</li>
                  </ul>
                </div>

                <div className="space-y-2 text-sm text-muted-foreground">
                  <p>✓ Return request created with status 'Pending Approval'</p>
                  <p>✓ Email confirmation sent to your registered email</p>
                  <p>✓ Administrator staff notified for review</p>
                  <p>• Return shipping label will be emailed once approved</p>
                </div>

                <div className="flex gap-3">
                  <Link href="/orders" className="flex-1">
                    <Button className="w-full">Back to Orders</Button>
                  </Link>
                  <Link href={`/orders/${order.id}`} className="flex-1">
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
            <Link
              href={`/orders/${order.id}`}
              className="flex items-center gap-2 text-lg font-semibold hover:text-primary"
            >
              <ArrowLeft className="h-5 w-5" />
              Back to Order
            </Link>
            <h1 className="text-2xl font-bold">Return Request</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto space-y-8">
          {/* Order Info */}
          <Card>
            <CardHeader>
              <CardTitle>Order Information</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div>
                  <p className="text-sm text-muted-foreground">Order ID</p>
                  <p className="font-mono font-semibold">{order.id}</p>
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Order Date</p>
                  <p className="font-semibold">{new Date(order.date).toLocaleDateString()}</p>
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Delivered</p>
                  <p className="font-semibold">{new Date(order.deliveryDate).toLocaleDateString()}</p>
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Status</p>
                  <Badge className="bg-green-500">{order.status}</Badge>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Select Items to Return */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Package className="h-5 w-5" />
                Select Items to Return
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              {order.items.map((item) => {
                const isSelected = selectedItems[item.id]?.selected || false
                const selectedQuantity = selectedItems[item.id]?.quantity || 1
                const daysFromDelivery = Math.floor(
                  (Date.now() - new Date(order.deliveryDate).getTime()) / (1000 * 60 * 60 * 24),
                )
                const isEligible = item.returnEligible && daysFromDelivery <= item.returnWindow

                return (
                  <div
                    key={item.id}
                    className={`border rounded-lg p-4 ${isSelected ? "border-blue-500 bg-blue-50" : ""}`}
                  >
                    <div className="flex gap-4">
                      <img
                        src={item.image || "/placeholder.svg"}
                        alt={item.name}
                        className="w-20 h-20 object-cover rounded-md"
                      />
                      <div className="flex-1 space-y-2">
                        <div className="flex items-start justify-between">
                          <div>
                            <h4 className="font-semibold">{item.name}</h4>
                            <p className="text-sm text-muted-foreground">
                              Original quantity: {item.quantity} × ${item.price}
                            </p>
                            <p className="font-semibold">${(item.price * item.quantity).toFixed(2)}</p>
                          </div>
                          <div className="flex items-center gap-2">
                            {isEligible ? (
                              <Badge variant="outline" className="text-green-600 border-green-600">
                                Return Eligible
                              </Badge>
                            ) : (
                              <Badge variant="outline" className="text-red-600 border-red-600">
                                Return Window Expired
                              </Badge>
                            )}
                          </div>
                        </div>

                        {isEligible && (
                          <div className="flex items-center gap-4">
                            <div className="flex items-center space-x-2">
                              <Checkbox
                                id={`item-${item.id}`}
                                checked={isSelected}
                                onCheckedChange={(checked) => handleItemSelection(item.id, checked as boolean)}
                              />
                              <Label htmlFor={`item-${item.id}`}>Return this item</Label>
                            </div>

                            {isSelected && (
                              <div className="flex items-center gap-2">
                                <Label htmlFor={`quantity-${item.id}`} className="text-sm">
                                  Quantity:
                                </Label>
                                <Select
                                  value={selectedQuantity.toString()}
                                  onValueChange={(value) => handleQuantityChange(item.id, Number.parseInt(value))}
                                >
                                  <SelectTrigger className="w-20">
                                    <SelectValue />
                                  </SelectTrigger>
                                  <SelectContent>
                                    {Array.from({ length: item.quantity }, (_, i) => (
                                      <SelectItem key={i + 1} value={(i + 1).toString()}>
                                        {i + 1}
                                      </SelectItem>
                                    ))}
                                  </SelectContent>
                                </Select>
                              </div>
                            )}
                          </div>
                        )}

                        {!isEligible && (
                          <div className="flex items-center gap-2 text-sm text-red-600">
                            <AlertCircle className="h-4 w-4" />
                            <span>Return window expired ({daysFromDelivery} days since delivery)</span>
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                )
              })}
            </CardContent>
          </Card>

          {/* Return Reason and Comments */}
          {selectedItemsList.length > 0 && (
            <Card>
              <CardHeader>
                <CardTitle>Return Details</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div>
                  <Label htmlFor="returnReason">Reason for Return</Label>
                  <Select value={returnReason} onValueChange={setReturnReason}>
                    <SelectTrigger>
                      <SelectValue placeholder="Select a reason for return" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="defective">Defective/Damaged Product</SelectItem>
                      <SelectItem value="wrong-item">Wrong Item Received</SelectItem>
                      <SelectItem value="not-as-described">Not as Described</SelectItem>
                      <SelectItem value="quality-issues">Quality Issues</SelectItem>
                      <SelectItem value="changed-mind">Changed Mind</SelectItem>
                      <SelectItem value="other">Other</SelectItem>
                    </SelectContent>
                  </Select>
                </div>

                <div>
                  <Label htmlFor="comments">Additional Comments</Label>
                  <Textarea
                    id="comments"
                    placeholder="Please provide additional details about your return request..."
                    value={comments}
                    onChange={(e) => setComments(e.target.value)}
                    rows={4}
                  />
                </div>
              </CardContent>
            </Card>
          )}

          {/* Return Summary */}
          {selectedItemsList.length > 0 && (
            <Card>
              <CardHeader>
                <CardTitle>Return Summary</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="space-y-2">
                  {selectedItemsList.map((item) => (
                    <div key={item?.id} className="flex justify-between">
                      <span>
                        {item?.returnQuantity}x {item?.name}
                      </span>
                      <span>${((item?.price || 0) * (item?.returnQuantity || 0)).toFixed(2)}</span>
                    </div>
                  ))}
                </div>

                <Separator />

                <div className="flex justify-between text-lg font-semibold">
                  <span>Expected Refund Amount:</span>
                  <span className="text-green-600">${totalRefundAmount.toFixed(2)}</span>
                </div>

                <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
                  <div className="flex items-start gap-2">
                    <AlertCircle className="h-5 w-5 text-yellow-600 mt-0.5" />
                    <div className="text-sm">
                      <p className="font-medium text-yellow-800">Return Policy</p>
                      <p className="text-yellow-700">
                        Items must be returned in original condition. Refund will be processed after inspection. Return
                        shipping costs may apply unless item is defective.
                      </p>
                    </div>
                  </div>
                </div>

                <Button
                  onClick={handleSubmitReturn}
                  disabled={!returnReason || isSubmitting}
                  className="w-full"
                  size="lg"
                >
                  {isSubmitting ? "Submitting Return Request..." : "Submit Return Request"}
                </Button>
              </CardContent>
            </Card>
          )}
        </div>
      </div>
    </div>
  )
}
