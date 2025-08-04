"use client"

import { useState, useEffect } from "react"
import Link from "next/link"
import { ArrowLeft, Search, Plus, Edit, Trash2, Eye, Package, Star, MoreHorizontal, AlertTriangle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Badge } from "@/components/ui/badge"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"

// Mock product data for manager management
const managerProducts = [
  {
    id: 1,
    name: "Premium Ethiopian Coffee Beans",
    price: 24.99,
    category: "Coffee",
    country: "Ethiopia",
    stock: 45,
    status: "active",
    rating: 4.8,
    reviews: 127,
    totalSold: 2847,
    image: "/placeholder.svg?height=80&width=80&text=Coffee",
    isOrganic: true,
    isArtisanal: true,
    tags: ["single-origin", "medium-roast"],
  },
  {
    id: 2,
    name: "Himalayan Pink Salt",
    price: 12.5,
    category: "Spices",
    country: "Pakistan",
    stock: 78,
    status: "active",
    rating: 4.6,
    reviews: 89,
    totalSold: 1234,
    image: "/placeholder.svg?height=80&width=80&text=Salt",
    isOrganic: true,
    isArtisanal: false,
    tags: ["mineral-rich", "unrefined"],
  },
  {
    id: 3,
    name: "Organic Green Tea",
    price: 18.75,
    category: "Tea",
    country: "Japan",
    stock: 23,
    status: "low-stock",
    rating: 4.9,
    reviews: 203,
    totalSold: 1567,
    image: "/placeholder.svg?height=80&width=80&text=Tea",
    isOrganic: true,
    isArtisanal: true,
    tags: ["ceremonial-grade", "matcha"],
  },
  {
    id: 4,
    name: "Artisan Dark Chocolate",
    price: 32.0,
    category: "Chocolate",
    country: "Belgium",
    stock: 0,
    status: "out-of-stock",
    rating: 4.7,
    reviews: 156,
    totalSold: 892,
    image: "/placeholder.svg?height=80&width=80&text=Chocolate",
    isOrganic: false,
    isArtisanal: true,
    tags: ["70%-cacao", "fair-trade"],
  },
  {
    id: 5,
    name: "Wild Honey",
    price: 28.99,
    category: "Honey",
    country: "New Zealand",
    stock: 67,
    status: "active",
    rating: 4.8,
    reviews: 94,
    totalSold: 445,
    image: "/placeholder.svg?height=80&width=80&text=Honey",
    isOrganic: true,
    isArtisanal: true,
    tags: ["raw", "manuka"],
  },
]

const statusColors = {
  active: "bg-green-500",
  "low-stock": "bg-yellow-500",
  "out-of-stock": "bg-red-500",
  inactive: "bg-gray-500",
}

