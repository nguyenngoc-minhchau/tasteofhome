"use client"

import { useState, useEffect } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { useAuth } from "@/hooks/use-auth"
import { useRouter } from "next/navigation"
import { Package, Search, ArrowLeft, TrendingUp, TrendingDown, AlertTriangle } from "lucide-react"
import Link from "next/link"

interface InventoryItem {
  id: number
  product_code: string
  product_name: string
  category: string
  current_stock: number
  min_stock: number
  max_stock: number
  unit: string
  last_updated: string
  status: "in_stock" | "low_stock" | "out_of_stock" | "overstock"
}

const mockInventoryItems: InventoryItem[] = [
  {
    id: 1,
    product_code: "PROD-001",
    product_name: "Bánh chả Hà Nội",
    category: "Bánh truyền thống",
    current_stock: 150,
    min_stock: 50,
    max_stock: 200,
    unit: "cái",
    last_updated: "2024-01-15T10:30:00Z",
    status: "in_stock"
  },
  {
    id: 2,
    product_code: "PROD-002",
    product_name: "Chả mực Hạ Long",
    category: "Hải sản",
    current_stock: 25,
    min_stock: 30,
    max_stock: 100,
    unit: "kg",
    last_updated: "2024-01-15T09:15:00Z",
    status: "low_stock"
  },
  {
    id: 3,
    product_code: "PROD-003",
    product_name: "Giò lụa Nam Định",
    category: "Thịt chế biến",
    current_stock: 0,
    min_stock: 20,
    max_stock: 80,
    unit: "kg",
    last_updated: "2024-01-14T16:45:00Z",
    status: "out_of_stock"
  },
  {
    id: 4,
    product_code: "PROD-004",
    product_name: "Mắm tép Kim Sơn",
    category: "Gia vị",
    current_stock: 300,
    min_stock: 50,
    max_stock: 150,
    unit: "chai",
    last_updated: "2024-01-15T11:20:00Z",
    status: "overstock"
  }
]

const statusConfig = {
  in_stock: { label: "Còn hàng", color: "bg-green-100 text-green-800", icon: TrendingUp },
  low_stock: { label: "Sắp hết", color: "bg-yellow-100 text-yellow-800", icon: AlertTriangle },
  out_of_stock: { label: "Hết hàng", color: "bg-red-100 text-red-800", icon: TrendingDown },
  overstock: { label: "Tồn kho cao", color: "bg-blue-100 text-blue-800", icon: TrendingUp }
}

