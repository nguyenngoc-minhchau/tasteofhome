"use client"

import { useState, useEffect } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { useAuth } from "@/hooks/use-auth"
import { useRouter } from "next/navigation"
import { MessageCircle, Clock, CheckCircle, AlertCircle, ArrowLeft } from "lucide-react"
import Link from "next/link"

interface SupportTicket {
  id: string
  customer: string
  subject: string
  priority: "low" | "medium" | "high"
  status: "open" | "in_progress" | "resolved" | "closed"
  created_at: string
  last_updated: string
}

const mockSupportTickets: SupportTicket[] = [
  {
    id: "SUP-123456",
    customer: "Alice Brown",
    subject: "Câu hỏi về giao hàng",
    priority: "medium",
    status: "open",
    created_at: "2024-01-15T10:30:00Z",
    last_updated: "2024-01-15T10:30:00Z"
  },
  {
    id: "SUP-123455",
    customer: "Bob Wilson",
    subject: "Yêu cầu trả hàng",
    priority: "high",
    status: "in_progress",
    created_at: "2024-01-14T15:20:00Z",
    last_updated: "2024-01-15T09:15:00Z"
  },
  {
    id: "SUP-123454",
    customer: "Carol Lee",
    subject: "Vấn đề đăng nhập tài khoản",
    priority: "low",
    status: "resolved",
    created_at: "2024-01-13T11:45:00Z",
    last_updated: "2024-01-14T16:30:00Z"
  },
  {
    id: "SUP-123453",
    customer: "David Chen",
    subject: "Phương thức thanh toán không hoạt động",
    priority: "high",
    status: "open",
    created_at: "2024-01-15T08:00:00Z",
    last_updated: "2024-01-15T08:00:00Z"
  }
]

const priorityColors = {
  low: "bg-green-100 text-green-800",
  medium: "bg-yellow-100 text-yellow-800",
  high: "bg-red-100 text-red-800"
}

const priorityLabels = {
  low: "Thấp",
  medium: "Trung bình",
  high: "Cao"
}

const statusColors = {
  open: "bg-blue-100 text-blue-800",
  in_progress: "bg-orange-100 text-orange-800",
  resolved: "bg-green-100 text-green-800",
  closed: "bg-gray-100 text-gray-800"
}

const statusLabels = {
  open: "Mở",
  in_progress: "Đang xử lý",
  resolved: "Đã giải quyết",
  closed: "Đã đóng"
}

