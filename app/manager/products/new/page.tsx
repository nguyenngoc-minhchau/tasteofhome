"use client"

import { useState, useEffect } from "react"
import { useRouter } from "next/navigation"
import Link from "next/link"
import { ArrowLeft, Save, Upload, X, CheckCircle, AlertTriangle, Plus } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Checkbox } from "@/components/ui/checkbox"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Badge } from "@/components/ui/badge"
import { Alert, AlertDescription } from "@/components/ui/alert"

// Initial empty product state
const initialProduct = {
  name: "",
  price: 0,
  category: "",
  country: "",
  stock: 0,
  status: "active",
  description: "",
  image: "/placeholder.svg?height=300&width=300&text=New+Product",
  isOrganic: false,
  isArtisanal: false,
  tags: [],
  weight: "",
  roastLevel: "",
  processing: "",
  altitude: "",
  supplier: "",
  sku: "",
  barcode: "",
}

export default function ManagerAddProductPage() {
  const router = useRouter()
  const [product, setProduct] = useState(initialProduct)
  const [newTag, setNewTag] = useState("")
  const [isSaving, setIsSaving] = useState(false)
  const [saveComplete, setSaveComplete] = useState(false)
  const [validationErrors, setValidationErrors] = useState<string[]>([])
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [userRole, setUserRole] = useState("")
  const [newProductId, setNewProductId] = useState<number | null>(null)

  // Simulate authentication check - Only Manager can add products
  useEffect(() => {
    const checkAuth = () => {
      const role = localStorage.getItem("userRole") || "staff"
      setUserRole(role)
      setIsAuthenticated(role === "manager")
    }
    checkAuth()
  }, [])

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
                You need <strong>Manager</strong> privileges to add new products.
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
            <Link href="/manager/products">
              <Button variant="outline">Back to Products</Button>
            </Link>
          </CardContent>
        </Card>
      </div>
    )
  }

  const validateProductData = () => {
    const errors: string[] = []

    if (!product.name?.trim()) {
      errors.push("Product name is required")
    }

    if (!product.price || product.price <= 0) {
      errors.push("Price must be greater than 0")
    }

    if (!product.category) {
      errors.push("Category is required")
    }

    if (!product.description?.trim()) {
      errors.push("Product description is required")
    }

    if (product.description && product.description.length < 20) {
      errors.push("Description must be at least 20 characters long")
    }

    if (product.stock < 0) {
      errors.push("Stock quantity must be 0 or greater")
    }

    if (!product.sku?.trim()) {
      errors.push("SKU is required")
    }

    // Check for duplicate SKU (in real app, this would be server-side validation)
    const existingSKUs = ["COFFEE-ETH-001", "SALT-HIM-001", "TEA-JPN-001", "CHOC-BEL-001", "HONEY-NZ-001"]
    if (product.sku && existingSKUs.includes(product.sku)) {
      errors.push("SKU already exists. Please choose a different SKU.")
    }

    setValidationErrors(errors)
    return errors.length === 0
  }

  const handleInputChange = (field: string, value: any) => {
    setProduct((prev: any) => ({ ...prev, [field]: value }))
    setValidationErrors([]) // Clear errors when user makes changes
  }

  const handleAddTag = () => {
    if (newTag.trim() && !product.tags?.includes(newTag.trim())) {
      setProduct((prev: any) => ({
        ...prev,
        tags: [...(prev.tags || []), newTag.trim()],
      }))
      setNewTag("")
    }
  }

  const handleRemoveTag = (tagToRemove: string) => {
    setProduct((prev: any) => ({
      ...prev,
      tags: prev.tags?.filter((tag: string) => tag !== tagToRemove) || [],
    }))
  }

  const generateSKU = () => {
    if (product.category && product.country && product.name) {
      const categoryCode = product.category.substring(0, 4).toUpperCase()
      const countryCode = product.country.substring(0, 3).toUpperCase()
      const randomNum = Math.floor(Math.random() * 999) + 1
      const generatedSKU = `${categoryCode}-${countryCode}-${randomNum.toString().padStart(3, "0")}`
      handleInputChange("sku", generatedSKU)
    }
  }

  const handleSave = async () => {
    if (!validateProductData()) {
      return
    }

    setIsSaving(true)

    // Simulate API call to create product
    await new Promise((resolve) => setTimeout(resolve, 2500))

    // Generate new product ID
    const productId = Math.floor(Math.random() * 1000) + 100
    setNewProductId(productId)

    // Create new product object
    const newProduct = {
      ...product,
      id: productId,
      rating: 0,
      reviews: 0,
      totalSold: 0,
      createdAt: new Date().toISOString(),
      createdBy: "Manager User",
      lastModified: new Date().toISOString(),
      modifiedBy: "Manager User",
    }

    console.log("New product created:", newProduct)

    setSaveComplete(true)
    setIsSaving(false)
  }

  if (saveComplete) {
    return (
      <div className="min-h-screen bg-background">
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link
                href="/manager/products"
                className="flex items-center gap-2 text-lg font-semibold hover:text-primary"
              >
                <ArrowLeft className="h-5 w-5" />
                Back to Products
              </Link>
              <h1 className="text-2xl font-bold">Product Created Successfully</h1>
              <Badge variant="secondary">Manager Access</Badge>
            </div>
          </div>
        </header>

        <div className="container mx-auto px-4 py-8">
          <div className="max-w-2xl mx-auto">
            <Card>
              <CardHeader className="text-center">
                <CheckCircle className="h-16 w-16 text-green-600 mx-auto mb-4" />
                <CardTitle className="text-2xl text-green-600">Product Created Successfully!</CardTitle>
                <p className="text-muted-foreground">
                  Your new product has been added to the catalog and is now available.
                </p>
              </CardHeader>
              <CardContent className="space-y-6">
                {/* New Product Summary */}
                <div className="bg-gray-50 p-4 rounded-lg">
                  <div className="flex items-center gap-4 mb-3">
                    <img
                      src={product.image || "/placeholder.svg"}
                      alt={product.name}
                      className="w-16 h-16 object-cover rounded-md"
                    />
                    <div>
                      <h3 className="font-semibold text-lg">{product.name}</h3>
                      <p className="text-2xl font-bold text-green-600">${product.price}</p>
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-3 text-sm">
                    <div>
                      <span className="font-medium text-muted-foreground">Product ID:</span>
                      <span className="ml-2">#{newProductId}</span>
                    </div>
                    <div>
                      <span className="font-medium text-muted-foreground">Stock:</span>
                      <span className="ml-2">{product.stock} units</span>
                    </div>
                    <div>
                      <span className="font-medium text-muted-foreground">Category:</span>
                      <span className="ml-2">{product.category}</span>
                    </div>
                    <div>
                      <span className="font-medium text-muted-foreground">Status:</span>
                      <span className="ml-2 capitalize">{product.status}</span>
                    </div>
                    <div>
                      <span className="font-medium text-muted-foreground">SKU:</span>
                      <span className="ml-2 font-mono">{product.sku}</span>
                    </div>
                    <div>
                      <span className="font-medium text-muted-foreground">Country:</span>
                      <span className="ml-2">{product.country}</span>
                    </div>
                  </div>

                  {product.tags && product.tags.length > 0 && (
                    <div className="mt-3">
                      <span className="font-medium text-muted-foreground text-sm">Tags:</span>
                      <div className="flex flex-wrap gap-1 mt-1">
                        {product.tags.map((tag: string) => (
                          <Badge key={tag} variant="secondary" className="text-xs">
                            {tag}
                          </Badge>
                        ))}
                      </div>
                    </div>
                  )}
                </div>

                {/* System Confirmation */}
                <div className="space-y-2 text-sm text-muted-foreground">
                  <div className="flex items-center gap-2">
                    <CheckCircle className="h-4 w-4 text-green-600" />
                    <span>Product record created in database</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <CheckCircle className="h-4 w-4 text-green-600" />
                    <span>Product added to search index</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <CheckCircle className="h-4 w-4 text-green-600" />
                    <span>Inventory system updated</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <CheckCircle className="h-4 w-4 text-green-600" />
                    <span>Product visible on storefront</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <CheckCircle className="h-4 w-4 text-green-600" />
                    <span>Creation logged for audit trail</span>
                  </div>
                </div>

                {/* Action Buttons */}
                <div className="flex gap-3">
                  <Link href="/manager/products" className="flex-1">
                    <Button className="w-full">Back to Product List</Button>
                  </Link>
                  <Link href={`/product/${newProductId}`} className="flex-1">
                    <Button variant="outline" className="w-full bg-transparent">
                      View Product
                    </Button>
                  </Link>
                </div>

                {/* Additional Actions */}
                <div className="pt-4 border-t">
                  <p className="text-sm text-muted-foreground mb-3">Next Steps:</p>
                  <div className="flex gap-2 flex-wrap">
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => {
                        setSaveComplete(false)
                        setProduct(initialProduct)
                        setNewProductId(null)
                      }}
                    >
                      <Plus className="h-4 w-4 mr-1" />
                      Add Another Product
                    </Button>
                    <Link href={`/manager/products/${newProductId}/edit`}>
                      <Button variant="outline" size="sm">
                        Edit Product
                      </Button>
                    </Link>
                    <Button variant="outline" size="sm">
                      Upload Images
                    </Button>
                    <Button variant="outline" size="sm">
                      Set Up Promotions
                    </Button>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/manager/products" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Products
            </Link>
            <div className="text-center">
              <h1 className="text-2xl font-bold">Add New Product</h1>
              <p className="text-sm text-muted-foreground">Create a new product for your catalog</p>
            </div>
            <Badge variant="secondary">Manager Access</Badge>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-6xl mx-auto grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Product Form */}
          <div className="lg:col-span-2 space-y-6">
            {/* Validation Errors */}
            {validationErrors.length > 0 && (
              <Alert className="border-red-200 bg-red-50">
                <AlertTriangle className="h-4 w-4 text-red-600" />
                <AlertDescription className="text-red-800">
                  <p className="font-medium mb-2">Please fix the following errors:</p>
                  <ul className="list-disc list-inside space-y-1">
                    {validationErrors.map((error, index) => (
                      <li key={index}>{error}</li>
                    ))}
                  </ul>
                </AlertDescription>
              </Alert>
            )}

            {/* Basic Information */}
            <Card>
              <CardHeader>
                <CardTitle>Basic Information</CardTitle>
                <p className="text-sm text-muted-foreground">Core product details and pricing information</p>
              </CardHeader>
              <CardContent className="space-y-4">
                <div>
                  <Label htmlFor="name">Product Name *</Label>
                  <Input
                    id="name"
                    value={product.name}
                    onChange={(e) => handleInputChange("name", e.target.value)}
                    placeholder="Enter product name"
                    className={validationErrors.some((e) => e.includes("name")) ? "border-red-500" : ""}
                  />
                </div>

                <div>
                  <Label htmlFor="description">Product Description *</Label>
                  <Textarea
                    id="description"
                    rows={4}
                    value={product.description}
                    onChange={(e) => handleInputChange("description", e.target.value)}
                    placeholder="Detailed product description (minimum 20 characters)"
                    className={validationErrors.some((e) => e.includes("description")) ? "border-red-500" : ""}
                  />
                  <p className="text-xs text-muted-foreground mt-1">{product.description.length} characters</p>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <Label htmlFor="price">Price ($) *</Label>
                    <Input
                      id="price"
                      type="number"
                      step="0.01"
                      min="0"
                      value={product.price || ""}
                      onChange={(e) => handleInputChange("price", Number.parseFloat(e.target.value) || 0)}
                      placeholder="0.00"
                      className={validationErrors.some((e) => e.includes("Price")) ? "border-red-500" : ""}
                    />
                  </div>
                  <div>
                    <Label htmlFor="stock">Initial Stock Quantity *</Label>
                    <Input
                      id="stock"
                      type="number"
                      min="0"
                      value={product.stock || ""}
                      onChange={(e) => handleInputChange("stock", Number.parseInt(e.target.value) || 0)}
                      placeholder="0"
                      className={validationErrors.some((e) => e.includes("Stock")) ? "border-red-500" : ""}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <Label htmlFor="sku">SKU *</Label>
                    <div className="flex gap-2">
                      <Input
                        id="sku"
                        value={product.sku}
                        onChange={(e) => handleInputChange("sku", e.target.value)}
                        placeholder="Product SKU"
                        className={validationErrors.some((e) => e.includes("SKU")) ? "border-red-500" : ""}
                      />
                      <Button
                        type="button"
                        variant="outline"
                        onClick={generateSKU}
                        disabled={!product.category || !product.country}
                        title="Generate SKU based on category and country"
                      >
                        Generate
                      </Button>
                    </div>
                    <p className="text-xs text-muted-foreground mt-1">
                      {!product.category || !product.country
                        ? "Select category and country to auto-generate SKU"
                        : "Click Generate to create SKU automatically"}
                    </p>
                  </div>
                  <div>
                    <Label htmlFor="barcode">Barcode</Label>
                    <Input
                      id="barcode"
                      value={product.barcode}
                      onChange={(e) => handleInputChange("barcode", e.target.value)}
                      placeholder="Product barcode (optional)"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <Label htmlFor="category">Category *</Label>
                    <Select value={product.category} onValueChange={(value) => handleInputChange("category", value)}>
                      <SelectTrigger
                        className={validationErrors.some((e) => e.includes("Category")) ? "border-red-500" : ""}
                      >
                        <SelectValue placeholder="Select category" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="Coffee">Coffee</SelectItem>
                        <SelectItem value="Tea">Tea</SelectItem>
                        <SelectItem value="Spices">Spices</SelectItem>
                        <SelectItem value="Chocolate">Chocolate</SelectItem>
                        <SelectItem value="Honey">Honey</SelectItem>
                        <SelectItem value="Essential Oils">Essential Oils</SelectItem>
                        <SelectItem value="Condiments">Condiments</SelectItem>
                        <SelectItem value="Grains">Grains</SelectItem>
                        <SelectItem value="Nuts">Nuts</SelectItem>
                        <SelectItem value="Dried Fruits">Dried Fruits</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="country">Country of Origin</Label>
                    <Select value={product.country} onValueChange={(value) => handleInputChange("country", value)}>
                      <SelectTrigger>
                        <SelectValue placeholder="Select country" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="Ethiopia">Ethiopia</SelectItem>
                        <SelectItem value="Colombia">Colombia</SelectItem>
                        <SelectItem value="Brazil">Brazil</SelectItem>
                        <SelectItem value="India">India</SelectItem>
                        <SelectItem value="China">China</SelectItem>
                        <SelectItem value="Japan">Japan</SelectItem>
                        <SelectItem value="Pakistan">Pakistan</SelectItem>
                        <SelectItem value="Belgium">Belgium</SelectItem>
                        <SelectItem value="Switzerland">Switzerland</SelectItem>
                        <SelectItem value="New Zealand">New Zealand</SelectItem>
                        <SelectItem value="France">France</SelectItem>
                        <SelectItem value="Italy">Italy</SelectItem>
                        <SelectItem value="Spain">Spain</SelectItem>
                        <SelectItem value="Turkey">Turkey</SelectItem>
                        <SelectItem value="Morocco">Morocco</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <Label htmlFor="status">Product Status</Label>
                    <Select value={product.status} onValueChange={(value) => handleInputChange("status", value)}>
                      <SelectTrigger>
                        <SelectValue placeholder="Select status" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="active">Active</SelectItem>
                        <SelectItem value="inactive">Inactive</SelectItem>
                        <SelectItem value="coming-soon">Coming Soon</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="supplier">Supplier</Label>
                    <Input
                      id="supplier"
                      value={product.supplier}
                      onChange={(e) => handleInputChange("supplier", e.target.value)}
                      placeholder="Supplier name (optional)"
                    />
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Product Attributes */}
            <Card>
              <CardHeader>
                <CardTitle>Product Attributes</CardTitle>
                <p className="text-sm text-muted-foreground">Additional product characteristics and tags</p>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="flex items-center space-x-6">
                  <div className="flex items-center space-x-2">
                    <Checkbox
                      id="organic"
                      checked={product.isOrganic}
                      onCheckedChange={(checked) => handleInputChange("isOrganic", checked)}
                    />
                    <Label htmlFor="organic">Organic Certified</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <Checkbox
                      id="artisanal"
                      checked={product.isArtisanal}
                      onCheckedChange={(checked) => handleInputChange("isArtisanal", checked)}
                    />
                    <Label htmlFor="artisanal">Artisanal Product</Label>
                  </div>
                </div>

                <div>
                  <Label>Product Tags</Label>
                  <div className="flex flex-wrap gap-2 mb-3">
                    {product.tags.map((tag: string) => (
                      <Badge key={tag} variant="secondary" className="flex items-center gap-1">
                        {tag}
                        <button
                          onClick={() => handleRemoveTag(tag)}
                          className="ml-1 hover:text-red-600 transition-colors"
                          type="button"
                        >
                          <X className="h-3 w-3" />
                        </button>
                      </Badge>
                    ))}
                  </div>
                  <div className="flex gap-2">
                    <Input
                      placeholder="Add new tag"
                      value={newTag}
                      onChange={(e) => setNewTag(e.target.value)}
                      onKeyPress={(e) => e.key === "Enter" && (e.preventDefault(), handleAddTag())}
                    />
                    <Button type="button" onClick={handleAddTag} variant="outline">
                      Add Tag
                    </Button>
                  </div>
                  <p className="text-xs text-muted-foreground mt-1">
                    Add tags like "fair-trade", "single-origin", "gluten-free", etc.
                  </p>
                </div>

                {/* Category-specific fields */}
                {product.category === "Coffee" && (
                  <div className="grid grid-cols-2 gap-4 pt-4 border-t">
                    <div>
                      <Label htmlFor="weight">Weight</Label>
                      <Input
                        id="weight"
                        value={product.weight}
                        onChange={(e) => handleInputChange("weight", e.target.value)}
                        placeholder="e.g., 12 oz (340g)"
                      />
                    </div>
                    <div>
                      <Label htmlFor="roastLevel">Roast Level</Label>
                      <Select
                        value={product.roastLevel}
                        onValueChange={(value) => handleInputChange("roastLevel", value)}
                      >
                        <SelectTrigger>
                          <SelectValue placeholder="Select roast level" />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="Light">Light Roast</SelectItem>
                          <SelectItem value="Medium">Medium Roast</SelectItem>
                          <SelectItem value="Medium-Dark">Medium-Dark Roast</SelectItem>
                          <SelectItem value="Dark">Dark Roast</SelectItem>
                        </SelectContent>
                      </Select>
                    </div>
                    <div>
                      <Label htmlFor="processing">Processing Method</Label>
                      <Input
                        id="processing"
                        value={product.processing}
                        onChange={(e) => handleInputChange("processing", e.target.value)}
                        placeholder="e.g., Washed, Natural"
                      />
                    </div>
                    <div>
                      <Label htmlFor="altitude">Growing Altitude</Label>
                      <Input
                        id="altitude"
                        value={product.altitude}
                        onChange={(e) => handleInputChange("altitude", e.target.value)}
                        placeholder="e.g., 1,800-2,200m"
                      />
                    </div>
                  </div>
                )}
              </CardContent>
            </Card>
          </div>

          {/* Product Preview & Actions */}
          <div className="lg:col-span-1">
            <Card className="sticky top-4">
              <CardHeader>
                <CardTitle>Product Preview</CardTitle>
                <p className="text-sm text-muted-foreground">Live preview of your new product</p>
              </CardHeader>
              <CardContent className="space-y-4">
                {/* Product Image */}
                <div className="aspect-square relative overflow-hidden rounded-lg border bg-gray-50">
                  <img
                    src={product.image || "/placeholder.svg"}
                    alt={product.name || "New Product"}
                    className="w-full h-full object-cover"
                  />
                  <Button
                    variant="outline"
                    size="sm"
                    className="absolute bottom-2 right-2 bg-white/90 backdrop-blur-sm"
                  >
                    <Upload className="h-4 w-4 mr-1" />
                    Upload Image
                  </Button>
                </div>

                {/* Product Details */}
                <div className="space-y-3">
                  <h3 className="font-semibold text-lg line-clamp-2">{product.name || "Product Name"}</h3>

                  <p className="text-2xl font-bold text-green-600">${product.price?.toFixed(2) || "0.00"}</p>

                  <div className="flex flex-wrap gap-2">
                    {product.category && <Badge variant="outline">{product.category}</Badge>}
                    {product.country && <Badge variant="outline">{product.country}</Badge>}
                    <Badge
                      className={
                        product.status === "active"
                          ? "bg-green-500"
                          : product.status === "inactive"
                            ? "bg-gray-500"
                            : "bg-blue-500"
                      }
                    >
                      {product.status}
                    </Badge>
                  </div>

                  <div className="text-sm space-y-1">
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Initial Stock:</span>
                      <span className={product.stock > 0 ? "text-green-600" : "text-gray-600"}>
                        {product.stock} units
                      </span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">SKU:</span>
                      <span className="font-mono text-xs">{product.sku || "Not set"}</span>
                    </div>
                  </div>

                  {product.description && (
                    <p className="text-sm text-muted-foreground line-clamp-3">{product.description}</p>
                  )}
                </div>

                {/* Attribute Badges */}
                <div className="flex flex-wrap gap-1">
                  {product.isOrganic && <Badge className="bg-green-500 text-xs">Organic</Badge>}
                  {product.isArtisanal && <Badge className="bg-purple-500 text-xs">Artisanal</Badge>}
                  {product.tags.map((tag: string) => (
                    <Badge key={tag} variant="secondary" className="text-xs">
                      {tag}
                    </Badge>
                  ))}
                </div>

                {/* Create Button */}
                <div className="pt-4 space-y-3">
                  <Button
                    onClick={handleSave}
                    disabled={isSaving || validationErrors.length > 0}
                    className="w-full"
                    size="lg"
                  >
                    <Save className="h-4 w-4 mr-2" />
                    {isSaving ? "Creating Product..." : "Create Product"}
                  </Button>

                  <div className="flex gap-2">
                    <Button
                      variant="outline"
                      size="sm"
                      className="flex-1 bg-transparent"
                      onClick={() => setProduct(initialProduct)}
                    >
                      Reset Form
                    </Button>
                    <Button variant="outline" size="sm" className="flex-1 bg-transparent">
                      Save Draft
                    </Button>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
