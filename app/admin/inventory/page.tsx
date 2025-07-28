"use client"

import { useState, useEffect } from "react"
import Link from "next/link"
import {
  ArrowLeft,
  Search,
  Package,
  AlertTriangle,
  TrendingDown,
  Edit,
  CheckCircle,
  XCircle,
  Clock,
} from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Badge } from "@/components/ui/badge"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Alert, AlertDescription } from "@/components/ui/alert"

// Mock inventory data with detailed tracking
const initialInventoryData = [
  {
    id: 1,
    name: "Premium Ethiopian Coffee Beans",
    sku: "COFFEE-ETH-001",
    currentStock: 45,
    minStock: 20,
    maxStock: 100,
    status: "in-stock",
    category: "Coffee",
    price: 24.99,
    lastUpdated: "2024-01-20T10:30:00Z",
    lastUpdatedBy: "John Smith",
    supplier: "Ethiopian Coffee Co.",
    location: "Warehouse A-1",
    reorderPoint: 25,
    averageDailySales: 2.5,
    daysOfStock: 18,
    adjustmentHistory: [
      { date: "2024-01-20", type: "add", quantity: 20, reason: "restock", user: "John Smith" },
      { date: "2024-01-15", type: "remove", quantity: 5, reason: "damaged", user: "Sarah Johnson" },
    ],
  },
  {
    id: 2,
    name: "Himalayan Pink Salt",
    sku: "SALT-HIM-001",
    currentStock: 78,
    minStock: 30,
    maxStock: 150,
    status: "in-stock",
    category: "Spices",
    price: 12.5,
    lastUpdated: "2024-01-19T14:15:00Z",
    lastUpdatedBy: "Sarah Johnson",
    supplier: "Himalayan Imports",
    location: "Warehouse B-2",
    reorderPoint: 35,
    averageDailySales: 1.8,
    daysOfStock: 43,
    adjustmentHistory: [{ date: "2024-01-19", type: "add", quantity: 50, reason: "restock", user: "Sarah Johnson" }],
  },
  {
    id: 3,
    name: "Organic Green Tea",
    sku: "TEA-GRN-001",
    currentStock: 15,
    minStock: 25,
    maxStock: 80,
    status: "low-stock",
    category: "Tea",
    price: 18.75,
    lastUpdated: "2024-01-18T09:45:00Z",
    lastUpdatedBy: "Mike Wilson",
    supplier: "Japanese Tea Masters",
    location: "Warehouse A-3",
    reorderPoint: 30,
    averageDailySales: 3.2,
    daysOfStock: 5,
    adjustmentHistory: [
      { date: "2024-01-18", type: "remove", quantity: 10, reason: "expired", user: "Mike Wilson" },
      { date: "2024-01-10", type: "add", quantity: 25, reason: "restock", user: "John Smith" },
    ],
  },
  {
    id: 4,
    name: "Artisan Dark Chocolate",
    sku: "CHOC-DRK-001",
    currentStock: 0,
    minStock: 15,
    maxStock: 60,
    status: "out-of-stock",
    category: "Chocolate",
    price: 32.0,
    lastUpdated: "2024-01-17T16:20:00Z",
    lastUpdatedBy: "Lisa Chen",
    supplier: "Belgian Chocolatiers",
    location: "Warehouse C-1",
    reorderPoint: 20,
    averageDailySales: 1.5,
    daysOfStock: 0,
    adjustmentHistory: [
      { date: "2024-01-17", type: "remove", quantity: 8, reason: "damaged", user: "Lisa Chen" },
      { date: "2024-01-15", type: "remove", quantity: 7, reason: "return", user: "Mike Wilson" },
    ],
  },
  {
    id: 5,
    name: "Wild Honey",
    sku: "HON-WLD-001",
    currentStock: 67,
    minStock: 20,
    maxStock: 90,
    status: "in-stock",
    category: "Honey",
    price: 28.99,
    lastUpdated: "2024-01-21T11:00:00Z",
    lastUpdatedBy: "John Smith",
    supplier: "New Zealand Apiaries",
    location: "Warehouse B-1",
    reorderPoint: 25,
    averageDailySales: 2.1,
    daysOfStock: 32,
    adjustmentHistory: [{ date: "2024-01-21", type: "add", quantity: 30, reason: "restock", user: "John Smith" }],
  },
]

