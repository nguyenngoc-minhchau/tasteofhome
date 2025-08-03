"use client"

import { useState, useEffect } from "react"
import { useParams, useRouter } from "next/navigation"
import Link from "next/link"
import {
  ArrowLeft,
  Heart,
  Share2,
  Star,
  ShoppingCart,
  Plus,
  Minus,
  Eye,
  TrendingUp,
  Package,
  Shield,
  Truck,
  Loader2,
  CheckCircle,
} from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Separator } from "@/components/ui/separator"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { useCart } from "@/contexts/cart-context"

// Extended mock product data with detailed information
const detailedProducts = [
  {
    id: 1,
    name: "Premium Ethiopian Coffee Beans",
    price: 24.99,
    originalPrice: 29.99,
    category: "Coffee",
    country: "Ethiopia",
    tags: ["single-origin", "medium-roast"],
    isOrganic: true,
    isArtisanal: true,
    rating: 4.8,
    reviews: 127,
    totalSold: 2847,
    views: 15623,
    stock: 45,
    images: [
      "/placeholder.svg?height=500&width=500&text=Coffee+Beans+Main",
      "/placeholder.svg?height=500&width=500&text=Coffee+Beans+Close",
      "/placeholder.svg?height=500&width=500&text=Coffee+Beans+Package",
      "/placeholder.svg?height=500&width=500&text=Coffee+Beans+Origin",
    ],
    description:
      "Sourced directly from the highlands of Ethiopia, these premium coffee beans offer a rich, complex flavor profile with notes of chocolate and citrus. Hand-picked at peak ripeness and carefully processed to preserve their unique characteristics.",
    features: [
      "Single-origin from Yirgacheffe region",
      "Medium roast for balanced flavor",
      "Organic certified",
      "Fair trade sourced",
      "Freshly roasted to order",
    ],
    specifications: {
      Weight: "12 oz (340g)",
      "Roast Level": "Medium",
      Processing: "Washed",
      Altitude: "1,800-2,200m",
      Harvest: "October - December",
      "Caffeine Content": "Medium",
    },
    shippingInfo: "Free shipping on orders over $25. Ships within 1-2 business days.",
    returnPolicy: "30-day money-back guarantee",
  },
  {
    id: 2,
    name: "Himalayan Pink Salt",
    price: 12.5,
    originalPrice: 15.99,
    category: "Spices",
    country: "Pakistan",
    tags: ["mineral-rich", "unrefined"],
    isOrganic: true,
    isArtisanal: false,
    rating: 4.6,
    reviews: 89,
    totalSold: 1234,
    views: 8945,
    stock: 78,
    images: [
      "/placeholder.svg?height=500&width=500&text=Pink+Salt+Main",
      "/placeholder.svg?height=500&width=500&text=Pink+Salt+Crystals",
      "/placeholder.svg?height=500&width=500&text=Pink+Salt+Package",
    ],
    description:
      "Pure Himalayan pink salt harvested from ancient sea beds in the Punjab region of Pakistan. Rich in minerals and free from additives, this salt adds a subtle, complex flavor to any dish.",
    features: [
      "Hand-mined from ancient deposits",
      "Rich in 84 trace minerals",
      "No additives or anti-caking agents",
      "Coarse grain texture",
      "Naturally pink color",
    ],
    specifications: {
      Weight: "1 lb (454g)",
      "Grain Size": "Coarse",
      Purity: "99.5%",
      Source: "Khewra Salt Mine",
      Color: "Natural Pink",
      "Shelf Life": "Indefinite",
    },
    shippingInfo: "Standard shipping available. Ships within 2-3 business days.",
    returnPolicy: "30-day satisfaction guarantee",
  },
]

