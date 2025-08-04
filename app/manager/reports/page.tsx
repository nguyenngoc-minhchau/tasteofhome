"use client"

import { useState } from "react"
import Link from "next/link"
import {
  ArrowLeft,
  Download,
  TrendingUp,
  TrendingDown,
  DollarSign,
  Package,
  Users,
  ShoppingCart,
  Calendar,
} from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Badge } from "@/components/ui/badge"

// Mock sales data
const salesData = {
  overview: {
    totalRevenue: 45678.9,
    totalOrders: 1247,
    averageOrderValue: 36.64,
    totalCustomers: 892,
    conversionRate: 3.2,
    revenueGrowth: 12.5,
    orderGrowth: 8.3,
    customerGrowth: 15.7,
  },
  topProducts: [
    { id: 1, name: "Premium Ethiopian Coffee Beans", revenue: 8456.78, units: 342, growth: 18.5 },
    { id: 3, name: "Organic Green Tea", revenue: 6234.5, units: 287, growth: 12.3 },
    { id: 7, name: "French Lavender Oil", revenue: 5890.25, units: 156, growth: 25.7 },
    { id: 4, name: "Artisan Dark Chocolate", revenue: 4567.8, units: 198, growth: -5.2 },
    { id: 2, name: "Himalayan Pink Salt", revenue: 3456.9, units: 234, growth: 8.9 },
  ],
  categoryPerformance: [
    { category: "Coffee", revenue: 12456.78, orders: 456, growth: 15.2 },
    { category: "Essential Oils", revenue: 8934.5, orders: 234, growth: 22.8 },
    { category: "Tea", revenue: 7823.45, orders: 312, growth: 9.7 },
    { category: "Chocolate", revenue: 6789.12, orders: 198, growth: -2.1 },
    { category: "Spices", revenue: 5678.9, orders: 267, growth: 11.4 },
  ],
  recentOrders: [
    { id: "ORD-2024-001", customer: "John Doe", amount: 67.48, status: "delivered", date: "2024-01-15" },
    { id: "ORD-2024-002", customer: "Jane Smith", amount: 45.75, status: "shipped", date: "2024-01-20" },
    { id: "ORD-2024-003", customer: "Bob Johnson", amount: 32.0, status: "processing", date: "2024-01-22" },
    { id: "ORD-2024-005", customer: "Alice Brown", amount: 159.5, status: "delivered", date: "2024-01-18" },
  ],
  monthlyTrends: [
    { month: "Oct 2023", revenue: 38456.78, orders: 1089 },
    { month: "Nov 2023", revenue: 41234.56, orders: 1156 },
    { month: "Dec 2023", revenue: 52678.9, orders: 1398 },
    { month: "Jan 2024", revenue: 45678.9, orders: 1247 },
  ],
}

