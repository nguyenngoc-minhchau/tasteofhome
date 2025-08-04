'use client'

import { useParams } from 'next/navigation'
import Link from 'next/link'
import { Card, CardHeader, CardTitle, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { ArrowLeft, CheckCircle, AlertTriangle, Package, XCircle } from 'lucide-react'

// Mock data, bạn có thể thay bằng API thực tế
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
    address: '123 Đường ABC, Quận 1, TP.HCM'
  },
  // Thêm các đơn hàng khác nếu muốn
]

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

export default function ManagerOrderDetailPage() {
  const params = useParams()
  const orderId = params.id as string
  const order = orders.find(o => o.id === orderId)

  if (!order) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Order Not Found</h1>
          <Link href="/manager/orders" className="text-blue-600 underline">Back to Orders</Link>
        </div>
      </div>
    )
  }

  const StatusIcon = statusIcons[order.status as keyof typeof statusIcons]

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <Link href="/manager/orders" className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-6">
          <ArrowLeft className="h-5 w-5" />
          Back to Order Management
        </Link>
        <Card className="max-w-2xl mx-auto">
          <CardHeader>
            <CardTitle className="text-2xl">Order Detail: {order.id}</CardTitle>
            <div className="flex gap-2 mt-2">
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
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-muted-foreground">
              <div>
                <span className="font-medium">Customer:</span>
                <span className="ml-1">{order.customer.name} ({order.customer.email})</span>
              </div>
              <div>
                <span className="font-medium">Date:</span>
                <span className="ml-1">{order.date}</span>
              </div>
              <div>
                <span className="font-medium">Address:</span>
                <span className="ml-1">{order.address}</span>
              </div>
              <div>
                <span className="font-medium">Total Amount:</span>
                <span className="ml-1 font-bold text-black">${order.amount.toFixed(2)}</span>
              </div>
            </div>
            <div>
              <span className="font-medium">Items:</span>
              <ul className="list-disc ml-6 mt-2">
                {order.items.map((item, idx) => (
                  <li key={idx} className="text-sm">
                    {item.quantity}x {item.name} - <span className="font-bold">${item.price}</span>
                  </li>
                ))}
              </ul>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}