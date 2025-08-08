'use client'

import { useEffect, useState } from 'react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'
import { toast } from '@/components/ui/use-toast'

export default function AdminReturnsPage() {
  const [returns, setReturns] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [updatingId, setUpdatingId] = useState<number | null>(null)

  useEffect(() => {
    fetchReturns()
  }, [])

async function fetchReturns() {
  setLoading(true)
  try {
    const res = await fetch('/api/returns')
    const rawData = await res.json()

    const transformed = (rawData || []).map((r: any) => {
      const statusMap: any = {
        0: 'pending',
        1: 'approved',
        2: 'processing',
        3: 'completed',
        4: 'rejected',
      }

      const items = (r.items || []).map((item: any) => ({
        quantity: item.amount,
        name: `Product #${item.product_id}`,
        refundAmount: 10.0, // placeholder — replace with real value if needed
      }))

      return {
        orderId: r.items?.[0]?.order_id ?? 0,
        orderCode: r.order_code ?? `Unknown`,
        status: statusMap[r.items?.[0]?.ischeck ?? 0],
        items,
        totalRefund: items.reduce((sum, item) => sum + item.refundAmount * item.quantity, 0),
        date: r.items?.[0]?.created_at ?? new Date().toISOString(),
      }
    })

    setReturns(transformed)
  } catch (err) {
    console.error('Failed to fetch returns', err)
    setReturns([])
  }
  setLoading(false)
}

  async function updateStatus(orderId: number, newStatus: number) {
    setUpdatingId(orderId)
    try {
      const res = await fetch(`/api/returns/status`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ orderId, ischeck: newStatus }),
      })

      if (res.ok) {
        toast({ title: 'Status updated' })
        await fetchReturns()
      } else {
        toast({ title: 'Failed to update status', variant: 'destructive' })
      }
    } catch (err) {
      toast({ title: 'Server error', variant: 'destructive' })
    }
    setUpdatingId(null)
  }

  function renderStatus(status: string) {
    const map = {
      pending: 'gray',
      approved: 'blue',
      processing: 'orange',
      completed: 'green',
      rejected: 'red',
    } as const

    return (
      <Badge variant="outline" className={`border-${map[status]}-500 text-${map[status]}-600`}>
        {status}
      </Badge>
    )
  }

  if (loading) {
    return <div className="p-8 text-center text-muted-foreground">Loading return requests...</div>
  }

  return (
    <div className="p-6 space-y-6">
      <h1 className="text-2xl font-bold">Return Requests</h1>

      {returns.length === 0 && (
        <p className="text-muted-foreground">No return requests found.</p>
      )}

      {returns.map((r) => (
        <Card key={r.orderId}>
          <CardHeader>
            <CardTitle className="flex items-center justify-between">
              <span className="text-lg font-semibold">
                Order: {r.orderCode} — {renderStatus(r.status)}
              </span>
              <div className="flex gap-2">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => updateStatus(r.orderId, 1)}
                  disabled={updatingId === r.orderId}
                >
                  Approve
                </Button>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => updateStatus(r.orderId, 4)}
                  disabled={updatingId === r.orderId}
                >
                  Reject
                </Button>
                <Button
                  variant="default"
                  size="sm"
                  onClick={() => updateStatus(r.orderId, 3)}
                  disabled={updatingId === r.orderId}
                >
                  Mark Complete
                </Button>
              </div>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-2">
              {r.items.map((item: any, i: number) => (
                <div key={i} className="flex justify-between text-sm">
                  <span>{item.quantity}× {item.name}</span>
                  <span>${item.refundAmount.toFixed(2)}</span>
                </div>
              ))}
            </div>

            <Separator className="my-4" />

            <div className="flex justify-between font-semibold text-green-600">
              <span>Total Refund:</span>
              <span>${r.totalRefund.toFixed(2)}</span>
            </div>

            <div className="text-sm text-muted-foreground mt-2">
              Submitted: {new Date(r.date).toLocaleString()}
            </div>
          </CardContent>
        </Card>
      ))}
    </div>
  )
}
