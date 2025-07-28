"use client"

import { useState } from "react"
import Link from "next/link"
import { ArrowLeft, Package, Search, Filter, Eye, Clock, CheckCircle, XCircle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

// Mock return requests data
const returnRequests = [
  {
    id: "RET-ORD-2024-005-001",
    orderId: "ORD-2024-005",
    date: "2024-01-21",
    status: "approved",
    reason: "defective",
    items: [{ name: "Artisan Dark Chocolate", quantity: 1, refundAmount: 32.0 }],
    totalRefund: 32.0,
    trackingNumber: "RET-1Z999AA1234567893",
    estimatedProcessing: "2024-01-25",
  },
  {
    id: "RET-ORD-2024-001-001",
    orderId: "ORD-2024-001",
    date: "2024-01-19",
    status: "pending",
    reason: "quality-issues",
    items: [{ name: "Premium Ethiopian Coffee Beans", quantity: 1, refundAmount: 24.99 }],
    totalRefund: 24.99,
    estimatedProcessing: "2024-01-23",
  },
  {
    id: "RET-ORD-2024-005-002",
    orderId: "ORD-2024-005",
    date: "2024-01-22",
    status: "processing",
    reason: "changed-mind",
    items: [{ name: "French Lavender Oil", quantity: 1, refundAmount: 45.0 }],
    totalRefund: 45.0,
    trackingNumber: "RET-1Z999AA1234567894",
    estimatedProcessing: "2024-01-26",
  },
  {
    id: "RET-ORD-2024-002-001",
    orderId: "ORD-2024-002",
    date: "2024-01-18",
    status: "completed",
    reason: "defective",
    items: [{ name: "Organic Green Tea", quantity: 1, refundAmount: 18.75 }],
    totalRefund: 18.75,
    completedDate: "2024-01-20",
    refundMethod: "Original Payment Method",
  },
]

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
  rejected: XCircle,
}

const reasonLabels = {
  defective: "Defective/Damaged",
  "wrong-item": "Wrong Item",
  "not-as-described": "Not as Described",
  "quality-issues": "Quality Issues",
  "changed-mind": "Changed Mind",
  other: "Other",
}