export default function StaffInventoryPage() {
  const { user, isAuthenticated, loading } = useAuth()
  const router = useRouter()
  const [inventoryItems, setInventoryItems] = useState<InventoryItem[]>(mockInventoryItems)
  const [searchTerm, setSearchTerm] = useState("")
  const [selectedCategory, setSelectedCategory] = useState("all")
  const [selectedStatus, setSelectedStatus] = useState("all")

  useEffect(() => {
    if (loading) return

    if (!isAuthenticated) {
      router.replace("/auth")
    } else if (user && user.role !== "staff") {
      router.replace(user.role === "customer" ? "/" : "/dashboard")
    }
  }, [isAuthenticated, user, router, loading])

  const categories = Array.from(new Set(inventoryItems.map(item => item.category)))

  const filteredItems = inventoryItems.filter(item => {
    const searchMatch = item.product_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                       item.product_code.toLowerCase().includes(searchTerm.toLowerCase())
    const categoryMatch = selectedCategory === "all" || item.category === selectedCategory
    const statusMatch = selectedStatus === "all" || item.status === selectedStatus
    return searchMatch && categoryMatch && statusMatch
  })

  const getStatusCount = (status: string) => {
    return inventoryItems.filter(item => item.status === status).length
  }

  const getCategoryCount = (category: string) => {
    return inventoryItems.filter(item => item.category === category).length
  }

  const getTotalValue = () => {
    // Mock calculation - in real app this would use actual prices
    return inventoryItems.reduce((total, item) => total + (item.current_stock * 1000), 0)
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
        <h2 className="text-3xl font-bold mb-2">Quản lý kho</h2>
        <p className="text-muted-foreground">
          Theo dõi tồn kho và quản lý sản phẩm
        </p>
      </header>

      {/* Statistics */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center space-x-4">
              <div className="p-3 bg-blue-100 rounded-lg">
                <Package className="h-8 w-8 text-blue-600" />
              </div>
              <div>
                <p className="text-sm font-medium text-muted-foreground">Tổng sản phẩm</p>
                <p className="text-2xl font-bold">{inventoryItems.length}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center space-x-4">
              <div className="p-3 bg-green-100 rounded-lg">
                <TrendingUp className="h-8 w-8 text-green-600" />
              </div>
              <div>
                <p className="text-sm font-medium text-muted-foreground">Còn hàng</p>
                <p className="text-2xl font-bold">{getStatusCount("in_stock")}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center space-x-4">
              <div className="p-3 bg-yellow-100 rounded-lg">
                <AlertTriangle className="h-8 w-8 text-yellow-600" />
              </div>
              <div>
                <p className="text-sm font-medium text-muted-foreground">Sắp hết</p>
                <p className="text-2xl font-bold">{getStatusCount("low_stock")}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center space-x-4">
              <div className="p-3 bg-red-100 rounded-lg">
                <TrendingDown className="h-8 w-8 text-red-600" />
              </div>
              <div>
                <p className="text-sm font-medium text-muted-foreground">Hết hàng</p>
                <p className="text-2xl font-bold">{getStatusCount("out_of_stock")}</p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Filters and Search */}
      <Card className="mb-6">
        <CardContent className="p-6">
          <div className="flex flex-col md:flex-row gap-4">
            <div className="flex-1">
              <div className="relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                <Input
                  placeholder="Tìm kiếm sản phẩm..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-10"
                />
              </div>
            </div>
            <div className="flex gap-4">
              <div>
                <label className="text-sm font-medium mb-2 block">Danh mục</label>
                <select
                  value={selectedCategory}
                  onChange={(e) => setSelectedCategory(e.target.value)}
                  className="border rounded-md px-3 py-2 text-sm"
                >
                  <option value="all">Tất cả</option>
                  {categories.map(category => (
                    <option key={category} value={category}>
                      {category} ({getCategoryCount(category)})
                    </option>
                  ))}
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
                  <option value="in_stock">Còn hàng ({getStatusCount("in_stock")})</option>
                  <option value="low_stock">Sắp hết ({getStatusCount("low_stock")})</option>
                  <option value="out_of_stock">Hết hàng ({getStatusCount("out_of_stock")})</option>
                  <option value="overstock">Tồn kho cao ({getStatusCount("overstock")})</option>
                </select>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Inventory List */}
      <div className="space-y-4">
        {filteredItems.length === 0 ? (
          <Card>
            <CardContent className="py-12 text-center">
              <Package className="h-12 w-12 mx-auto text-muted-foreground mb-4" />
              <p className="text-muted-foreground">Không có sản phẩm nào phù hợp với bộ lọc</p>
            </CardContent>
          </Card>
        ) : (
          filteredItems.map((item) => {
            const statusInfo = statusConfig[item.status]
            const StatusIcon = statusInfo.icon
            const stockPercentage = (item.current_stock / item.max_stock) * 100

            return (
              <Card key={item.id} className="hover:shadow-md transition-shadow">
                <CardContent className="p-6">
                  <div className="flex items-start justify-between">
                    <div className="flex-1">
                      <div className="flex items-center space-x-3 mb-2">
                        <h3 className="font-semibold text-lg">{item.product_code}</h3>
                        <Badge className={`${statusInfo.color} border-0`}>
                          <StatusIcon className="h-3 w-3 mr-1" />
                          {statusInfo.label}
                        </Badge>
                      </div>
                      <p className="font-medium mb-1">{item.product_name}</p>
                      <p className="text-sm text-muted-foreground mb-3">
                        Danh mục: {item.category}
                      </p>
                      
                      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
                        <div>
                          <span className="text-muted-foreground">Tồn kho:</span>
                          <p className="font-medium">{item.current_stock} {item.unit}</p>
                        </div>
                        <div>
                          <span className="text-muted-foreground">Tối thiểu:</span>
                          <p className="font-medium">{item.min_stock} {item.unit}</p>
                        </div>
                        <div>
                          <span className="text-muted-foreground">Tối đa:</span>
                          <p className="font-medium">{item.max_stock} {item.unit}</p>
                        </div>
                        <div>
                          <span className="text-muted-foreground">Cập nhật:</span>
                          <p className="font-medium">{formatDate(item.last_updated)}</p>
                        </div>
                      </div>

                      {/* Stock Level Bar */}
                      <div className="mt-3">
                        <div className="flex justify-between text-xs text-muted-foreground mb-1">
                          <span>Mức tồn kho</span>
                          <span>{Math.round(stockPercentage)}%</span>
                        </div>
                        <div className="w-full bg-gray-200 rounded-full h-2">
                          <div
                            className={`h-2 rounded-full ${
                              stockPercentage > 70 ? 'bg-green-500' :
                              stockPercentage > 30 ? 'bg-yellow-500' : 'bg-red-500'
                            }`}
                            style={{ width: `${Math.min(stockPercentage, 100)}%` }}
                          ></div>
                        </div>
                      </div>
                    </div>
                    
                    <div className="flex flex-col space-y-2 ml-4">
                      <Button variant="outline" size="sm">
                        Xem chi tiết
                      </Button>
                      <Button variant="outline" size="sm">
                        Cập nhật kho
                      </Button>
                    </div>
                  </div>
                </CardContent>
              </Card>
            )
          })
        )}
      </div>
    </div>
  )
}