// Mock related products
const relatedProducts = [
  {
    id: 3,
    name: "Organic Green Tea",
    price: 18.75,
    rating: 4.9,
    reviews: 203,
    image: "/placeholder.svg?height=200&width=200&text=Green+Tea",
  },
  {
    id: 4,
    name: "Artisan Dark Chocolate",
    price: 32.0,
    rating: 4.7,
    reviews: 156,
    image: "/placeholder.svg?height=200&width=200&text=Dark+Chocolate",
  },
  {
    id: 5,
    name: "Wild Honey",
    price: 28.99,
    rating: 4.8,
    reviews: 94,
    image: "/placeholder.svg?height=200&width=200&text=Wild+Honey",
  },
  {
    id: 6,
    name: "Basmati Rice",
    price: 15.25,
    rating: 4.5,
    reviews: 78,
    image: "/placeholder.svg?height=200&width=200&text=Basmati+Rice",
  },
]

export default function ProductDetailPage() {
  const params = useParams()
  const router = useRouter()
  const productId = Number.parseInt(params.id as string)

  const [product, setProduct] = useState(detailedProducts.find((p) => p.id === productId))
  const [selectedImage, setSelectedImage] = useState(0)
  const [quantity, setQuantity] = useState(1)
  const [isWishlisted, setIsWishlisted] = useState(false)
  const [viewsIncremented, setViewsIncremented] = useState(false)

  const { state: cartState, dispatch: cartDispatch } = useCart()
  const [isLoading, setIsLoading] = useState(false)
  const [isAdded, setIsAdded] = useState(false)


  // Simulate incrementing view count when page loads
  useEffect(() => {
    if (product && !viewsIncremented) {
      // Simulate API call to increment views
      setTimeout(() => {
        setProduct((prev) => (prev ? { ...prev, views: prev.views + 1 } : prev))
        setViewsIncremented(true)
      }, 500)
    }
  }, [product, viewsIncremented])

  if (!product) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Product Not Found</h1>
          <Link href="/">
            <Button>Return to Shop</Button>
          </Link>
        </div>
      </div>
    )
  }

  const handleQuantityChange = (change: number) => {
    const newQuantity = quantity + change
    if (newQuantity >= 1 && newQuantity <= product.stock) {
      setQuantity(newQuantity)
    }
  }

  const handleAddToCart = () => {
    setIsLoading(true)
    cartDispatch({
      type: "ADD_ITEM",
      payload: {
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: quantity,
        image: product.images[0],
        category: product.category,
        stock: product.stock,
      },
    })
    setTimeout(() => {
      setIsLoading(false)
      setIsAdded(true)
      setTimeout(() => setIsAdded(false), 700)
    }, 700) // spinner 

    // Show success message or redirect
    console.log(`Added ${quantity} x ${product.name} to cart`)
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Shop
            </Link>
            <h1 className="text-2xl font-bold">Artisan Market</h1>
            <div className="flex items-center gap-4">
              <Button variant="ghost" size="icon">
                <Heart className="h-5 w-5" />
              </Button>
              <Link href="/cart">
                <Button variant="ghost" size="icon" className="relative">
                  <ShoppingCart className="h-5 w-5" />
                  {cartState.itemCount > 0 && (
                    <Badge className="absolute -top-2 -right-2 h-5 w-5 rounded-full p-0 flex items-center justify-center text-xs">
                      {cartState.itemCount}
                    </Badge>
                  )}
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
          {/* Product Images */}
          <div className="space-y-4">
            <div className="aspect-square relative overflow-hidden rounded-lg border">
              <img
                src={product.images[selectedImage] || "/placeholder.svg"}
                alt={product.name}
                className="w-full h-full object-cover"
              />
              <div className="absolute top-4 left-4 flex flex-col gap-2">
                {product.isOrganic && <Badge className="bg-green-500">Organic</Badge>}
                {product.isArtisanal && <Badge className="bg-purple-500">Artisanal</Badge>}
              </div>
              {product.originalPrice > product.price && (
                <Badge className="absolute top-4 right-4 bg-red-500">
                  Save ${(product.originalPrice - product.price).toFixed(2)}
                </Badge>
              )}
            </div>

            {/* Image Thumbnails */}
            <div className="flex gap-2 overflow-x-auto">
              {product.images.map((image, index) => (
                <button
                  key={index}
                  onClick={() => setSelectedImage(index)}
                  className={`flex-shrink-0 w-20 h-20 rounded-md overflow-hidden border-2 ${
                    selectedImage === index ? "border-primary" : "border-gray-200"
                  }`}
                >
                  <img
                    src={image || "/placeholder.svg"}
                    alt={`${product.name} ${index + 1}`}
                    className="w-full h-full object-cover"
                  />
                </button>
              ))}
            </div>
          </div>

          {/* Product Information */}
          <div className="space-y-6">
            <div>
              <div className="flex items-center gap-2 text-sm text-muted-foreground mb-2">
                <span>{product.category}</span>
                <span>•</span>
                <span>{product.country}</span>
              </div>
              <h1 className="text-3xl font-bold mb-4">{product.name}</h1>

              {/* Rating and Stats */}
              <div className="flex items-center gap-6 mb-4">
                <div className="flex items-center gap-2">
                  <div className="flex items-center">
                    <Star className="h-5 w-5 fill-yellow-400 text-yellow-400" />
                    <span className="font-semibold ml-1">{product.rating}</span>
                  </div>
                  <span className="text-muted-foreground">({product.reviews} reviews)</span>
                </div>
                <div className="flex items-center gap-1 text-muted-foreground">
                  <TrendingUp className="h-4 w-4" />
                  <span className="text-sm">{product.totalSold.toLocaleString()} sold</span>
                </div>
                <div className="flex items-center gap-1 text-muted-foreground">
                  <Eye className="h-4 w-4" />
                  <span className="text-sm">{product.views.toLocaleString()} views</span>
                </div>
              </div>

              {/* Price */}
              <div className="flex items-center gap-3 mb-6">
                <span className="text-3xl font-bold">${product.price}</span>
                {product.originalPrice > product.price && (
                  <span className="text-xl text-muted-foreground line-through">${product.originalPrice}</span>
                )}
              </div>

              {/* Stock Status */}
              <div className="flex items-center gap-2 mb-6">
                <Package className="h-4 w-4 text-green-600" />
                <span className="text-green-600 font-medium">
                  {product.stock > 10 ? "In Stock" : `Only ${product.stock} left in stock`}
                </span>
              </div>
            </div>

            {/* Tags */}
            <div className="flex flex-wrap gap-2">
              {product.tags.map((tag) => (
                <Badge key={tag} variant="secondary">
                  {tag}
                </Badge>
              ))}
            </div>

            {/* Quantity and Add to Cart */}
            <div className="space-y-4">
              <div className="flex items-center gap-4">
                <span className="font-medium">Quantity:</span>
                <div className="flex items-center border rounded-md">
                  <Button
                    variant="ghost"
                    size="icon"
                    onClick={() => handleQuantityChange(-1)}
                    disabled={quantity <= 1}
                    className="h-10 w-10"
                  >
                    <Minus className="h-4 w-4" />
                  </Button>
                  <span className="px-4 py-2 min-w-[3rem] text-center">{quantity}</span>
                  <Button
                    variant="ghost"
                    size="icon"
                    onClick={() => handleQuantityChange(1)}
                    disabled={quantity >= product.stock}
                    className="h-10 w-10"
                  >
                    <Plus className="h-4 w-4" />
                  </Button>
                </div>
              </div>

              <div className="flex gap-3">
                <Button
                  onClick={handleAddToCart}
                  disabled={isLoading || isAdded}
                  className="w-full flex items-center justify-center gap-2 transition-all duration-300"
                >
                  {isLoading ? (
                    <Loader2 className="h-5 w-5 animate-spin" />
                  ) : isAdded ? (
                    <>
                      <CheckCircle className="h-5 w-5 text-green-600" />
                      Added – ${(product.price * quantity).toFixed(2)}
                    </>
                  ) : (
                    <>
                      Add to Cart – ${(product.price * quantity).toFixed(2)}
                    </>
                  )}
                </Button>
                <Button
                  variant="outline"
                  size="lg"
                  onClick={() => setIsWishlisted(!isWishlisted)}
                  className={isWishlisted ? "text-red-500 border-red-500" : ""}
                >
                  <Heart className={`h-5 w-5 ${isWishlisted ? "fill-current" : ""}`} />
                </Button>
                <Button variant="outline" size="lg">
                  <Share2 className="h-5 w-5" />
                </Button>
              </div>
            </div>

            {/* Trust Badges */}
            <div className="flex items-center gap-6 pt-4 border-t">
              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                <Shield className="h-4 w-4" />
                <span>Secure Payment</span>
              </div>
              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                <Truck className="h-4 w-4" />
                <span>Fast Shipping</span>
              </div>
            </div>
          </div>
        </div>

        {/* Product Details Tabs */}
        <div className="mt-16">
          <Tabs defaultValue="description" className="w-full">
            <TabsList className="grid w-full grid-cols-3">
              <TabsTrigger value="description">Description</TabsTrigger>
              <TabsTrigger value="specifications">Specifications</TabsTrigger>
              <TabsTrigger value="shipping">Shipping & Returns</TabsTrigger>
            </TabsList>

            <TabsContent value="description" className="mt-6">
              <Card>
                <CardContent className="p-6">
                  <h3 className="text-xl font-semibold mb-4">Product Description</h3>
                  <p className="text-muted-foreground mb-6">{product.description}</p>

                  <h4 className="font-semibold mb-3">Key Features:</h4>
                  <ul className="space-y-2">
                    {product.features.map((feature, index) => (
                      <li key={index} className="flex items-start gap-2">
                        <span className="text-primary mt-1">•</span>
                        <span>{feature}</span>
                      </li>
                    ))}
                  </ul>
                </CardContent>
              </Card>
            </TabsContent>

            <TabsContent value="specifications" className="mt-6">
              <Card>
                <CardContent className="p-6">
                  <h3 className="text-xl font-semibold mb-4">Specifications</h3>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {Object.entries(product.specifications).map(([key, value]) => (
                      <div key={key} className="flex justify-between py-2 border-b">
                        <span className="font-medium">{key}:</span>
                        <span className="text-muted-foreground">{value}</span>
                      </div>
                    ))}
                  </div>
                </CardContent>
              </Card>
            </TabsContent>

            <TabsContent value="shipping" className="mt-6">
              <Card>
                <CardContent className="p-6">
                  <div className="space-y-6">
                    <div>
                      <h3 className="text-xl font-semibold mb-2">Shipping Information</h3>
                      <p className="text-muted-foreground">{product.shippingInfo}</p>
                    </div>

                    <Separator />

                    <div>
                      <h3 className="text-xl font-semibold mb-2">Return Policy</h3>
                      <p className="text-muted-foreground">{product.returnPolicy}</p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </TabsContent>
          </Tabs>
        </div>

        {/* Related Products */}
        <div className="mt-16">
          <h2 className="text-2xl font-bold mb-8">Related Products</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {relatedProducts.map((relatedProduct) => (
              <Link key={relatedProduct.id} href={`/product/${relatedProduct.id}`}>
                <Card className="overflow-hidden hover:shadow-lg transition-shadow cursor-pointer">
                  <div className="aspect-square relative">
                    <img
                      src={relatedProduct.image || "/placeholder.svg"}
                      alt={relatedProduct.name}
                      className="w-full h-full object-cover"
                    />
                  </div>
                  <CardContent className="p-4">
                    <h4 className="font-semibold mb-2 line-clamp-2">{relatedProduct.name}</h4>
                    <div className="flex items-center gap-2 mb-2">
                      <div className="flex items-center">
                        <Star className="h-4 w-4 fill-yellow-400 text-yellow-400" />
                        <span className="text-sm ml-1">{relatedProduct.rating}</span>
                      </div>
                      <span className="text-sm text-muted-foreground">({relatedProduct.reviews})</span>
                    </div>
                    <span className="text-lg font-bold">${relatedProduct.price}</span>
                  </CardContent>
                </Card>
              </Link>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