export default function ManagerProductsPage() {
  const [searchQuery, setSearchQuery] = useState("")
  const [selectedCategory, setSelectedCategory] = useState("all")
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [userRole, setUserRole] = useState("")

  // Simulate authentication check - Only Manager can access
  useEffect(() => {
    const checkAuth = () => {
      const role = localStorage.getItem("userRole") || "staff"
      setUserRole(role)
      setIsAuthenticated(role === "manager")
    }
    checkAuth()
  }, [])

  const filteredProducts = managerProducts.filter((product) => {
    const matchesSearch =
      product.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      product.category.toLowerCase().includes(searchQuery.toLowerCase()) ||
      product.country.toLowerCase().includes(searchQuery.toLowerCase())

    const matchesCategory = selectedCategory === "all" || product.category === selectedCategory

    return matchesSearch && matchesCategory
  })

  const stats = {
    totalProducts: managerProducts.length,
    activeProducts: managerProducts.filter((p) => p.status === "active").length,
    lowStockProducts: managerProducts.filter((p) => p.status === "low-stock").length,
    outOfStockProducts: managerProducts.filter((p) => p.status === "out-of-stock").length,
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
                You need <strong>Manager</strong> privileges to access Product Management.
              </p>
              <p className="text-sm text-muted-foreground">Current role: {userRole || "Not authenticated"}</p>
            </div>
            <div className="space-y-2">
              <p className="text-sm text-muted-foreground">For demo purposes, you can simulate Manager role:</p>
              <Button
                onClick={() => {
                  localStorage.setItem("userRole", "manager")
                  window.location.reload()
                }}
              >
                Login as Manager
              </Button>
            </div>
            <Link href="/manager">
              <Button variant="outline">Back to Manager Dashboard</Button>
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
              <Link href="/manager" className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-2">
                <ArrowLeft className="h-5 w-5" />
                Back to Manager Dashboard
              </Link>
              <h1 className="text-2xl font-bold">Product Management</h1>
              <p className="text-muted-foreground">Manage your product catalog</p>
            </div>
            <div className="flex items-center gap-4">
              <Badge variant="secondary">Manager Access</Badge>
              <Link href="/manager/products/new">
                <Button>
                  <Plus className="h-4 w-4 mr-2" />
                  Add Product
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Products</CardTitle>
              <Package className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stats.totalProducts}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Active Products</CardTitle>
              <Package className="h-4 w-4 text-green-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-green-600">{stats.activeProducts}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Low Stock</CardTitle>
              <Package className="h-4 w-4 text-yellow-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-yellow-600">{stats.lowStockProducts}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Out of Stock</CardTitle>
              <Package className="h-4 w-4 text-red-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-red-600">{stats.outOfStockProducts}</div>
            </CardContent>
          </Card>
        </div>

        {/* Product Management */}
        <Card>
          <CardHeader>
            <CardTitle>Product Catalog</CardTitle>
          </CardHeader>
          <CardContent>
            {/* Search and Filters */}
            <div className="flex gap-4 mb-6">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-4 w-4" />
                <Input
                  placeholder="Search products by name, category, or country..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-10"
                />
              </div>
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="px-3 py-2 border rounded-md"
              >
                <option value="all">All Categories</option>
                <option value="Coffee">Coffee</option>
                <option value="Tea">Tea</option>
                <option value="Spices">Spices</option>
                <option value="Chocolate">Chocolate</option>
                <option value="Honey">Honey</option>
              </select>
            </div>

            {/* Products Table */}
            <div className="space-y-4">
              {filteredProducts.length === 0 ? (
                <div className="text-center py-8">
                  <p className="text-muted-foreground">No products found matching your criteria</p>
                </div>
              ) : (
                filteredProducts.map((product) => (
                  <Card key={product.id} className="hover:shadow-md transition-shadow">
                    <CardContent className="p-6">
                      <div className="flex items-center gap-4">
                        <img
                          src={product.image || "/placeholder.svg"}
                          alt={product.name}
                          className="w-16 h-16 object-cover rounded-md"
                        />

                        <div className="flex-1 space-y-2">
                          <div className="flex items-start justify-between">
                            <div>
                              <h3 className="font-semibold text-lg">{product.name}</h3>
                              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                                <span>{product.category}</span>
                                <span>•</span>
                                <span>{product.country}</span>
                              </div>
                            </div>
                            <div className="text-right">
                              <p className="text-2xl font-bold">${product.price}</p>
                              <Badge className={statusColors[product.status as keyof typeof statusColors]}>
                                {product.status.replace("-", " ").toUpperCase()}
                              </Badge>
                            </div>
                          </div>

                          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
                            <div>
                              <span className="font-medium">Stock:</span>
                              <span className={`ml-1 ${product.stock < 25 ? "text-red-600" : "text-green-600"}`}>
                                {product.stock} units
                              </span>
                            </div>
                            <div>
                              <span className="font-medium">Rating:</span>
                              <span className="ml-1 flex items-center">
                                <Star className="h-3 w-3 fill-yellow-400 text-yellow-400 mr-1" />
                                {product.rating} ({product.reviews})
                              </span>
                            </div>
                            <div>
                              <span className="font-medium">Sold:</span>
                              <span className="ml-1">{product.totalSold.toLocaleString()}</span>
                            </div>
                            <div>
                              <span className="font-medium">Revenue:</span>
                              <span className="ml-1">${(product.totalSold * product.price).toLocaleString()}</span>
                            </div>
                          </div>

                          <div className="flex items-center gap-2">
                            {product.isOrganic && (
                              <Badge variant="outline" className="text-green-600">
                                Organic
                              </Badge>
                            )}
                            {product.isArtisanal && (
                              <Badge variant="outline" className="text-purple-600">
                                Artisanal
                              </Badge>
                            )}
                            {product.tags.map((tag) => (
                              <Badge key={tag} variant="secondary" className="text-xs">
                                {tag}
                              </Badge>
                            ))}
                          </div>
                        </div>

                        <div className="flex flex-col gap-2">
                          <Link href={`/manager/products/${product.id}/edit`}>
                            <Button variant="outline" size="sm">
                              <Edit className="h-4 w-4 mr-1" />
                              Edit
                            </Button>
                          </Link>
                          <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                              <Button variant="outline" size="sm">
                                <MoreHorizontal className="h-4 w-4" />
                              </Button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent>
                              <DropdownMenuItem>
                                <Link href={`/product/${product.id}`} className="w-full flex items-center">
                                  <Eye className="h-4 w-4 mr-2" />
                                  View Product
                                </Link>
                              </DropdownMenuItem>
                              <DropdownMenuItem>
                                <Package className="h-4 w-4 mr-2" />
                                Update Stock
                              </DropdownMenuItem>
                              <DropdownMenuItem className="text-red-600">
                                <Trash2 className="h-4 w-4 mr-2" />
                                Delete Product
                              </DropdownMenuItem>
                            </DropdownMenuContent>
                          </DropdownMenu>
                        </div>
                      </div>
                    </CardContent>
                  </Card>
                ))
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