export default function SalesReportsPage() {
  const [dateRange, setDateRange] = useState("30days")
  const [categoryFilter, setCategoryFilter] = useState("all")

  const handleExportData = () => {
    // Simulate data export
    console.log("Exporting sales data...")
    alert("Sales report exported successfully!")
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div>
              <Link href="/manager" className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-2">
                <ArrowLeft className="h-5 w-5" />
                Back to Manager Dashboard
              </Link>
              <h1 className="text-2xl font-bold">Sales Reports & Analytics</h1>
              <p className="text-muted-foreground">Comprehensive sales performance dashboard</p>
            </div>
            <div className="flex items-center gap-4">
              <div className="flex items-center gap-2">
                <Calendar className="h-4 w-4 text-muted-foreground" />
                <Select value={dateRange} onValueChange={setDateRange}>
                  <SelectTrigger className="w-32">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="7days">Last 7 days</SelectItem>
                    <SelectItem value="30days">Last 30 days</SelectItem>
                    <SelectItem value="90days">Last 90 days</SelectItem>
                    <SelectItem value="1year">Last year</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <Button onClick={handleExportData} variant="outline">
                <Download className="h-4 w-4 mr-2" />
                Export Data
              </Button>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* Key Metrics */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Revenue</CardTitle>
              <DollarSign className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">${salesData.overview.totalRevenue.toLocaleString()}</div>
              <div className="flex items-center text-xs text-green-600">
                <TrendingUp className="h-3 w-3 mr-1" />+{salesData.overview.revenueGrowth}% from last period
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Orders</CardTitle>
              <ShoppingCart className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{salesData.overview.totalOrders.toLocaleString()}</div>
              <div className="flex items-center text-xs text-green-600">
                <TrendingUp className="h-3 w-3 mr-1" />+{salesData.overview.orderGrowth}% from last period
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Average Order Value</CardTitle>
              <Package className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">${salesData.overview.averageOrderValue}</div>
              <div className="text-xs text-muted-foreground">Revenue ÷ Orders</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Customers</CardTitle>
              <Users className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{salesData.overview.totalCustomers}</div>
              <div className="flex items-center text-xs text-green-600">
                <TrendingUp className="h-3 w-3 mr-1" />+{salesData.overview.customerGrowth}% from last period
              </div>
            </CardContent>
          </Card>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
          {/* Top Products */}
          <Card>
            <CardHeader>
              <CardTitle>Top Performing Products</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {salesData.topProducts.map((product, index) => (
                  <div key={product.id} className="flex items-center justify-between">
                    <div className="flex items-center gap-3">
                      <div className="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-sm font-semibold">
                        {index + 1}
                      </div>
                      <div>
                        <p className="font-medium">{product.name}</p>
                        <p className="text-sm text-muted-foreground">{product.units} units sold</p>
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold">${product.revenue.toLocaleString()}</p>
                      <div
                        className={`flex items-center text-xs ${product.growth > 0 ? "text-green-600" : "text-red-600"}`}
                      >
                        {product.growth > 0 ? (
                          <TrendingUp className="h-3 w-3 mr-1" />
                        ) : (
                          <TrendingDown className="h-3 w-3 mr-1" />
                        )}
                        {Math.abs(product.growth)}%
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Category Performance */}
          <Card>
            <CardHeader>
              <CardTitle>Category Performance</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {salesData.categoryPerformance.map((category) => (
                  <div key={category.category} className="space-y-2">
                    <div className="flex items-center justify-between">
                      <span className="font-medium">{category.category}</span>
                      <div className="flex items-center gap-2">
                        <span className="font-semibold">${category.revenue.toLocaleString()}</span>
                        <Badge variant={category.growth > 0 ? "default" : "destructive"} className="text-xs">
                          {category.growth > 0 ? "+" : ""}
                          {category.growth}%
                        </Badge>
                      </div>
                    </div>
                    <div className="flex justify-between text-sm text-muted-foreground">
                      <span>{category.orders} orders</span>
                      <span>Avg: ${(category.revenue / category.orders).toFixed(2)}</span>
                    </div>
                    <div className="w-full bg-gray-200 rounded-full h-2">
                      <div
                        className="bg-blue-600 h-2 rounded-full"
                        style={{ width: `${(category.revenue / salesData.categoryPerformance[0].revenue) * 100}%` }}
                      ></div>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Recent Orders */}
          <Card>
            <CardHeader>
              <CardTitle>Recent Orders</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {salesData.recentOrders.map((order) => (
                  <div key={order.id} className="flex items-center justify-between">
                    <div>
                      <p className="font-medium">{order.id}</p>
                      <p className="text-sm text-muted-foreground">{order.customer}</p>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold">${order.amount}</p>
                      <div className="flex items-center gap-2">
                        <Badge variant="outline" className="text-xs">
                          {order.status}
                        </Badge>
                        <span className="text-xs text-muted-foreground">
                          {new Date(order.date).toLocaleDateString()}
                        </span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Monthly Trends */}
          <Card>
            <CardHeader>
              <CardTitle>Monthly Trends</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {salesData.monthlyTrends.map((month, index) => {
                  const prevMonth = salesData.monthlyTrends[index - 1]
                  const growth = prevMonth ? ((month.revenue - prevMonth.revenue) / prevMonth.revenue) * 100 : 0

                  return (
                    <div key={month.month} className="flex items-center justify-between">
                      <div>
                        <p className="font-medium">{month.month}</p>
                        <p className="text-sm text-muted-foreground">{month.orders} orders</p>
                      </div>
                      <div className="text-right">
                        <p className="font-semibold">${month.revenue.toLocaleString()}</p>
                        {index > 0 && (
                          <div
                            className={`flex items-center text-xs ${growth > 0 ? "text-green-600" : "text-red-600"}`}
                          >
                            {growth > 0 ? (
                              <TrendingUp className="h-3 w-3 mr-1" />
                            ) : (
                              <TrendingDown className="h-3 w-3 mr-1" />
                            )}
                            {Math.abs(growth).toFixed(1)}%
                          </div>
                        )}
                      </div>
                    </div>
                  )
                })}
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Additional Insights */}
        <Card className="mt-8">
          <CardHeader>
            <CardTitle>Key Insights & Recommendations</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              <div className="space-y-2">
                <h4 className="font-semibold text-green-600">🚀 Growth Opportunities</h4>
                <ul className="text-sm space-y-1">
                  <li>• French Lavender Oil showing 25.7% growth</li>
                  <li>• Essential Oils category up 22.8%</li>
                  <li>• Customer base growing 15.7%</li>
                </ul>
              </div>
              <div className="space-y-2">
                <h4 className="font-semibold text-yellow-600">⚠️ Areas for Attention</h4>
                <ul className="text-sm space-y-1">
                  <li>• Artisan Dark Chocolate sales down 5.2%</li>
                  <li>• Chocolate category declining 2.1%</li>
                  <li>• Consider promotional campaigns</li>
                </ul>
              </div>
              <div className="space-y-2">
                <h4 className="font-semibold text-blue-600">📊 Performance Metrics</h4>
                <ul className="text-sm space-y-1">
                  <li>• Conversion rate: {salesData.overview.conversionRate}%</li>
                  <li>• Average order value: ${salesData.overview.averageOrderValue}</li>
                  <li>
                    • Revenue per customer: $
                    {(salesData.overview.totalRevenue / salesData.overview.totalCustomers).toFixed(2)}
                  </li>
                </ul>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