export default function ReturnsPage() {
  const [searchTerm, setSearchTerm] = useState("")
  const [statusFilter, setStatusFilter] = useState("all")
  const [selectedTab, setSelectedTab] = useState("all")

  const filteredReturns = returnRequests.filter((returnReq) => {
    const matchesSearch =
      returnReq.id.toLowerCase().includes(searchTerm.toLowerCase()) ||
      returnReq.orderId.toLowerCase().includes(searchTerm.toLowerCase()) ||
      returnReq.items.some((item) => item.name.toLowerCase().includes(searchTerm.toLowerCase()))

    const matchesStatus = selectedTab === "all" || returnReq.status === selectedTab

    return matchesSearch && matchesStatus
  })

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/orders" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Orders
            </Link>
            <h1 className="text-2xl font-bold">Return Requests</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-6xl mx-auto">
          <div className="flex items-center justify-between mb-8">
            <div>
              <h2 className="text-3xl font-bold">Your Return Requests</h2>
              <p className="text-muted-foreground">Track and manage your product returns</p>
            </div>
            <Link href="/orders">
              <Button>
                <Package className="h-4 w-4 mr-2" />
                Start New Return
              </Button>
            </Link>
          </div>

          {/* Search and Filters */}
          <Card className="mb-6">
            <CardContent className="p-4">
              <div className="flex flex-col md:flex-row gap-4">
                <div className="flex-1">
                  <div className="relative">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-4 w-4" />
                    <Input
                      placeholder="Search by return ID, order ID, or product name..."
                      value={searchTerm}
                      onChange={(e) => setSearchTerm(e.target.value)}
                      className="pl-10"
                    />
                  </div>
                </div>
                <div className="flex gap-2">
                  <Select value={statusFilter} onValueChange={setStatusFilter}>
                    <SelectTrigger className="w-40">
                      <Filter className="h-4 w-4 mr-2" />
                      <SelectValue placeholder="Filter by status" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="all">All Status</SelectItem>
                      <SelectItem value="pending">Pending</SelectItem>
                      <SelectItem value="approved">Approved</SelectItem>
                      <SelectItem value="processing">Processing</SelectItem>
                      <SelectItem value="completed">Completed</SelectItem>
                      <SelectItem value="rejected">Rejected</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Return Status Tabs */}
          <Tabs value={selectedTab} onValueChange={setSelectedTab} className="mb-6">
            <TabsList className="grid w-full grid-cols-6">
              <TabsTrigger value="all">All Returns</TabsTrigger>
              <TabsTrigger value="pending">Pending</TabsTrigger>
              <TabsTrigger value="approved">Approved</TabsTrigger>
              <TabsTrigger value="processing">Processing</TabsTrigger>
              <TabsTrigger value="completed">Completed</TabsTrigger>
              <TabsTrigger value="rejected">Rejected</TabsTrigger>
            </TabsList>

            <TabsContent value={selectedTab} className="mt-6">
              {filteredReturns.length === 0 ? (
                <div className="text-center py-12">
                  <Package className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
                  <h3 className="text-xl font-semibold mb-2">No return requests found</h3>
                  <p className="text-muted-foreground mb-6">
                    {selectedTab === "all"
                      ? "You haven't submitted any return requests yet."
                      : `No ${selectedTab} return requests found.`}
                  </p>
                  <Link href="/orders">
                    <Button>Browse Your Orders</Button>
                  </Link>
                </div>
              ) : (
                <div className="space-y-4">
                  {filteredReturns.map((returnReq) => {
                    const StatusIcon = statusIcons[returnReq.status as keyof typeof statusIcons]

                    return (
                      <Card key={returnReq.id} className="hover:shadow-md transition-shadow">
                        <CardHeader>
                          <div className="flex items-center justify-between">
                            <div>
                              <CardTitle className="text-lg">{returnReq.id}</CardTitle>
                              <p className="text-sm text-muted-foreground">
                                Order: {returnReq.orderId} • Submitted on{" "}
                                {new Date(returnReq.date).toLocaleDateString()}
                              </p>
                            </div>
                            <div className="text-right">
                              <Badge className={`${statusColors[returnReq.status as keyof typeof statusColors]} mb-2`}>
                                <StatusIcon className="h-4 w-4 mr-1" />
                                {returnReq.status.charAt(0).toUpperCase() + returnReq.status.slice(1)}
                              </Badge>
                              <p className="text-lg font-semibold">${returnReq.totalRefund.toFixed(2)}</p>
                            </div>
                          </div>
                        </CardHeader>
                        <CardContent>
                          <div className="space-y-4">
                            {/* Return Items */}
                            <div>
                              <h4 className="font-medium mb-2">Items to Return</h4>
                              <div className="space-y-1">
                                {returnReq.items.map((item, index) => (
                                  <div key={index} className="flex justify-between text-sm">
                                    <span>
                                      {item.quantity}x {item.name}
                                    </span>
                                    <span>${item.refundAmount.toFixed(2)}</span>
                                  </div>
                                ))}
                              </div>
                            </div>

                            {/* Return Reason */}
                            <div className="text-sm">
                              <span className="font-medium">Reason: </span>
                              <span>{reasonLabels[returnReq.reason as keyof typeof reasonLabels]}</span>
                            </div>

                            {/* Tracking Information */}
                            {returnReq.trackingNumber && (
                              <div className="text-sm">
                                <span className="font-medium">Return Tracking: </span>
                                <span className="font-mono">{returnReq.trackingNumber}</span>
                              </div>
                            )}

                            {/* Processing Information */}
                            <div className="text-sm">
                              <span className="font-medium">
                                {returnReq.status === "completed" ? "Completed: " : "Expected Processing: "}
                              </span>
                              <span>
                                {returnReq.status === "completed" && returnReq.completedDate
                                  ? new Date(returnReq.completedDate).toLocaleDateString()
                                  : new Date(returnReq.estimatedProcessing).toLocaleDateString()}
                              </span>
                            </div>

                            {/* Refund Method */}
                            {returnReq.status === "completed" && returnReq.refundMethod && (
                              <div className="text-sm">
                                <span className="font-medium">Refund Method: </span>
                                <span>{returnReq.refundMethod}</span>
                              </div>
                            )}

                            {/* Status-specific Information */}
                            {returnReq.status === "pending" && (
                              <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-3">
                                <p className="text-sm text-yellow-800">
                                  <Clock className="h-4 w-4 inline mr-1" />
                                  Your return request is being reviewed. You'll receive an email once it's approved.
                                </p>
                              </div>
                            )}

                            {returnReq.status === "approved" && (
                              <div className="bg-blue-50 border border-blue-200 rounded-lg p-3">
                                <p className="text-sm text-blue-800">
                                  <CheckCircle className="h-4 w-4 inline mr-1" />
                                  Return approved! Please package your items and ship them using the provided label.
                                </p>
                              </div>
                            )}

                            {returnReq.status === "processing" && (
                              <div className="bg-orange-50 border border-orange-200 rounded-lg p-3">
                                <p className="text-sm text-orange-800">
                                  <Package className="h-4 w-4 inline mr-1" />
                                  We've received your returned items and are processing your refund.
                                </p>
                              </div>
                            )}

                            {returnReq.status === "completed" && (
                              <div className="bg-green-50 border border-green-200 rounded-lg p-3">
                                <p className="text-sm text-green-800">
                                  <CheckCircle className="h-4 w-4 inline mr-1" />
                                  Return completed! Your refund has been processed and should appear in your account
                                  within 3-5 business days.
                                </p>
                              </div>
                            )}

                            {/* Action Buttons */}
                            <div className="flex gap-2 pt-2">
                              <Link href={`/returns/${returnReq.id}`}>
                                <Button variant="outline" size="sm">
                                  <Eye className="h-4 w-4 mr-2" />
                                  View Details
                                </Button>
                              </Link>

                              {returnReq.status === "approved" && (
                                <Button variant="outline" size="sm">
                                  <Package className="h-4 w-4 mr-2" />
                                  Download Label
                                </Button>
                              )}

                              {returnReq.trackingNumber && returnReq.status !== "completed" && (
                                <Button variant="outline" size="sm">
                                  <Package className="h-4 w-4 mr-2" />
                                  Track Return
                                </Button>
                              )}

                              {returnReq.status === "pending" && (
                                <Button
                                  variant="outline"
                                  size="sm"
                                  className="text-red-600 hover:text-red-700 bg-transparent"
                                >
                                  Cancel Request
                                </Button>
                              )}
                            </div>
                          </div>
                        </CardContent>
                      </Card>
                    )
                  })}
                </div>
              )}
            </TabsContent>
          </Tabs>
        </div>
      </div>
    </div>
  )
}
