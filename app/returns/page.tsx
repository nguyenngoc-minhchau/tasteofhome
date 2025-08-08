"use client"

import { useEffect, useState } from "react"
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
} from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Input } from "@/components/ui/input"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"
import {
  Tabs,
  TabsContent,
  TabsList,
  TabsTrigger,
} from "@/components/ui/tabs"

type ReturnRequest = {
  id: number
  order_id: number | null
  product_id: number
  amount: number
  notes?: string | null
  ischeck: number
  created_at: string
  updated_at: string
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

// map `ischeck` to status string
function mapStatus(ischeck: number): keyof typeof statusColors {
  switch (ischeck) {
    case 0:
      return "pending"
    case 1:
      return "approved"
    case 2:
      return "rejected"
    default:
      return "processing"
  }
}

export default function ReturnsPage() {
  const [returns, setReturns] = useState<ReturnRequest[]>([])
  const [searchTerm, setSearchTerm] = useState("")
  const [statusFilter, setStatusFilter] = useState("all")
  const [selectedTab, setSelectedTab] = useState("all")

  useEffect(() => {
    async function fetchReturns() {
      try {
        const res = await fetch("/api/admin/returns")
        const json = await res.json()
        setReturns(json.data || [])
      } catch (err) {
        console.error("Failed to load returns", err)
      }
    }

    fetchReturns()
  }, [])

  const filteredReturns = returns.filter((returnReq) => {
    const status = mapStatus(returnReq.ischeck)
    const matchesSearch =
      `${returnReq.id}`.includes(searchTerm.toLowerCase()) ||
      `${returnReq.order_id}`.includes(searchTerm.toLowerCase())

    const matchesStatus = selectedTab === "all" || status === selectedTab

    return matchesSearch && matchesStatus
  })

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link
              href="/orders"
              className="flex items-center gap-2 text-lg font-semibold hover:text-primary"
            >
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
              <p className="text-muted-foreground">
                Track and manage your product returns
              </p>
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
                      placeholder="Search by ID or order ID..."
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

          {/* Tabs */}
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
                    const status = mapStatus(returnReq.ischeck)
                    const StatusIcon = statusIcons[status]
                    return (
                      <Card key={returnReq.id} className="hover:shadow-md transition-shadow">
                        <CardHeader>
                          <div className="flex items-center justify-between">
                            <div>
                              <CardTitle className="text-lg">
                                Return #{returnReq.id}
                              </CardTitle>
                              <p className="text-sm text-muted-foreground">
                                Order ID: {returnReq.order_id ?? "N/A"} • Submitted on{" "}
                                {new Date(returnReq.created_at).toLocaleDateString()}
                              </p>
                            </div>
                            <div className="text-right">
                              <Badge className={`${statusColors[status]} mb-2`}>
                                <StatusIcon className="h-4 w-4 mr-1" />
                                {status.charAt(0).toUpperCase() + status.slice(1)}
                              </Badge>
                              <p className="text-lg font-semibold">
                                ${returnReq.amount.toFixed(2)}
                              </p>
                            </div>
                          </div>
                        </CardHeader>
                        <CardContent>
                          <div className="space-y-3 text-sm">
                            <div>
                              <strong>Product ID:</strong> {returnReq.product_id}
                            </div>
                            {returnReq.notes && (
                              <div>
                                <strong>Notes:</strong> {returnReq.notes}
                              </div>
                            )}
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