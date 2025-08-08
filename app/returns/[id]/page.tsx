"use client"

import { useEffect, useState } from "react"
import { useParams } from "next/navigation"
import Link from "next/link"
import {
  ArrowLeft,
  Package,
  CheckCircle,
  Clock,
  Download,
  Truck,
  AlertCircle,
  MapPin,
} from "lucide-react"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Separator } from "@/components/ui/separator"
import { Progress } from "@/components/ui/progress"

type ReturnRecord = {
  id: number
  order_id: number | null
  product_id: number
  amount: number
  notes?: string | null
  ischeck: number
  created_at: string
  updated_at: string
}

const statusMap = {
  0: "pending",
  1: "approved",
  2: "rejected",
  3: "processing",
  4: "completed",
} as const

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

export default function ReturnDetailPage() {
  const params = useParams()
  const id = params.id
  const [data, setData] = useState<ReturnRecord | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)

  useEffect(() => {
    async function fetchData() {
      try {
        const res = await fetch(`/api/admin/returns/${id}`)
        if (!res.ok) {
          setError(true)
          return
        }
        const json = await res.json()
        setData(json.data)
      } catch (err) {
        console.error("Error fetching return:", err)
        setError(true)
      } finally {
        setLoading(false)
      }
    }

    fetchData()
  }, [id])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p className="text-muted-foreground">Loading return details...</p>
      </div>
    )
  }

  if (error || !data) {
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

  const status = statusMap[data.ischeck] || "processing"
  const StatusIcon = statusIcons[status]
  const statusLabel = status.charAt(0).toUpperCase() + status.slice(1)

  const timeline = [
    { status: "Request Submitted", description: "Return request submitted and received", completed: true },
    { status: "Under Review", description: "Return request is being reviewed", completed: data.ischeck !== 0 },
    { status: "Approved", description: "Return request approved", completed: data.ischeck === 1 },
    { status: "Refund Processed", description: "Refund sent to original payment method", completed: data.ischeck === 4 },
  ]

  const progressPercentage = (timeline.filter((t) => t.completed).length / timeline.length) * 100

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link
              href="/returns"
              className="flex items-center gap-2 text-lg font-semibold hover:text-primary"
            >
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
                  <CardTitle className="text-2xl">Return #{data.id}</CardTitle>
                  <p className="text-muted-foreground">
                    Submitted on {new Date(data.created_at).toLocaleDateString()} • Order ID: {data.order_id}
                  </p>
                </div>
                <div className="text-right">
                  <Badge className={`${statusColors[status]} mb-2`}>
                    <StatusIcon className="h-4 w-4 mr-1" />
                    {statusLabel}
                  </Badge>
                  <p className="text-2xl font-bold text-green-600">${data.amount.toFixed(2)}</p>
                </div>
              </div>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div>
                  <h4 className="font-semibold mb-2">Reason / Notes</h4>
                  <p className="text-sm">{data.notes || "—"}</p>
                </div>
                <div>
                  <h4 className="font-semibold mb-2">Product ID</h4>
                  <p className="text-sm font-mono">{data.product_id}</p>
                </div>
                <div>
                  <h4 className="font-semibold mb-2">Refund Amount</h4>
                  <p className="text-sm font-medium text-green-600">${data.amount.toFixed(2)}</p>
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
                  {timeline.map((step, index) => (
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
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Instructions */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <MapPin className="h-5 w-5" />
                Return Instructions
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                <p className="text-sm">Please package the product and use the provided label if applicable.</p>
                <Separator />
                <ul className="text-sm space-y-1">
                  <li>• Return authorization: #{data.id}</li>
                  <li>• Order ID: {data.order_id}</li>
                  <li>• Product ID: {data.product_id}</li>
                </ul>

                <div className="space-y-2 pt-4">
                  {data.ischeck === 1 && (
                    <Button className="w-full">
                      <Download className="h-4 w-4 mr-2" />
                      Download Return Label
                    </Button>
                  )}
                  {data.ischeck === 1 && (
                    <Button variant="outline" className="w-full bg-transparent">
                      <Truck className="h-4 w-4 mr-2" />
                      Track Return Package
                    </Button>
                  )}
                  <Link href={`/orders/${data.order_id}`}>
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
  )
}
