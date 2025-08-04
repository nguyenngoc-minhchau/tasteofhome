"use client"

import { useState } from "react"
import Link from "next/link"
import {
  ArrowLeft,
  Package,
  Search,
  Filter,
  Eye,
  Clock,
  CheckCircle,
  XCircle,
  AlertTriangle,
  Download,
  Mail,
  MoreHorizontal,
} from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { Checkbox } from "@/components/ui/checkbox"

// Mock admin return requests data
const adminReturnRequests = [
  {
    id: "RET-ORD-2024-005-001",
    orderId: "ORD-2024-005",
    customerId: "CUST-001",
    customerName: "John Doe",
    customerEmail: "john.doe@example.com",
    date: "2024-01-21",
    status: "pending",
    priority: "high",
    reason: "defective",
    items: [{ name: "Artisan Dark Chocolate", quantity: 1, refundAmount: 32.0 }],
    totalRefund: 32.0,
    estimatedProcessing: "2024-01-25",
    notes: "Customer reported melted chocolate upon delivery",
    images: ["damage1.jpg", "damage2.jpg"],
  },
  {
    id: "RET-ORD-2024-001-001",
    orderId: "ORD-2024-001",
    customerId: "CUST-002",
    customerName: "Jane Smith",
    customerEmail: "jane.smith@example.com",
    date: "2024-01-19",
    status: "approved",
    priority: "medium",
    reason: "quality-issues",
    items: [{ name: "Premium Ethiopian Coffee Beans", quantity: 1, refundAmount: 24.99 }],
    totalRefund: 24.99,
    estimatedProcessing: "2024-01-23",
    notes: "Coffee beans were stale, approved for return",
    approvedBy: "Admin User",
    approvedDate: "2024-01-20",
  },
  {
    id: "RET-ORD-2024-005-002",
    orderId: "ORD-2024-005",
    customerId: "CUST-001",
    customerName: "John Doe",
    customerEmail: "john.doe@example.com",
    date: "2024-01-22",
    status: "processing",
    priority: "low",
    reason: "changed-mind",
    items: [{ name: "French Lavender Oil", quantity: 1, refundAmount: 45.0 }],
    totalRefund: 45.0,
    trackingNumber: "RET-1Z999AA1234567894",
    estimatedProcessing: "2024-01-26",
    notes: "Customer changed mind about scent preference",
    receivedDate: "2024-01-24",
  },
  {
    id: "RET-ORD-2024-002-001",
    orderId: "ORD-2024-002",
    customerId: "CUST-003",
    customerName: "Bob Johnson",
    customerEmail: "bob.johnson@example.com",
    date: "2024-01-18",
    status: "completed",
    priority: "medium",
    reason: "defective",
    items: [{ name: "Organic Green Tea", quantity: 1, refundAmount: 18.75 }],
    totalRefund: 18.75,
    completedDate: "2024-01-20",
    refundMethod: "Original Payment Method",
    processedBy: "Admin User",
    notes: "Defective packaging, refund processed successfully",
  },
  {
    id: "RET-ORD-2024-003-001",
    orderId: "ORD-2024-003",
    customerId: "CUST-004",
    customerName: "Alice Brown",
    customerEmail: "alice.brown@example.com",
    date: "2024-01-20",
    status: "rejected",
    priority: "low",
    reason: "changed-mind",
    items: [{ name: "Wild Honey", quantity: 1, refundAmount: 28.99 }],
    totalRefund: 28.99,
    rejectedDate: "2024-01-21",
    rejectedBy: "Admin User",
    rejectionReason: "Return window expired (45 days past delivery)",
    notes: "Customer attempted return outside of 30-day window",
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

const priorityColors = {
  low: "bg-gray-500",
  medium: "bg-orange-500",
  high: "bg-red-500",
}

const reasonLabels = {
  defective: "Defective/Damaged",
  "wrong-item": "Wrong Item",
  "not-as-described": "Not as Described",
  "quality-issues": "Quality Issues",
  "changed-mind": "Changed Mind",
  other: "Other",
}

export default function AdminReturnsPage() {
  const [searchTerm, setSearchTerm] = useState("")
  const [statusFilter, setStatusFilter] = useState("all")
  const [priorityFilter, setPriorityFilter] = useState("all")
  const [selectedTab, setSelectedTab] = useState("all")
  const [selectedReturns, setSelectedReturns] = useState<string[]>([])

  const filteredReturns = adminReturnRequests.filter((returnReq) => {
    const matchesSearch =
      returnReq.id.toLowerCase().includes(searchTerm.toLowerCase()) ||
      returnReq.orderId.toLowerCase().includes(searchTerm.toLowerCase()) ||
      returnReq.customerName.toLowerCase().includes(searchTerm.toLowerCase()) ||
      returnReq.customerEmail.toLowerCase().includes(searchTerm.toLowerCase()) ||
      returnReq.items.some((item) => item.name.toLowerCase().includes(searchTerm.toLowerCase()))

    const matchesStatus = selectedTab === "all" || returnReq.status === selectedTab
    const matchesPriority = priorityFilter === "all" || returnReq.priority === priorityFilter

    return matchesSearch && matchesStatus && matchesPriority
  })

  const handleSelectReturn = (returnId: string, checked: boolean) => {
    if (checked) {
      setSelectedReturns([...selectedReturns, returnId])
    } else {
      setSelectedReturns(selectedReturns.filter((id) => id !== returnId))
    }
  }

  const handleSelectAll = (checked: boolean) => {
    if (checked) {
      setSelectedReturns(filteredReturns.map((r) => r.id))
    } else {
      setSelectedReturns([])
    }
  }

  const handleBulkAction = (action: string) => {
    console.log(`Bulk action: ${action} for returns:`, selectedReturns)
    // In a real app, this would make API calls to update the selected returns
    setSelectedReturns([])
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/manager" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Manager Dashboard
            </Link>
            <h1 className="text-2xl font-bold">Return Management</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center justify-between mb-8">
            <div>
              <h2 className="text-3xl font-bold">Return Requests</h2>
              <p className="text-muted-foreground">Manage and process customer return requests</p>
            </div>
            <div className="flex gap-2">
              <Button variant="outline">
                <Download className="h-4 w-4 mr-2" />
                Export
              </Button>
              <Button>
                <Mail className="h-4 w-4 mr-2" />
                Send Notifications
              </Button>
            </div>
          </div>

          {/* Search and Filters */}
          <Card className="mb-6">
            <CardContent className="p-4">
              <div className="flex flex-col lg:flex-row gap-4">
                <div className="flex-1">
                  <div className="relative">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-4 w-4" />
                    <Input
                      placeholder="Search by return ID, order ID, customer name, or product..."
                      value={searchTerm}
                      onChange={(e) => setSearchTerm(e.target.value)}
                      className="pl-10"
                    />
                  </div>
                </div>
                <div className="flex gap-2">
                  <Select value={priorityFilter} onValueChange={setPriorityFilter}>
                    <SelectTrigger className="w-40">
                      <AlertTriangle className="h-4 w-4 mr-2" />
                      <SelectValue placeholder="Priority" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="all">All Priority</SelectItem>
                      <SelectItem value="high">High</SelectItem>
                      <SelectItem value="medium">Medium</SelectItem>
                      <SelectItem value="low">Low</SelectItem>
                    </SelectContent>
                  </Select>
                  <Select value={statusFilter} onValueChange={setStatusFilter}>
                    <SelectTrigger className="w-40">
                      <Filter className="h-4 w-4 mr-2" />
                      <SelectValue placeholder="Status" />
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

          {/* Bulk Actions */}
          {selectedReturns.length > 0 && (
            <Card className="mb-6">
              <CardContent className="p-4">
                <div className="flex items-center justify-between">
                  <span className="text-sm font-medium">{selectedReturns.length} returns selected</span>
                  <div className="flex gap-2">
                    <Button size="sm" onClick={() => handleBulkAction("approve")}>
                      Approve Selected
                    </Button>
                    <Button size="sm" variant="outline" onClick={() => handleBulkAction("reject")}>
                      Reject Selected
                    </Button>
                    <Button size="sm" variant="outline" onClick={() => handleBulkAction("email")}>
                      Send Email
                    </Button>
                  </div>
                </div>
              </CardContent>
            </Card>
          )}

          {/* Return Status Tabs */}
          <Tabs value={selectedTab} onValueChange={setSelectedTab} className="mb-6">
            <TabsList className="grid w-full grid-cols-6">
              <TabsTrigger value="all">All ({adminReturnRequests.length})</TabsTrigger>
              <TabsTrigger value="pending">
                Pending ({adminReturnRequests.filter((r) => r.status === "pending").length})
              </TabsTrigger>
              <TabsTrigger value="approved">
                Approved ({adminReturnRequests.filter((r) => r.status === "approved").length})
              </TabsTrigger>
              <TabsTrigger value="processing">
                Processing ({adminReturnRequests.filter((r) => r.status === "processing").length})
              </TabsTrigger>
              <TabsTrigger value="completed">
                Completed ({adminReturnRequests.filter((r) => r.status === "completed").length})
              </TabsTrigger>
              <TabsTrigger value="rejected">
                Rejected ({adminReturnRequests.filter((r) => r.status === "rejected").length})
              </TabsTrigger>
            </TabsList>

            <TabsContent value={selectedTab} className="mt-6">
              {filteredReturns.length === 0 ? (
                <div className="text-center py-12">
                  <Package className="h-24 w-24 mx-auto text-muted-foreground mb-6" />
                  <h3 className="text-xl font-semibold mb-2">No return requests found</h3>
                  <p className="text-muted-foreground mb-6">
                    {selectedTab === "all"
                      ? "No return requests have been submitted yet."
                      : `No ${selectedTab} return requests found.`}
                  </p>
                </div>
              ) : (
                <div className="space-y-4">
                  {/* Select All Checkbox */}
                  <div className="flex items-center gap-2 p-4 bg-gray-50 rounded-lg">
                    <Checkbox
                      checked={selectedReturns.length === filteredReturns.length && filteredReturns.length > 0}
                      onCheckedChange={handleSelectAll}
                    />
                    <span className="text-sm font-medium">Select All ({filteredReturns.length} returns)</span>
                  </div>

                  {filteredReturns.map((returnReq) => {
                    const StatusIcon = statusIcons[returnReq.status as keyof typeof statusIcons]
                    const isSelected = selectedReturns.includes(returnReq.id)

                    return (
                      <Card
                        key={returnReq.id}
                        className={`hover:shadow-md transition-shadow ${isSelected ? "ring-2 ring-blue-500" : ""}`}
                      >
                        <CardHeader>
                          <div className="flex items-center justify-between">
                            <div className="flex items-center gap-3">
                              <Checkbox
                                checked={isSelected}
                                onCheckedChange={(checked) => handleSelectReturn(returnReq.id, checked as boolean)}
                              />
                              <div>
                                <CardTitle className="text-lg">{returnReq.id}</CardTitle>
                                <p className="text-sm text-muted-foreground">
                                  Order: {returnReq.orderId} • Customer: {returnReq.customerName} • Submitted on{" "}
                                  {new Date(returnReq.date).toLocaleDateString()}
                                </p>
                              </div>
                            </div>
                            <div className="text-right flex items-center gap-2">
                              <Badge className={`${priorityColors[returnReq.priority as keyof typeof priorityColors]}`}>
                                {returnReq.priority.toUpperCase()}
                              </Badge>
                              <Badge className={`${statusColors[returnReq.status as keyof typeof statusColors]}`}>
                                <StatusIcon className="h-4 w-4 mr-1" />
                                {returnReq.status.charAt(0).toUpperCase() + returnReq.status.slice(1)}
                              </Badge>
                              <p className="text-lg font-semibold">${returnReq.totalRefund.toFixed(2)}</p>
                            </div>
                          </div>
                        </CardHeader>
                        <CardContent>
                          <div className="space-y-4">
                            {/* Customer Information */}
                            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                              <div>
                                <h4 className="font-medium mb-1">Customer</h4>
                                <p className="text-sm">{returnReq.customerName}</p>
                                <p className="text-sm text-muted-foreground">{returnReq.customerEmail}</p>
                              </div>
                              <div>
                                <h4 className="font-medium mb-1">Return Reason</h4>
                                <p className="text-sm">{reasonLabels[returnReq.reason as keyof typeof reasonLabels]}</p>
                              </div>
                              <div>
                                <h4 className="font-medium mb-1">Items</h4>
                                <p className="text-sm">{returnReq.items.length} item(s)</p>
                              </div>
                            </div>

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

                            {/* Notes */}
                            {returnReq.notes && (
                              <div>
                                <h4 className="font-medium mb-1">Notes</h4>
                                <p className="text-sm text-muted-foreground">{returnReq.notes}</p>
                              </div>
                            )}

                            {/* Status-specific Information */}
                            {returnReq.status === "approved" && returnReq.approvedBy && (
                              <div className="bg-blue-50 border border-blue-200 rounded-lg p-3">
                                <p className="text-sm text-blue-800">
                                  <CheckCircle className="h-4 w-4 inline mr-1" />
                                  Approved by {returnReq.approvedBy} on{" "}
                                  {new Date(returnReq.approvedDate!).toLocaleDateString()}
                                </p>
                              </div>
                            )}

                            {returnReq.status === "processing" && returnReq.receivedDate && (
                              <div className="bg-orange-50 border border-orange-200 rounded-lg p-3">
                                <p className="text-sm text-orange-800">
                                  <Package className="h-4 w-4 inline mr-1" />
                                  Items received on {new Date(returnReq.receivedDate).toLocaleDateString()} - Processing
                                  refund
                                </p>
                              </div>
                            )}

                            {returnReq.status === "completed" && (
                              <div className="bg-green-50 border border-green-200 rounded-lg p-3">
                                <p className="text-sm text-green-800">
                                  <CheckCircle className="h-4 w-4 inline mr-1" />
                                  Completed by {returnReq.processedBy} on{" "}
                                  {new Date(returnReq.completedDate!).toLocaleDateString()}
                                  <br />
                                  Refund processed to: {returnReq.refundMethod}
                                </p>
                              </div>
                            )}

                            {returnReq.status === "rejected" && (
                              <div className="bg-red-50 border border-red-200 rounded-lg p-3">
                                <p className="text-sm text-red-800">
                                  <XCircle className="h-4 w-4 inline mr-1" />
                                  Rejected by {returnReq.rejectedBy} on{" "}
                                  {new Date(returnReq.rejectedDate!).toLocaleDateString()}
                                  <br />
                                  Reason: {returnReq.rejectionReason}
                                </p>
                              </div>
                            )}

                            {/* Action Buttons */}
                            <div className="flex gap-2 pt-2">
                              <Link href={`/manager/returns/${returnReq.id}`}>
                                <Button variant="outline" size="sm">
                                  <Eye className="h-4 w-4 mr-2" />
                                  View Details
                                </Button>
                              </Link>

                              {returnReq.status === "pending" && (
                                <>
                                  <Button size="sm">
                                    <CheckCircle className="h-4 w-4 mr-2" />
                                    Approve
                                  </Button>
                                  <Button
                                    variant="outline"
                                    size="sm"
                                    className="text-red-600 hover:text-red-700 bg-transparent"
                                  >
                                    <XCircle className="h-4 w-4 mr-2" />
                                    Reject
                                  </Button>
                                </>
                              )}

                              {returnReq.status === "processing" && (
                                <Button size="sm">
                                  <CheckCircle className="h-4 w-4 mr-2" />
                                  Complete Return
                                </Button>
                              )}

                              <Button variant="outline" size="sm">
                                <Mail className="h-4 w-4 mr-2" />
                                Email Customer
                              </Button>

                              <DropdownMenu>
                                <DropdownMenuTrigger asChild>
                                  <Button variant="outline" size="sm">
                                    <MoreHorizontal className="h-4 w-4" />
                                  </Button>
                                </DropdownMenuTrigger>
                                <DropdownMenuContent align="end">
                                  <DropdownMenuItem>
                                    <Package className="h-4 w-4 mr-2" />
                                    View Order
                                  </DropdownMenuItem>
                                  <DropdownMenuItem>
                                    <Eye className="h-4 w-4 mr-2" />
                                    View Customer
                                  </DropdownMenuItem>
                                  {returnReq.images && (
                                    <DropdownMenuItem>
                                      <Eye className="h-4 w-4 mr-2" />
                                      View Images
                                    </DropdownMenuItem>
                                  )}
                                  <DropdownMenuSeparator />
                                  <DropdownMenuItem>
                                    <Download className="h-4 w-4 mr-2" />
                                    Export Details
                                  </DropdownMenuItem>
                                </DropdownMenuContent>
                              </DropdownMenu>
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
