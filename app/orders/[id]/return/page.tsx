'use client'

import { useEffect, useState } from 'react'
import { useParams, useRouter } from 'next/navigation'
import Link from 'next/link'
import {
  ArrowLeft,
  CheckCircle
} from 'lucide-react'

import {
  Card,
  CardHeader,
  CardTitle,
  CardContent
} from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Separator } from '@/components/ui/separator'
import {
  Select,
  SelectTrigger,
  SelectValue,
  SelectContent,
  SelectItem
} from '@/components/ui/select'

type OrderItem = {
  id: number
  name: string
  quantity: number
  price: number
  image?: string
  returnEligible: boolean
  returnWindow: number
}

type Order = {
  id: number
  code: string
  deliveryDate: string
  items: OrderItem[]
}

export default function ReturnRequestPage() {
  const { id: orderCode } = useParams()
  const router = useRouter()

  const [order, setOrder] = useState<Order | null>(null)
  const [loading, setLoading] = useState(true)
  const [selectedItems, setSelectedItems] = useState<Record<number, { selected: boolean, quantity: number }>>({})
  const [returnReason, setReturnReason] = useState('')
  const [comments, setComments] = useState('')
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [returnSubmitted, setReturnSubmitted] = useState(false)

  useEffect(() => {
    const fetchOrder = async () => {
      try {
        const res = await fetch(`/api/orders/${orderCode}`)
        const json = await res.json()
        if (!res.ok) throw new Error(json.error || 'Failed to fetch order')
        
        // Map backend to frontend structure
        const order = json.order
        const items = json.items.map((item: any) => ({
          id: item.product_id,
          name: item.product_name || `Product #${item.product_id}`,
          quantity: item.quantity,
          price: item.price,
          image: '', // optional
          returnEligible: true, // stub
          returnWindow: 30,     // stub
        }))

        setOrder({
          id: order.id,
          code: order.inv_code,
          deliveryDate: order.deliverydate || new Date().toISOString(),
          items
        })
      } catch (err) {
        console.error(err)
      } finally {
        setLoading(false)
      }
    }

    fetchOrder()
  }, [orderCode])

  const handleItemSelection = (productId: number, selected: boolean) => {
    setSelectedItems(prev => ({
      ...prev,
      [productId]: {
        selected,
        quantity: selected ? 1 : 0
      }
    }))
  }

  const handleQuantityChange = (productId: number, quantity: number) => {
    setSelectedItems(prev => ({
      ...prev,
      [productId]: {
        ...prev[productId],
        quantity
      }
    }))
  }

  const handleSubmitReturn = async () => {
    setIsSubmitting(true)
    const selected = Object.entries(selectedItems).filter(([_, v]) => v.selected)
    const items = selected.map(([productId, data]) => ({
      productId: parseInt(productId),
      quantity: data.quantity
    }))

    try {
      const res = await fetch('/api/returns', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          orderId: order?.code,
          items,
          reason: returnReason,
          comments
        })
      })

      if (!res.ok) throw new Error('Return request failed')
      setReturnSubmitted(true)
    } catch (err) {
      console.error(err)
      alert('Failed to submit return request')
    } finally {
      setIsSubmitting(false)
    }
  }

  const selectedList = order?.items
    .filter(item => selectedItems[item.id]?.selected)
    .map(item => ({
      ...item,
      returnQuantity: selectedItems[item.id].quantity
    })) || []

  const totalRefundAmount = selectedList.reduce((sum, item) => sum + item.price * item.returnQuantity, 0)

  if (loading) return <p className="p-6 text-center">Loading...</p>

  if (!order) {
    return (
      <div className="flex justify-center items-center min-h-screen">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Order Not Found</h1>
          <Link href="/orders"><Button>Back to Orders</Button></Link>
        </div>
      </div>
    )
  }

  if (returnSubmitted) {
    return (
      <div className="container py-12 text-center">
        <Card className="max-w-lg mx-auto">
          <CardHeader>
            <CardTitle className="text-2xl">Return Submitted</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <p>Your return request for order <strong>{order.code}</strong> has been submitted.</p>
            <p>Items Returned: {selectedList.length}</p>
            <p>Total Refund: <strong>${totalRefundAmount.toFixed(2)}</strong></p>
            <Button onClick={() => router.push('/returns')}>Go to Returns</Button>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="container py-8 space-y-6">
      <header className="flex justify-between items-center">
        <Link href="/orders" className="flex items-center gap-2 text-sm font-medium">
          <ArrowLeft className="w-4 h-4" />
          Back
        </Link>
        <h1 className="text-xl font-bold">Return Request for Order {order.code}</h1>
        <div className="w-8" />
      </header>

      <Card>
        <CardHeader><CardTitle>Select Items</CardTitle></CardHeader>
        <CardContent className="space-y-4">
          {order.items.map(item => {
            const selected = selectedItems[item.id]?.selected
            const qty = selectedItems[item.id]?.quantity || 1

            return (
              <div key={item.id} className={`border rounded-lg p-4 ${selected ? 'bg-blue-50' : ''}`}>
                <div className="flex justify-between items-center">
                  <div>
                    <p className="font-medium">{item.name}</p>
                    <p className="text-sm text-muted-foreground">Qty: {item.quantity} × ${item.price}</p>
                  </div>
                  <div className="flex gap-4 items-center">
                    <Checkbox
                      checked={!!selected}
                      onCheckedChange={(v) => handleItemSelection(item.id, v as boolean)}
                    />
                    {selected && (
                      <Select value={qty.toString()} onValueChange={(v) => handleQuantityChange(item.id, parseInt(v))}>
                        <SelectTrigger className="w-16"><SelectValue /></SelectTrigger>
                        <SelectContent>
                          {Array.from({ length: item.quantity }, (_, i) => (
                            <SelectItem key={i + 1} value={(i + 1).toString()}>{i + 1}</SelectItem>
                          ))}
                        </SelectContent>
                      </Select>
                    )}
                  </div>
                </div>
              </div>
            )
          })}
        </CardContent>
      </Card>

      {selectedList.length > 0 && (
        <>
          <Card>
            <CardHeader><CardTitle>Reason</CardTitle></CardHeader>
            <CardContent className="space-y-4">
              <Select value={returnReason} onValueChange={setReturnReason}>
                <SelectTrigger><SelectValue placeholder="Select reason" /></SelectTrigger>
                <SelectContent>
                  <SelectItem value="defective">Defective</SelectItem>
                  <SelectItem value="wrong">Wrong Item</SelectItem>
                  <SelectItem value="not-as-described">Not as Described</SelectItem>
                  <SelectItem value="other">Other</SelectItem>
                </SelectContent>
              </Select>
              <Textarea placeholder="Comments (optional)" value={comments} onChange={(e) => setComments(e.target.value)} />
            </CardContent>
          </Card>

          <Card>
            <CardHeader><CardTitle>Summary</CardTitle></CardHeader>
            <CardContent className="space-y-4">
              {selectedList.map(item => (
                <div key={item.id} className="flex justify-between">
                  <span>{item.returnQuantity}× {item.name}</span>
                  <span>${(item.price * item.returnQuantity).toFixed(2)}</span>
                </div>
              ))}
              <Separator />
              <div className="flex justify-between font-semibold text-lg">
                <span>Total:</span>
                <span className="text-green-600">${totalRefundAmount.toFixed(2)}</span>
              </div>
              <Button className="w-full" disabled={!returnReason || isSubmitting} onClick={handleSubmitReturn}>
                {isSubmitting ? 'Submitting...' : 'Submit Return Request'}
              </Button>
            </CardContent>
          </Card>
        </>
      )}
    </div>
  )
}
