'use client'

import Link from 'next/link'
import { useState } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Input } from '@/components/ui/input'
import { Button } from "@/components/ui/button"
import { Search, Package, CheckCircle, AlertTriangle, XCircle, ArrowLeft, Eye } from 'lucide-react'

const orders = [
  {
    id: 'ORD-2024-001',
    customer: { name: 'John Doe', email: 'john@example.com' },
    date: '15/1/2024',
    items: [
      { name: 'Áo thun', quantity: 1, price: 20 },
      { name: 'Quần jeans', quantity: 1, price: 47.48 }
    ],
    status: 'Delivered',
    refundEligible: true,
    amount: 67.48,
  },
  // Thêm các đơn hàng khác nếu muốn
]

const statuses = ['All', 'Processing', 'Shipped', 'Delivered', 'Refunded']

const statusColors = {
  Delivered: 'bg-green-100 text-green-700',
  Processing: 'bg-yellow-100 text-yellow-700',
  Shipped: 'bg-blue-100 text-blue-700',
  Refunded: 'bg-red-100 text-red-700',
}

const statusIcons = {
  Delivered: CheckCircle,
  Processing: AlertTriangle,
  Shipped: Package,
  Refunded: XCircle,
}

// ... (các import và code khác giữ nguyên)

export default function OrdersPage() {
  const [filter, setFilter] = useState('All')
  const [search, setSearch] = useState('')

  const filteredOrders = orders.filter((order) => {
    const matchStatus = filter === 'All' || order.status === filter
    const matchSearch =
      order.id.toLowerCase().includes(search.toLowerCase()) ||
      order.customer.name.toLowerCase().includes(search.toLowerCase()) ||
      order.customer.email.toLowerCase().includes(search.toLowerCase())
    return matchStatus && matchSearch
  })

  // Stats
  const orderStats = {
    totalOrders: orders.length,
    totalRevenue: orders.reduce((sum, o) => sum + o.amount, 0),
    pendingOrders: orders.filter(o => o.status === 'Processing').length,
    refundEligible: orders.filter(o => o.refundEligible).length,
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b mb-8">
        <div className="container mx-auto px-4 py-4 flex items-center justify-between">
          <div>
            <Link href="/manager" className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-2">
              <ArrowLeft className="h-5 w-5" />
              Back to Manager Dashboard
            </Link>
            <h1 className="text-2xl font-bold">Order Management</h1>
            <p className="text-muted-foreground">View and manage all customer orders</p>
          </div>
          <button className="border px-3 py-1 rounded flex items-center gap-1 hover:bg-gray-100">
            Export
          </button>
        </div>
      </header>

      <div className="container mx-auto px-4">
        {/* Stats Dashboard */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Orders</CardTitle>
              <Package className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{orderStats.totalOrders}</div>
              <p className="text-xs text-muted-foreground">All orders</p>
            </CardContent>
          </Card>
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Revenue</CardTitle>
              <CheckCircle className="h-4 w-4 text-green-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-green-600">${orderStats.totalRevenue.toFixed(2)}</div>
              <p className="text-xs text-muted-foreground">Completed payments</p>
            </CardContent>
          </Card>
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Pending Orders</CardTitle>
              <AlertTriangle className="h-4 w-4 text-yellow-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-yellow-600">{orderStats.pendingOrders}</div>
              <p className="text-xs text-muted-foreground">Awaiting processing</p>
            </CardContent>
          </Card>
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Refund Eligible</CardTitle>
              <XCircle className="h-4 w-4 text-red-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-red-600">{orderStats.refundEligible}</div>
              <p className="text-xs text-muted-foreground">Can be refunded</p>
            </CardContent>
          </Card>
        </div>

        {/* Search & Status Filter */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle>Orders List</CardTitle>
            <p className="text-sm text-muted-foreground">Search and filter orders</p>
          </CardHeader>
          <CardContent>
            <div className="flex gap-4 mb-6">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-4 w-4" />
                <Input
                  placeholder="Search orders, customers, or emails..."
                  value={search}
                  onChange={e => setSearch(e.target.value)}
                  className="pl-10"
                />
              </div>
              <div className="flex gap-1">
                {statuses.map(status => (
                  <button
                    key={status}
                    onClick={() => setFilter(status)}
                    className={`px-4 py-2 rounded-full text-sm font-medium transition-colors duration-200
                                ${filter === status
                                  ? 'bg-primary text-primary-foreground shadow-sm'
                                  : 'bg-muted text-muted-foreground hover:bg-muted/80'
                                }`}
                  >
                    {status}
                  </button>
                ))}
              </div>
            </div>

            {/* Orders List */}
            <div className="space-y-4">
              {filteredOrders.length === 0 ? (
                <div className="text-center py-8">
                  <Package className="h-12 w-12 text-muted-foreground mx-auto mb-4" />
                  <p className="text-muted-foreground">No orders found matching your criteria</p>
                </div>
              ) : (
                filteredOrders.map(order => {
                  const StatusIcon = statusIcons[order.status as keyof typeof statusIcons]
                  return (
                    <Card key={order.id} className="hover:shadow-md transition-shadow">
                      <CardContent className="p-6 flex items-center justify-between">
                        <div className="space-y-2 flex-1">
                          <div className="flex items-center gap-4 mb-2">
                            <span className="font-bold text-lg">{order.id}</span>
                            <Badge className={statusColors[order.status as keyof typeof statusColors]}>
                              <StatusIcon className="h-3 w-3 mr-1" />
                              {order.status}
                            </Badge>
                            {order.refundEligible && (
                              <Badge variant="outline" className="text-green-600 border-green-600">
                                Refund Eligible
                              </Badge>
                            )}
                          </div>
                          <div className="grid grid-cols-2 md:grid-cols-3 gap-4 text-sm text-muted-foreground">
                            <div>
                              <span className="font-medium">Customer:</span>
                              <span className="ml-1">{order.customer.name} ({order.customer.email})</span>
                            </div>
                            <div>
                              <span className="font-medium">Date:</span>
                              <span className="ml-1">{order.date}</span>
                            </div>
                            <div>
                              <span className="font-medium">Items:</span>
                              <span className="ml-1">{order.items.length} item(s)</span>
                            </div>
                          </div>
                          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-muted-foreground">
                            <div>
                              <span className="font-medium">Total Amount:</span>
                              <span className="ml-1 font-bold text-black">${order.amount.toFixed(2)}</span>
                            </div>
                          </div>
                        </div>
                        <div className="flex flex-col gap-2 ml-6">
                          <Link href={`/manager/orders/${order.id}`}>
                          <Button variant="outline" size="sm">
                                <Eye className="h-4 w-4 mr-1" />
                                View
                          </Button>
                          </Link>
                          {order.refundEligible && (
                            <Link
                              href={`/manager/orders/${order.id}/refund`}
                              className="border px-3 py-1 rounded flex items-center gap-1 hover:bg-gray-100 text-red-600 min-w-[120px] text-center"
                            >
                              Process Refund
                            </Link>
                          )}
                        </div>
                      </CardContent>
                    </Card>
                  )
                })
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
