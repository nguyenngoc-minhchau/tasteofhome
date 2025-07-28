"use client"

import { useParams } from "next/navigation"
import Link from "next/link"
import { ArrowLeft, Package, CheckCircle, Clock, Download, Truck, AlertCircle, MapPin } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Separator } from "@/components/ui/separator"
import { Progress } from "@/components/ui/progress"

// Mock detailed return data
const returnDetails = {
  "RET-ORD-2024-005-001": {
    id: "RET-ORD-2024-005-001",
    orderId: "ORD-2024-005",
    date: "2024-01-21",
    status: "approved",
    reason: "defective",
    reasonDescription: "The chocolate arrived melted and damaged due to poor packaging during shipping.",
    items: [
      {
        id: 4,
        name: "Artisan Dark Chocolate",
        quantity: 1,
        originalPrice: 32.0,
        refundAmount: 32.0,
        image: "/placeholder.svg?height=80&width=80&text=Chocolate",
      },
    ],
    totalRefund: 32.0,
    trackingNumber: "RET-1Z999AA1234567893",
    estimatedProcessing: "2024-01-25",
    returnAddress: {
      name: "Returns Department",
      street: "123 Warehouse Street",
      city: "Distribution Center",
      state: "NY",
      zip: "10001",
      country: "United States",
    },
    timeline: [
      {
        status: "Request Submitted",
        date: "2024-01-21 2:30 PM",
        description: "Return request submitted and received",
        completed: true,
      },
      {
        status: "Under Review",
        date: "2024-01-21 3:15 PM",
        description: "Return request is being reviewed by our team",
        completed: true,
      },
      {
        status: "Approved",
        date: "2024-01-22 10:00 AM",
        description: "Return request approved. Return label generated.",
        completed: true,
      },
      {
        status: "Package Items",
        date: "",
        description: "Package items securely and attach return label",
        completed: false,
      },
      {
        status: "Items Received",
        date: "",
        description: "We'll inspect your returned items",
        completed: false,
      },
      {
        status: "Refund Processed",
        date: "",
        description: "Refund will be processed to original payment method",
        completed: false,
      },
    ],
    instructions: [
      "Package items in original packaging if available",
      "Include this return authorization number: RET-ORD-2024-005-001",
      "Attach the provided return shipping label",
      "Drop off at any authorized shipping location",
      "Keep your receipt as proof of shipment",
    ],
  },
  "RET-ORD-2024-005-002": {
    id: "RET-ORD-2024-005-002",
    orderId: "ORD-2024-005",
    date: "2024-01-22",
    status: "completed",
    reason: "changed-mind",
    reasonDescription: "Decided the scent was too strong for my preference.",
    items: [
      {
        id: 7,
        name: "French Lavender Oil",
        quantity: 1,
        originalPrice: 45.0,
        refundAmount: 45.0,
        image: "/placeholder.svg?height=80&width=80&text=Lavender",
      },
    ],
    totalRefund: 45.0,
    trackingNumber: "RET-1Z999AA1234567894",
    completedDate: "2024-01-24",
    refundMethod: "Credit Card ending in 4242",
    refundDate: "2024-01-24",
    returnAddress: {
      name: "Returns Department",
      street: "123 Warehouse Street",
      city: "Distribution Center",
      state: "NY",
      zip: "10001",
      country: "United States",
    },
    timeline: [
      {
        status: "Request Submitted",
        date: "2024-01-22 11:45 AM",
        description: "Return request submitted and received",
        completed: true,
      },
      {
        status: "Under Review",
        date: "2024-01-22 12:30 PM",
        description: "Return request is being reviewed by our team",
        completed: true,
      },
      {
        status: "Approved",
        date: "2024-01-22 2:00 PM",
        description: "Return request approved. Return label generated.",
        completed: true,
      },
      {
        status: "Items Shipped",
        date: "2024-01-23 9:00 AM",
        description: "Items shipped back to our facility",
        completed: true,
      },
      {
        status: "Items Received",
        date: "2024-01-24 11:00 AM",
        description: "Items received and inspected successfully",
        completed: true,
      },
      {
        status: "Refund Processed",
        date: "2024-01-24 3:30 PM",
        description: "Refund processed to original payment method",
        completed: true,
      },
    ],
  },
}

