"use client"

import { useState } from "react"
import Link from "next/link"
import { ArrowLeft, Clock, Package, Truck, CheckCircle, AlertCircle, Bell, Send } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Badge } from "@/components/ui/badge"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Textarea } from "@/components/ui/textarea"
import { Checkbox } from "@/components/ui/checkbox"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

// Mock order data with status tracking
const orderStatusData = [
  {
    id: "ORD-2024-001",
    customer: "John Doe",
    email: "john@example.com",
    status: "processing",
    paymentStatus: "paid",
    total: 67.48,
    date: "2024-01-15",
    trackingNumber: "",
    estimatedDelivery: "2024-01-20",
    timeline: [
      {
        status: "Order Placed",
        date: "2024-01-15 10:30 AM",
        completed: true,
        automated: true,
      },
      {
        status: "Payment Confirmed",
        date: "2024-01-15 10:35 AM",
        completed: true,
        automated: true,
      },
      {
        status: "Processing",
        date: "",
        completed: false,
        automated: false,
      },
      {
        status: "Shipped",
        date: "",
        completed: false,
        automated: false,
      },
      {
        status: "Delivered",
        date: "",
        completed: false,
        automated: false,
      },
    ],
    notifications: {
      customer: true,
      staff: false,
      manager: true,
    },
  },
  {
    id: "ORD-2024-002",
    customer: "Jane Smith",
    email: "jane@example.com",
    status: "shipped",
    paymentStatus: "paid",
    total: 45.75,
    date: "2024-01-20",
    trackingNumber: "1Z999AA1234567891",
    estimatedDelivery: "2024-01-25",
    timeline: [
      {
        status: "Order Placed",
        date: "2024-01-20 2:15 PM",
        completed: true,
        automated: true,
      },
      {
        status: "Payment Confirmed",
        date: "2024-01-20 2:20 PM",
        completed: true,
        automated: true,
      },
      {
        status: "Processing",
        date: "2024-01-21 9:00 AM",
        completed: true,
        automated: false,
      },
      {
        status: "Shipped",
        date: "2024-01-21 11:30 AM",
        completed: true,
        automated: false,
      },
      {
        status: "Delivered",
        date: "",
        completed: false,
        automated: false,
      },
    ],
    notifications: {
      customer: true,
      staff: true,
      manager: true,
    },
  },
  {
    id: "ORD-2024-003",
    customer: "Bob Johnson",
    email: "bob@example.com",
    status: "pending_payment",
    paymentStatus: "pending",
    total: 32.0,
    date: "2024-01-22",
    trackingNumber: "",
    estimatedDelivery: "2024-01-27",
    timeline: [
      {
        status: "Order Placed",
        date: "2024-01-22 4:45 PM",
        completed: true,
        automated: true,
      },
      {
        status: "Payment Pending",
        date: "",
        completed: false,
        automated: true,
      },
      {
        status: "Processing",
        date: "",
        completed: false,
        automated: false,
      },
      {
        status: "Shipped",
        date: "",
        completed: false,
        automated: false,
      },
      {
        status: "Delivered",
        date: "",
        completed: false,
        automated: false,
      },
    ],
    notifications: {
      customer: true,
      staff: false,
      manager: false,
    },
  },
]

const statusConfig = {
  pending_payment: { icon: AlertCircle, color: "bg-yellow-500", label: "Pending Payment" },
  processing: { icon: Clock, color: "bg-blue-500", label: "Processing" },
  shipped: { icon: Truck, color: "bg-orange-500", label: "Shipped" },
  delivered: { icon: CheckCircle, color: "bg-green-500", label: "Delivered" },
  cancelled: { icon: AlertCircle, color: "bg-red-500", label: "Cancelled" },
}