export default function StaffSupportPage() {
  const { user, isAuthenticated, loading } = useAuth()
  const router = useRouter()
  const [tickets, setTickets] = useState<SupportTicket[]>(mockSupportTickets)
  const [selectedPriority, setSelectedPriority] = useState<string>("all")
  const [selectedStatus, setSelectedStatus] = useState<string>("all")

  useEffect(() => {
    if (loading) return

    if (!isAuthenticated) {
      router.replace("/auth")
    } else if (user && user.role !== "staff") {
      router.replace(user.role === "customer" ? "/" : "/dashboard")
    }
  }, [isAuthenticated, user, router, loading])

  const filteredTickets = tickets.filter(ticket => {
    const priorityMatch = selectedPriority === "all" || ticket.priority === selectedPriority
    const statusMatch = selectedStatus === "all" || ticket.status === selectedStatus
    return priorityMatch && statusMatch
  })

  const getPriorityCount = (priority: string) => {
    return tickets.filter(ticket => ticket.priority === priority).length
  }

  const getStatusCount = (status: string) => {
    return tickets.filter(ticket => ticket.status === status).length
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString("vi-VN", {
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
      hour: "2-digit",
      minute: "2-digit"
    })
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p>Đang tải...</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-background p-6">
      <header className="border-b mb-6 pb-4">
        <div className="flex items-center space-x-4 mb-4">
          <Link href="/staff/dashboard">
            <Button variant="outline" size="sm">
              <ArrowLeft className="h-4 w-4 mr-2" />
              Quay lại Dashboard
            </Button>
          </Link>
        </div>
        <h2 className="text-3xl font-bold mb-2">Hỗ trợ khách hàng</h2>
        <p className="text-muted-foreground">
          Quản lý và xử lý các yêu cầu hỗ trợ từ khách hàng
        </p>
      </header>

      {/* Statistics */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center space-x-4">
              <div className="p-3 bg-blue-100 rounded-lg">
                <MessageCircle className="h-8 w-8 text-blue-600" />
              </div>
              <div>
                <p className="text-sm font-medium text-muted-foreground">Tổng số ticket</p>
                <p className="text-2xl font-bold">{tickets.length}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center space-x-4">
              <div className="p-3 bg-yellow-100 rounded-lg">
                <Clock className="h-8 w-8 text-yellow-600" />
              </div>
              <div>
                <p className="text-sm font-medium text-muted-foreground">Đang mở</p>
                <p className="text-2xl font-bold">{getStatusCount("open")}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center space-x-4">
              <div className="p-3 bg-orange-100 rounded-lg">
                <AlertCircle className="h-8 w-8 text-orange-600" />
              </div>
              <div>
                <p className="text-sm font-medium text-muted-foreground">Đang xử lý</p>
                <p className="text-2xl font-bold">{getStatusCount("in_progress")}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center space-x-4">
              <div className="p-3 bg-green-100 rounded-lg">
                <CheckCircle className="h-8 w-8 text-green-600" />
              </div>
              <div>
                <p className="text-sm font-medium text-muted-foreground">Đã giải quyết</p>
                <p className="text-2xl font-bold">{getStatusCount("resolved")}</p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Filters */}
      <Card className="mb-6">
        <CardContent className="p-6">
          <div className="flex flex-wrap gap-4">
            <div>
              <label className="text-sm font-medium mb-2 block">Ưu tiên</label>
              <select
                value={selectedPriority}
                onChange={(e) => setSelectedPriority(e.target.value)}
                className="border rounded-md px-3 py-2 text-sm"
              >
                <option value="all">Tất cả</option>
                <option value="low">Thấp ({getPriorityCount("low")})</option>
                <option value="medium">Trung bình ({getPriorityCount("medium")})</option>
                <option value="high">Cao ({getPriorityCount("high")})</option>
              </select>
            </div>
            <div>
              <label className="text-sm font-medium mb-2 block">Trạng thái</label>
              <select
                value={selectedStatus}
                onChange={(e) => setSelectedStatus(e.target.value)}
                className="border rounded-md px-3 py-2 text-sm"
              >
                <option value="all">Tất cả</option>
                <option value="open">Mở ({getStatusCount("open")})</option>
                <option value="in_progress">Đang xử lý ({getStatusCount("in_progress")})</option>
                <option value="resolved">Đã giải quyết ({getStatusCount("resolved")})</option>
                <option value="closed">Đã đóng ({getStatusCount("closed")})</option>
              </select>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Tickets List */}
      <div className="space-y-4">
        {filteredTickets.length === 0 ? (
          <Card>
            <CardContent className="py-12 text-center">
              <MessageCircle className="h-12 w-12 mx-auto text-muted-foreground mb-4" />
              <p className="text-muted-foreground">Không có ticket nào phù hợp với bộ lọc</p>
            </CardContent>
          </Card>
        ) : (
          filteredTickets.map((ticket) => (
            <Card key={ticket.id} className="hover:shadow-md transition-shadow">
              <CardContent className="p-6">
                <div className="flex items-start justify-between">
                  <div className="flex-1">
                    <div className="flex items-center space-x-3 mb-2">
                      <h3 className="font-semibold text-lg">{ticket.id}</h3>
                      <Badge className={`${priorityColors[ticket.priority]} border-0`}>
                        {priorityLabels[ticket.priority]}
                      </Badge>
                      <Badge className={`${statusColors[ticket.status]} border-0`}>
                        {statusLabels[ticket.status]}
                      </Badge>
                    </div>
                    <p className="font-medium mb-1">{ticket.subject}</p>
                    <p className="text-sm text-muted-foreground mb-2">
                      Khách hàng: {ticket.customer}
                    </p>
                    <div className="flex space-x-4 text-xs text-muted-foreground">
                      <span>Tạo: {formatDate(ticket.created_at)}</span>
                      <span>Cập nhật: {formatDate(ticket.last_updated)}</span>
                    </div>
                  </div>
                  <div className="flex space-x-2">
                    <Button variant="outline" size="sm">
                      Xem chi tiết
                    </Button>
                    {ticket.status === "open" && (
                      <Button size="sm">
                        Bắt đầu xử lý
                      </Button>
                    )}
                  </div>
                </div>
              </CardContent>
            </Card>
          ))
        )}
      </div>
    </div>
  )
}