const statusColors = {
  "in-stock": "bg-green-500",
  "low-stock": "bg-yellow-500",
  "out-of-stock": "bg-red-500",
  overstocked: "bg-blue-500",
}

const statusIcons = {
  "in-stock": CheckCircle,
  "low-stock": AlertTriangle,
  "out-of-stock": XCircle,
  overstocked: TrendingDown,
}

export default function InventoryManagementPage() {
  const [inventoryData, setInventoryData] = useState(initialInventoryData)
  const [searchQuery, setSearchQuery] = useState("")
  const [selectedCategory, setSelectedCategory] = useState("all")
  const [selectedProduct, setSelectedProduct] = useState<any>(null)
  const [adjustmentData, setAdjustmentData] = useState({
    quantity: "",
    type: "add",
    reason: "",
    notes: "",
  })
  const [isAdjusting, setIsAdjusting] = useState(false)
  const [adjustmentComplete, setAdjustmentComplete] = useState(false)
  const [validationErrors, setValidationErrors] = useState<string[]>([])
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [userRole, setUserRole] = useState("")

  // Simulate authentication check - Manager and Staff can access inventory management
  useEffect(() => {
    const checkAuth = () => {
      const role = localStorage.getItem("userRole") || "staff" // Default to staff for demo
      setUserRole(role)
      // Only Manager and Staff can access inventory management
      setIsAuthenticated(["manager", "staff"].includes(role))
    }
    checkAuth()
  }, [])

  const filteredInventory = inventoryData.filter((item) => {
    const matchesSearch =
      item.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      item.sku.toLowerCase().includes(searchQuery.toLowerCase())

    const matchesCategory = selectedCategory === "all" || item.category === selectedCategory

    return matchesSearch && matchesCategory
  })

  const inventoryStats = {
    totalProducts: inventoryData.length,
    inStock: inventoryData.filter((item) => item.status === "in-stock").length,
    lowStock: inventoryData.filter((item) => item.status === "low-stock").length,
    outOfStock: inventoryData.filter((item) => item.status === "out-of-stock").length,
    totalValue: inventoryData.reduce((sum, item) => sum + item.currentStock * item.price, 0),
  }

  const validateAdjustment = () => {
    const errors: string[] = []

    if (!adjustmentData.quantity || Number(adjustmentData.quantity) <= 0) {
      errors.push("Quantity must be a positive number")
    }

    if (!adjustmentData.reason) {
      errors.push("Reason for adjustment is required")
    }

    if (adjustmentData.type === "remove" && selectedProduct) {
      const newStock = selectedProduct.currentStock - Number(adjustmentData.quantity)
      if (newStock < 0) {
        errors.push("Cannot remove more stock than currently available")
      }
    }

    if (adjustmentData.type === "set" && selectedProduct) {
      const newStock = Number(adjustmentData.quantity)
      if (newStock > selectedProduct.maxStock) {
        errors.push(`Stock level cannot exceed maximum capacity of ${selectedProduct.maxStock}`)
      }
    }

    setValidationErrors(errors)
    return errors.length === 0
  }

  const calculateNewStock = () => {
    if (!selectedProduct || !adjustmentData.quantity) return selectedProduct?.currentStock || 0

    const quantity = Number(adjustmentData.quantity)
    switch (adjustmentData.type) {
      case "add":
        return selectedProduct.currentStock + quantity
      case "remove":
        return Math.max(0, selectedProduct.currentStock - quantity)
      case "set":
        return quantity
      default:
        return selectedProduct.currentStock
    }
  }

  const determineNewStatus = (newStock: number, product: any) => {
    if (newStock === 0) return "out-of-stock"
    if (newStock <= product.minStock) return "low-stock"
    if (newStock >= product.maxStock * 0.9) return "overstocked"
    return "in-stock"
  }

  const handleAdjustInventory = async () => {
    if (!selectedProduct || !validateAdjustment()) return

    setIsAdjusting(true)

    // Simulate API validation and processing
    await new Promise((resolve) => setTimeout(resolve, 2000))

    const newStock = calculateNewStock()
    const newStatus = determineNewStatus(newStock, selectedProduct)
    const currentUser = userRole === "manager" ? "Manager User" : "Staff User"

    // Update inventory data
    setInventoryData((prevData) =>
      prevData.map((item) =>
        item.id === selectedProduct.id
          ? {
              ...item,
              currentStock: newStock,
              status: newStatus,
              lastUpdated: new Date().toISOString(),
              lastUpdatedBy: currentUser,
              daysOfStock: Math.floor(newStock / item.averageDailySales),
              adjustmentHistory: [
                {
                  date: new Date().toISOString().split("T")[0],
                  type: adjustmentData.type,
                  quantity: Number(adjustmentData.quantity),
                  reason: adjustmentData.reason,
                  user: currentUser,
                  notes: adjustmentData.notes,
                },
                ...item.adjustmentHistory,
              ],
            }
          : item,
      ),
    )

    setIsAdjusting(false)
    setAdjustmentComplete(true)

    // Reset form after short delay
    setTimeout(() => {
      setSelectedProduct(null)
      setAdjustmentData({ quantity: "", type: "add", reason: "", notes: "" })
      setAdjustmentComplete(false)
      setValidationErrors([])
    }, 3000)
  }

  const getStockLevelColor = (item: any) => {
    if (item.currentStock === 0) return "text-red-600"
    if (item.currentStock <= item.minStock) return "text-yellow-600"
    if (item.currentStock >= item.maxStock * 0.9) return "text-blue-600"
    return "text-green-600"
  }

  const getUrgencyLevel = (item: any) => {
    if (item.currentStock === 0) return "High"
    if (item.daysOfStock <= 7) return "High"
    if (item.daysOfStock <= 14) return "Medium"
    return "Low"
  }

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <Card className="w-96">
          <CardHeader>
            <CardTitle className="text-center">Access Denied</CardTitle>
          </CardHeader>
          <CardContent className="text-center space-y-4">
            <AlertTriangle className="h-16 w-16 text-red-500 mx-auto" />
            <div>
              <p className="mb-2">
                You need <strong>Manager</strong> or <strong>Staff</strong> privileges to access Inventory Management.
              </p>
              <p className="text-sm text-muted-foreground">Current role: {userRole || "Not authenticated"}</p>
            </div>
            <div className="space-y-2">
              <p className="text-sm text-muted-foreground">For demo purposes, you can simulate different roles:</p>
              <div className="flex gap-2">
                <Button
                  size="sm"
                  onClick={() => {
                    localStorage.setItem("userRole", "manager")
                    window.location.reload()
                  }}
                >
                  Login as Manager
                </Button>
                <Button
                  size="sm"
                  variant="outline"
                  onClick={() => {
                    localStorage.setItem("userRole", "staff")
                    window.location.reload()
                  }}
                >
                  Login as Staff
                </Button>
              </div>
            </div>
            <Link href="/admin">
              <Button variant="outline">Back to Admin</Button>
            </Link>
          </CardContent>
        </Card>
      </div>
    )
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
              <h1 className="text-2xl font-bold">Inventory Management</h1>
              <p className="text-muted-foreground">Monitor and adjust product stock levels</p>
            </div>
            <div className="flex items-center gap-4">
              <Badge variant="outline" className="px-3 py-1">
                <Clock className="h-3 w-3 mr-1" />
                Last Updated: {new Date().toLocaleTimeString()}
              </Badge>
              <Badge variant="secondary" className="capitalize">
                {userRole} Access
              </Badge>
              <Button variant="outline">
                <Package className="h-4 w-4 mr-2" />
                Bulk Import
              </Button>
              <Button variant="outline">Export Report</Button>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* Inventory Stats Dashboard */}
        <div className="grid grid-cols-1 md:grid-cols-5 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Products</CardTitle>
              <Package className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{inventoryStats.totalProducts}</div>
              <p className="text-xs text-muted-foreground">Active SKUs</p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">In Stock</CardTitle>
              <CheckCircle className="h-4 w-4 text-green-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-green-600">{inventoryStats.inStock}</div>
              <p className="text-xs text-muted-foreground">Healthy levels</p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Low Stock</CardTitle>
              <AlertTriangle className="h-4 w-4 text-yellow-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-yellow-600">{inventoryStats.lowStock}</div>
              <p className="text-xs text-muted-foreground">Needs attention</p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Out of Stock</CardTitle>
              <XCircle className="h-4 w-4 text-red-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-red-600">{inventoryStats.outOfStock}</div>
              <p className="text-xs text-muted-foreground">Urgent reorder</p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Value</CardTitle>
              <Package className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">${inventoryStats.totalValue.toLocaleString()}</div>
              <p className="text-xs text-muted-foreground">Current inventory</p>
            </CardContent>
          </Card>
        </div>

        {/* Inventory Management Interface */}
        <Card>
          <CardHeader>
            <CardTitle>Product Inventory</CardTitle>
            <p className="text-sm text-muted-foreground">Review inventory list and adjust stock levels as needed</p>
          </CardHeader>
          <CardContent>
            {/* Search and Filters */}
            <div className="flex gap-4 mb-6">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-4 w-4" />
                <Input
                  placeholder="Search by product name or SKU..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-10"
                />
              </div>
              <Select value={selectedCategory} onValueChange={setSelectedCategory}>
                <SelectTrigger className="w-40">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Categories</SelectItem>
                  <SelectItem value="Coffee">Coffee</SelectItem>
                  <SelectItem value="Tea">Tea</SelectItem>
                  <SelectItem value="Spices">Spices</SelectItem>
                  <SelectItem value="Chocolate">Chocolate</SelectItem>
                  <SelectItem value="Honey">Honey</SelectItem>
                </SelectContent>
              </Select>
            </div>

            {/* Inventory List */}
            <div className="space-y-4">
              {filteredInventory.length === 0 ? (
                <div className="text-center py-8">
                  <Package className="h-12 w-12 text-muted-foreground mx-auto mb-4" />
                  <p className="text-muted-foreground">No products found matching your criteria</p>
                </div>
              ) : (
                filteredInventory.map((item) => {
                  const StatusIcon = statusIcons[item.status as keyof typeof statusIcons]
                  const urgency = getUrgencyLevel(item)

                  return (
                    <Card key={item.id} className="hover:shadow-md transition-shadow">
                      <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                          <div className="space-y-3 flex-1">
                            {/* Product Header */}
                            <div className="flex items-center gap-4">
                              <h3 className="font-semibold text-lg">{item.name}</h3>
                              <Badge className={statusColors[item.status as keyof typeof statusColors]}>
                                <StatusIcon className="h-3 w-3 mr-1" />
                                {item.status.replace("-", " ").toUpperCase()}
                              </Badge>
                              {item.currentStock <= item.minStock && (
                                <Badge variant="outline" className="text-red-600 border-red-600">
                                  <AlertTriangle className="h-3 w-3 mr-1" />
                                  {urgency} Priority
                                </Badge>
                              )}
                            </div>

                            {/* Stock Information Grid */}
                            <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
                              <div>
                                <span className="font-medium text-muted-foreground">SKU:</span>
                                <div className="font-mono text-sm">{item.sku}</div>
                              </div>
                              <div>
                                <span className="font-medium text-muted-foreground">Current Stock:</span>
                                <div className={`font-bold ${getStockLevelColor(item)}`}>{item.currentStock} units</div>
                              </div>
                              <div>
                                <span className="font-medium text-muted-foreground">Min/Max:</span>
                                <div>
                                  {item.minStock}/{item.maxStock} units
                                </div>
                              </div>
                              <div>
                                <span className="font-medium text-muted-foreground">Days of Stock:</span>
                                <div className={item.daysOfStock <= 7 ? "text-red-600 font-bold" : ""}>
                                  {item.daysOfStock} days
                                </div>
                              </div>
                            </div>

                            {/* Additional Details */}
                            <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm text-muted-foreground">
                              <div>
                                <span className="font-medium">Value:</span>
                                <span className="ml-1">${(item.currentStock * item.price).toLocaleString()}</span>
                              </div>
                              <div>
                                <span className="font-medium">Location:</span>
                                <span className="ml-1">{item.location}</span>
                              </div>
                              <div>
                                <span className="font-medium">Supplier:</span>
                                <span className="ml-1">{item.supplier}</span>
                              </div>
                              <div>
                                <span className="font-medium">Last Updated:</span>
                                <span className="ml-1">{new Date(item.lastUpdated).toLocaleDateString()}</span>
                              </div>
                            </div>

                            {/* Stock Level Progress Bar */}
                            <div className="w-full">
                              <div className="flex justify-between text-xs text-muted-foreground mb-1">
                                <span>Stock Level</span>
                                <span>{Math.round((item.currentStock / item.maxStock) * 100)}%</span>
                              </div>
                              <div className="w-full bg-gray-200 rounded-full h-2">
                                <div
                                  className={`h-2 rounded-full transition-all ${
                                    item.currentStock <= item.minStock
                                      ? "bg-red-500"
                                      : item.currentStock >= item.maxStock * 0.9
                                        ? "bg-blue-500"
                                        : "bg-green-500"
                                  }`}
                                  style={{ width: `${Math.min((item.currentStock / item.maxStock) * 100, 100)}%` }}
                                />
                              </div>
                            </div>
                          </div>

                          {/* Action Buttons */}
                          <div className="flex flex-col gap-2 ml-6">
                            <Dialog>
                              <DialogTrigger asChild>
                                <Button
                                  variant="outline"
                                  size="sm"
                                  onClick={() => setSelectedProduct(item)}
                                  className="min-w-[140px]"
                                >
                                  <Edit className="h-4 w-4 mr-1" />
                                  Adjust Stock
                                </Button>
                              </DialogTrigger>
                              <DialogContent className="max-w-md">
                                <DialogHeader>
                                  <DialogTitle>Adjust Inventory - {selectedProduct?.name}</DialogTitle>
                                </DialogHeader>

                                {adjustmentComplete ? (
                                  <div className="space-y-4 text-center">
                                    <CheckCircle className="h-12 w-12 text-green-600 mx-auto" />
                                    <div>
                                      <h3 className="font-semibold text-lg">Adjustment Complete!</h3>
                                      <p className="text-sm text-muted-foreground">Stock level updated successfully</p>
                                    </div>
                                    <div className="bg-green-50 p-3 rounded-lg text-sm">
                                      <p>✓ Inventory updated in database</p>
                                      <p>✓ Stock status re-evaluated</p>
                                      <p>✓ Adjustment logged in history</p>
                                    </div>
                                  </div>
                                ) : (
                                  <div className="space-y-4">
                                    {/* Current Stock Info */}
                                    <div className="bg-gray-50 p-3 rounded-lg">
                                      <p className="font-medium">{selectedProduct?.name}</p>
                                      <p className="text-sm text-muted-foreground">
                                        Current Stock:{" "}
                                        <span className="font-bold">{selectedProduct?.currentStock} units</span>
                                      </p>
                                      <p className="text-sm text-muted-foreground">
                                        Min/Max: {selectedProduct?.minStock}/{selectedProduct?.maxStock} units
                                      </p>
                                    </div>

                                    {/* Validation Errors */}
                                    {validationErrors.length > 0 && (
                                      <Alert className="border-red-200 bg-red-50">
                                        <AlertTriangle className="h-4 w-4 text-red-600" />
                                        <AlertDescription className="text-red-800">
                                          <ul className="list-disc list-inside space-y-1">
                                            {validationErrors.map((error, index) => (
                                              <li key={index}>{error}</li>
                                            ))}
                                          </ul>
                                        </AlertDescription>
                                      </Alert>
                                    )}

                                    {/* Adjustment Form */}
                                    <div className="grid grid-cols-2 gap-4">
                                      <div>
                                        <Label htmlFor="adjustmentType">Adjustment Type</Label>
                                        <Select
                                          value={adjustmentData.type}
                                          onValueChange={(value) => {
                                            setAdjustmentData((prev) => ({ ...prev, type: value }))
                                            setValidationErrors([])
                                          }}
                                        >
                                          <SelectTrigger>
                                            <SelectValue />
                                          </SelectTrigger>
                                          <SelectContent>
                                            <SelectItem value="add">Add Stock</SelectItem>
                                            <SelectItem value="remove">Remove Stock</SelectItem>
                                            <SelectItem value="set">Set Stock Level</SelectItem>
                                          </SelectContent>
                                        </Select>
                                      </div>
                                      <div>
                                        <Label htmlFor="quantity">Quantity</Label>
                                        <Input
                                          id="quantity"
                                          type="number"
                                          min="1"
                                          value={adjustmentData.quantity}
                                          onChange={(e) => {
                                            setAdjustmentData((prev) => ({ ...prev, quantity: e.target.value }))
                                            setValidationErrors([])
                                          }}
                                          placeholder="Enter amount"
                                        />
                                      </div>
                                    </div>

                                    {/* New Stock Preview */}
                                    {adjustmentData.quantity && selectedProduct && (
                                      <div className="bg-blue-50 p-3 rounded-lg">
                                        <p className="text-sm font-medium">Preview:</p>
                                        <p className="text-sm">
                                          New Stock Level:{" "}
                                          <span className="font-bold">{calculateNewStock()} units</span>
                                        </p>
                                        <p className="text-sm">
                                          New Status:{" "}
                                          <span className="font-bold capitalize">
                                            {determineNewStatus(calculateNewStock(), selectedProduct).replace("-", " ")}
                                          </span>
                                        </p>
                                      </div>
                                    )}

                                    <div>
                                      <Label htmlFor="reason">Reason for Adjustment *</Label>
                                      <Select
                                        value={adjustmentData.reason}
                                        onValueChange={(value) => {
                                          setAdjustmentData((prev) => ({ ...prev, reason: value }))
                                          setValidationErrors([])
                                        }}
                                      >
                                        <SelectTrigger>
                                          <SelectValue placeholder="Select reason" />
                                        </SelectTrigger>
                                        <SelectContent>
                                          <SelectItem value="restock">Restock from Supplier</SelectItem>
                                          <SelectItem value="damaged">Damaged Goods</SelectItem>
                                          <SelectItem value="expired">Expired Products</SelectItem>
                                          <SelectItem value="theft">Theft/Loss</SelectItem>
                                          <SelectItem value="return">Customer Return</SelectItem>
                                          <SelectItem value="correction">Inventory Correction</SelectItem>
                                          <SelectItem value="transfer">Warehouse Transfer</SelectItem>
                                          <SelectItem value="promotion">Promotional Use</SelectItem>
                                          <SelectItem value="other">Other</SelectItem>
                                        </SelectContent>
                                      </Select>
                                    </div>

                                    <div>
                                      <Label htmlFor="notes">Additional Notes</Label>
                                      <Textarea
                                        id="notes"
                                        value={adjustmentData.notes}
                                        onChange={(e) =>
                                          setAdjustmentData((prev) => ({ ...prev, notes: e.target.value }))
                                        }
                                        placeholder="Optional additional details..."
                                        rows={3}
                                      />
                                    </div>

                                    <Button
                                      onClick={handleAdjustInventory}
                                      disabled={!adjustmentData.quantity || !adjustmentData.reason || isAdjusting}
                                      className="w-full"
                                    >
                                      {isAdjusting ? (
                                        <>
                                          <Clock className="h-4 w-4 mr-2 animate-spin" />
                                          Processing Adjustment...
                                        </>
                                      ) : (
                                        <>
                                          <CheckCircle className="h-4 w-4 mr-2" />
                                          Submit Adjustment
                                        </>
                                      )}
                                    </Button>
                                  </div>
                                )}
                              </DialogContent>
                            </Dialog>

                            <Button variant="outline" size="sm" className="min-w-[140px] bg-transparent">
                              <Clock className="h-4 w-4 mr-1" />
                              View History
                            </Button>
                          </div>
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