export default function OrderStatusUpdates() {
  const [orders, setOrders] = useState(orderStatusData)
  const [selectedOrder, setSelectedOrder] = useState<any>(null)
  const [bulkAction, setBulkAction] = useState("")
  const [selectedOrders, setSelectedOrders] = useState<string[]>([])
  const [statusUpdate, setStatusUpdate] = useState({
    status: "",
    trackingNumber: "",
    notes: "",
    notifyCustomer: true,
    notifyStaff: false,
  })

  const handleStatusUpdate = async (orderId: string) => {
    if (!statusUpdate.status) return

    const updatedOrders = orders.map((order) => {
      if (order.id === orderId) {
        const newTimeline = [...order.timeline]
        const statusIndex = newTimeline.findIndex((item) => item.status.toLowerCase() === statusUpdate.status)

        if (statusIndex >= 0) {
          newTimeline[statusIndex] = {
            ...newTimeline[statusIndex],
            completed: true,
            date: new Date().toLocaleString(),
          }
        }

        return {
          ...order,
          status: statusUpdate.status,
          trackingNumber: statusUpdate.trackingNumber || order.trackingNumber,
          timeline: newTimeline,
        }
      }
      return order
    })

    setOrders(updatedOrders)

    // Simulate sending notifications
    if (statusUpdate.notifyCustomer) {
      console.log(`Email notification sent to customer for order ${orderId}`)
    }
    if (statusUpdate.notifyStaff) {
      console.log(`Staff notification sent for order ${orderId}`)
    }

    setSelectedOrder(null)
    setStatusUpdate({
      status: "",
      trackingNumber: "",
      notes: "",
      notifyCustomer: true,
      notifyStaff: false,
    })
  }

  const handleBulkStatusUpdate = async () => {
    if (!bulkAction || selectedOrders.length === 0) return

    const updatedOrders = orders.map((order) => {
      if (selectedOrders.includes(order.id)) {
        return { ...order, status: bulkAction }
      }
      return order
    })

    setOrders(updatedOrders)
    setSelectedOrders([])
    setBulkAction("")
  }

  const toggleOrderSelection = (orderId: string) => {
    setSelectedOrders((prev) => (prev.includes(orderId) ? prev.filter((id) => id !== orderId) : [...prev, orderId]))
  }

  const statusCounts = {
    total: orders.length,
    processing: orders.filter((o) => o.status === "processing").length,
    shipped: orders.filter((o) => o.status === "shipped").length,
    delivered: orders.filter((o) => o.status === "delivered").length,
    pending: orders.filter((o) => o.status === "pending_payment").length,
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div>
              <Link href="/admin" className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-2">
                <ArrowLeft className="h-5 w-5" />
                Back to Admin
              </Link>
              <h1 className="text-2xl font-bold">Order Status Updates</h1>
              <p className="text-muted-foreground">Track and manage order status changes with notifications</p>
            </div>
            <div className="flex items-center gap-4">
              {selectedOrders.length > 0 && (
                <div className="flex items-center gap-2">
                  <Select value={bulkAction} onValueChange={setBulkAction}>
                    <SelectTrigger className="w-40">
                      <SelectValue placeholder="Bulk Action" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="processing">Mark Processing</SelectItem>
                      <SelectItem value="shipped">Mark Shipped</SelectItem>
                      <SelectItem value="delivered">Mark Delivered</SelectItem>
                      <SelectItem value="cancelled">Mark Cancelled</SelectItem>
                    </SelectContent>
                  </Select>
                  <Button onClick={handleBulkStatusUpdate} disabled={!bulkAction}>
                    Apply to {selectedOrders.length} order(s)
                  </Button>
                </div>
              )}
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* Status Overview */}
        <div className="grid grid-cols-1 md:grid-cols-5 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Orders</CardTitle>
              <Package className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{statusCounts.total}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Processing</CardTitle>
              <Clock className="h-4 w-4 text-blue-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-blue-600">{statusCounts.processing}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Shipped</CardTitle>
              <Truck className="h-4 w-4 text-orange-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-orange-600">{statusCounts.shipped}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Delivered</CardTitle>
              <CheckCircle className="h-4 w-4 text-green-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-green-600">{statusCounts.delivered}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Pending Payment</CardTitle>
              <AlertCircle className="h-4 w-4 text-yellow-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-yellow-600">{statusCounts.pending}</div>
            </CardContent>
          </Card>
        </div>

        <Tabs defaultValue="orders">
          <TabsList>
            <TabsTrigger value="orders">Order List</TabsTrigger>
            <TabsTrigger value="automation">Automation Rules</TabsTrigger>
          </TabsList>

          <TabsContent value="orders">
            <Card>
              <CardHeader>
                <CardTitle>Orders Requiring Status Updates</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {orders.map((order) => {
                    const StatusIcon = statusConfig[order.status as keyof typeof statusConfig]?.icon || Package
                    const statusColor = statusConfig[order.status as keyof typeof statusConfig]?.color || "bg-gray-500"
                    const statusLabel = statusConfig[order.status as keyof typeof statusConfig]?.label || order.status

                    return (
                      <Card key={order.id} className="hover:shadow-md transition-shadow">
                        <CardContent className="p-6">
                          <div className="flex items-center justify-between">
                            <div className="flex items-center gap-4">
                              <Checkbox
                                checked={selectedOrders.includes(order.id)}
                                onCheckedChange={() => toggleOrderSelection(order.id)}
                              />
                              <div className="space-y-2">
                                <div className="flex items-center gap-4">
                                  <h3 className="font-semibold">{order.id}</h3>
                                  <Badge className={statusColor}>
                                    <StatusIcon className="h-4 w-4 mr-1" />
                                    {statusLabel}
                                  </Badge>
                                  {order.trackingNumber && (
                                    <Badge variant="outline">Tracking: {order.trackingNumber}</Badge>
                                  )}
                                </div>
                                <div className="text-sm text-muted-foreground">
                                  <p>
                                    <strong>Customer:</strong> {order.customer} ({order.email})
                                  </p>
                                  <p>
                                    <strong>Total:</strong> ${order.total.toFixed(2)}
                                  </p>
                                  <p>
                                    <strong>Expected Delivery:</strong>{" "}
                                    {new Date(order.estimatedDelivery).toLocaleDateString()}
                                  </p>
                                </div>
                              </div>
                            </div>

                            <div className="flex items-center gap-2">
                              <Dialog>
                                <DialogTrigger asChild>
                                  <Button variant="outline" size="sm" onClick={() => setSelectedOrder(order)}>
                                    Update Status
                                  </Button>
                                </DialogTrigger>
                                <DialogContent className="max-w-md">
                                  <DialogHeader>
                                    <DialogTitle>Update Order Status</DialogTitle>
                                  </DialogHeader>
                                  <div className="space-y-4">
                                    <div>
                                      <Label>Order ID</Label>
                                      <Input value={order.id} disabled />
                                    </div>

                                    <div>
                                      <Label htmlFor="status">New Status</Label>
                                      <Select
                                        value={statusUpdate.status}
                                        onValueChange={(value) =>
                                          setStatusUpdate((prev) => ({ ...prev, status: value }))
                                        }
                                      >
                                        <SelectTrigger>
                                          <SelectValue placeholder="Select status" />
                                        </SelectTrigger>
                                        <SelectContent>
                                          <SelectItem value="processing">Processing</SelectItem>
                                          <SelectItem value="shipped">Shipped</SelectItem>
                                          <SelectItem value="delivered">Delivered</SelectItem>
                                          <SelectItem value="cancelled">Cancelled</SelectItem>
                                        </SelectContent>
                                      </Select>
                                    </div>

                                    {(statusUpdate.status === "shipped" || statusUpdate.status === "delivered") && (
                                      <div>
                                        <Label htmlFor="trackingNumber">Tracking Number</Label>
                                        <Input
                                          id="trackingNumber"
                                          value={statusUpdate.trackingNumber}
                                          onChange={(e) =>
                                            setStatusUpdate((prev) => ({ ...prev, trackingNumber: e.target.value }))
                                          }
                                          placeholder="Enter tracking number"
                                        />
                                      </div>
                                    )}

                                    <div>
                                      <Label htmlFor="notes">Notes (optional)</Label>
                                      <Textarea
                                        id="notes"
                                        value={statusUpdate.notes}
                                        onChange={(e) =>
                                          setStatusUpdate((prev) => ({ ...prev, notes: e.target.value }))
                                        }
                                        placeholder="Add any additional notes..."
                                      />
                                    </div>

                                    <div className="space-y-3">
                                      <div className="flex items-center space-x-2">
                                        <Checkbox
                                          id="notifyCustomer"
                                          checked={statusUpdate.notifyCustomer}
                                          onCheckedChange={(checked) =>
                                            setStatusUpdate((prev) => ({ ...prev, notifyCustomer: checked as boolean }))
                                          }
                                        />
                                        <Label htmlFor="notifyCustomer">Notify Customer</Label>
                                      </div>
                                      <div className="flex items-center space-x-2">
                                        <Checkbox
                                          id="notifyStaff"
                                          checked={statusUpdate.notifyStaff}
                                          onCheckedChange={(checked) =>
                                            setStatusUpdate((prev) => ({ ...prev, notifyStaff: checked as boolean }))
                                          }
                                        />
                                        <Label htmlFor="notifyStaff">Notify Staff</Label>
                                      </div>
                                    </div>

                                    <Button
                                      onClick={() => handleStatusUpdate(order.id)}
                                      disabled={!statusUpdate.status}
                                      className="w-full"
                                    >
                                      <Send className="h-4 w-4 mr-2" />
                                      Update Status
                                    </Button>
                                  </div>
                                </DialogContent>
                              </Dialog>

                              <Button variant="outline" size="sm">
                                <Bell className="h-4 w-4 mr-1" />
                                Notify
                              </Button>
                            </div>
                          </div>

                          {/* Order Timeline */}
                          <div className="mt-4 pt-4 border-t">
                            <h4 className="font-medium mb-3">Order Timeline</h4>
                            <div className="flex items-center gap-4 overflow-x-auto">
                              {order.timeline.map((step, index) => (
                                <div key={index} className="flex items-center gap-2 min-w-0">
                                  <div
                                    className={`w-6 h-6 rounded-full flex items-center justify-center text-xs ${
                                      step.completed ? "bg-green-500 text-white" : "bg-gray-200 text-gray-500"
                                    }`}
                                  >
                                    {step.completed ? "✓" : index + 1}
                                  </div>
                                  <div className="text-xs">
                                    <p className={`font-medium ${step.completed ? "text-green-700" : "text-gray-500"}`}>
                                      {step.status}
                                    </p>
                                    {step.date && <p className="text-gray-400">{step.date}</p>}
                                  </div>
                                  {index < order.timeline.length - 1 && (
                                    <div className="w-8 h-px bg-gray-300 mx-2"></div>
                                  )}
                                </div>
                              ))}
                            </div>
                          </div>
                        </CardContent>
                      </Card>
                    )
                  })}
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="automation">
            <Card>
              <CardHeader>
                <CardTitle>Automation Rules</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-6">
                  <div className="bg-blue-50 p-4 rounded-lg">
                    <h4 className="font-semibold mb-2">Active Automation Rules</h4>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span>Auto-confirm payment after successful transaction</span>
                        <Badge variant="default">Active</Badge>
                      </div>
                      <div className="flex justify-between">
                        <span>Send shipping notification when tracking number added</span>
                        <Badge variant="default">Active</Badge>
                      </div>
                      <div className="flex justify-between">
                        <span>Mark as delivered when tracking shows delivery</span>
                        <Badge variant="secondary">Disabled</Badge>
                      </div>
                    </div>
                  </div>

                  <div className="bg-yellow-50 p-4 rounded-lg">
                    <h4 className="font-semibold mb-2">Notification Settings</h4>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span>Customer email notifications</span>
                        <Badge variant="default">Enabled</Badge>
                      </div>
                      <div className="flex justify-between">
                        <span>Staff SMS notifications</span>
                        <Badge variant="secondary">Disabled</Badge>
                      </div>
                      <div className="flex justify-between">
                        <span>Manager dashboard alerts</span>
                        <Badge variant="default">Enabled</Badge>
                      </div>
                    </div>
                  </div>

                  <Button variant="outline">Configure Automation Rules</Button>
                </div>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </div>
    </div>
  )
}