const statusColors = {
  pending: "bg-yellow-500",
  approved: "bg-blue-500",
  processing: "bg-orange-500",
  completed: "bg-green-500",
  rejected: "bg-red-500",
}

const statusIcons = {
  pending: Clock,
  approved: CheckCircle,
  processing: Package,
  completed: CheckCircle,
  rejected: AlertCircle,
}

const reasonLabels = {
  defective: "Defective/Damaged Product",
  "wrong-item": "Wrong Item Received",
  "not-as-described": "Not as Described",
  "quality-issues": "Quality Issues",
  "changed-mind": "Changed Mind",
  other: "Other",
}

export default function ReturnDetailPage() {
  const params = useParams()
  const returnId = params.id as string
  const returnData = returnDetails[returnId as keyof typeof returnDetails]

  if (!returnData) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Return Request Not Found</h1>
          <Link href="/returns">
            <Button>Back to Returns</Button>
          </Link>
        </div>
      </div>
    )
  }

  const StatusIcon = statusIcons[returnData.status as keyof typeof statusIcons]
  const completedSteps = returnData.timeline.filter((step) => step.completed).length
  const progressPercentage = (completedSteps / returnData.timeline.length) * 100

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/returns" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Returns
            </Link>
            <h1 className="text-2xl font-bold">Return Details</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto space-y-8">
          {/* Return Header */}
          <Card>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div>
                  <CardTitle className="text-2xl">{returnData.id}</CardTitle>
                  <p className="text-muted-foreground">
                    Submitted on {new Date(returnData.date).toLocaleDateString()} • Order: {returnData.orderId}
                  </p>
                </div>
                <div className="text-right">
                  <Badge className={`${statusColors[returnData.status as keyof typeof statusColors]} mb-2`}>
                    <StatusIcon className="h-4 w-4 mr-1" />
                    {returnData.status.charAt(0).toUpperCase() + returnData.status.slice(1)}
                  </Badge>
                  <p className="text-2xl font-bold text-green-600">${returnData.totalRefund.toFixed(2)}</p>
                </div>
              </div>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div>
                  <h4 className="font-semibold mb-2">Return Reason</h4>
                  <p className="text-sm font-medium">{reasonLabels[returnData.reason as keyof typeof reasonLabels]}</p>
                  {returnData.reasonDescription && (
                    <p className="text-sm text-muted-foreground mt-1">{returnData.reasonDescription}</p>
                  )}
                </div>

                {returnData.trackingNumber && (
                  <div>
                    <h4 className="font-semibold mb-2">Return Tracking</h4>
                    <p className="font-mono text-sm">{returnData.trackingNumber}</p>
                  </div>
                )}

                <div>
                  <h4 className="font-semibold mb-2">
                    {returnData.status === "completed" ? "Completed" : "Expected Processing"}
                  </h4>
                  <p className="text-sm">
                    {returnData.status === "completed" && returnData.completedDate
                      ? new Date(returnData.completedDate).toLocaleDateString()
                      : new Date(returnData.estimatedProcessing).toLocaleDateString()}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Return Progress */}
          <Card>
            <CardHeader>
              <CardTitle>Return Progress</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-6">
                <div>
                  <div className="flex justify-between text-sm mb-2">
                    <span>Progress</span>
                    <span>{Math.round(progressPercentage)}% Complete</span>
                  </div>
                  <Progress value={progressPercentage} className="h-2" />
                </div>

                <div className="space-y-4">
                  {returnData.timeline.map((step, index) => (
                    <div key={index} className="flex items-start gap-4">
                      <div
                        className={`w-8 h-8 rounded-full flex items-center justify-center ${
                          step.completed ? "bg-green-500 text-white" : "bg-gray-200 text-gray-500"
                        }`}
                      >
                        {step.completed ? <CheckCircle className="h-4 w-4" /> : <Clock className="h-4 w-4" />}
                      </div>
                      <div className="flex-1">
                        <h4 className={`font-semibold ${step.completed ? "text-green-700" : "text-gray-500"}`}>
                          {step.status}
                        </h4>
                        <p className="text-sm text-muted-foreground">{step.description}</p>
                        {step.date && <p className="text-xs text-muted-foreground mt-1">{step.date}</p>}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </CardContent>
          </Card>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Return Items */}
            <Card>
              <CardHeader>
                <CardTitle>Items to Return</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {returnData.items.map((item) => (
                    <div key={item.id} className="flex gap-4">
                      <img
                        src={item.image || "/placeholder.svg"}
                        alt={item.name}
                        className="w-16 h-16 object-cover rounded-md"
                      />
                      <div className="flex-1">
                        <h4 className="font-semibold">{item.name}</h4>
                        <p className="text-sm text-muted-foreground">Quantity: {item.quantity}</p>
                        <div className="flex justify-between mt-1">
                          <span className="text-sm">Original Price:</span>
                          <span className="text-sm">${item.originalPrice.toFixed(2)}</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-sm font-medium">Refund Amount:</span>
                          <span className="text-sm font-medium text-green-600">${item.refundAmount.toFixed(2)}</span>
                        </div>
                      </div>
                    </div>
                  ))}

                  <Separator />

                  <div className="flex justify-between font-semibold text-lg">
                    <span>Total Refund:</span>
                    <span className="text-green-600">${returnData.totalRefund.toFixed(2)}</span>
                  </div>

                  {returnData.status === "completed" && returnData.refundMethod && (
                    <div className="bg-green-50 border border-green-200 rounded-lg p-3">
                      <p className="text-sm text-green-800 font-medium">Refund Completed</p>
                      <p className="text-sm text-green-700">Refunded to: {returnData.refundMethod}</p>
                      <p className="text-sm text-green-700">
                        Date: {returnData.refundDate && new Date(returnData.refundDate).toLocaleDateString()}
                      </p>
                    </div>
                  )}
                </div>
              </CardContent>
            </Card>

            {/* Return Instructions & Address */}
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <MapPin className="h-5 w-5" />
                  Return Instructions
                </CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  <div>
                    <h4 className="font-semibold mb-2">Return Address</h4>
                    <div className="text-sm space-y-1">
                      <p className="font-medium">{returnData.returnAddress.name}</p>
                      <p>{returnData.returnAddress.street}</p>
                      <p>
                        {returnData.returnAddress.city}, {returnData.returnAddress.state} {returnData.returnAddress.zip}
                      </p>
                      <p>{returnData.returnAddress.country}</p>
                    </div>
                  </div>

                  <Separator />

                  <div>
                    <h4 className="font-semibold mb-2">Instructions</h4>
                    <ul className="text-sm space-y-1">
                      {returnData.instructions.map((instruction, index) => (
                        <li key={index} className="flex items-start gap-2">
                          <span className="text-blue-600 mt-1">•</span>
                          <span>{instruction}</span>
                        </li>
                      ))}
                    </ul>
                  </div>

                  <div className="space-y-2 pt-4">
                    {returnData.status === "approved" && (
                      <Button className="w-full">
                        <Download className="h-4 w-4 mr-2" />
                        Download Return Label
                      </Button>
                    )}

                    {returnData.trackingNumber && returnData.status !== "completed" && (
                      <Button variant="outline" className="w-full bg-transparent">
                        <Truck className="h-4 w-4 mr-2" />
                        Track Return Package
                      </Button>
                    )}

                    <Link href={`/orders/${returnData.orderId}`}>
                      <Button variant="outline" className="w-full bg-transparent">
                        <Package className="h-4 w-4 mr-2" />
                        View Original Order
                      </Button>
                    </Link>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
