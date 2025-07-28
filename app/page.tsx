"use client"

import { useState, useMemo } from "react"
import { Search, ShoppingCart, Heart, Star } from "lucide-react"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { SearchFilters } from "@/components/search-filters"
import Link from "next/link"
import { useCart } from "@/contexts/cart-context"

// Mock product data
const products = [
  {
    id: 1,
    name: "Premium Ethiopian Coffee Beans",
    price: 24.99,
    category: "Coffee",
    country: "Ethiopia",
    tags: ["single-origin", "medium-roast"],
    isOrganic: true,
    isArtisanal: true,
    rating: 4.8,
    reviews: 127,
    image: "/placeholder.svg?height=200&width=200",
  },
  {
    id: 2,
    name: "Himalayan Pink Salt",
    price: 12.5,
    category: "Spices",
    country: "Pakistan",
    tags: ["mineral-rich", "unrefined"],
    isOrganic: true,
    isArtisanal: false,
    rating: 4.6,
    reviews: 89,
    image: "/placeholder.svg?height=200&width=200",
  },
  {
    id: 3,
    name: "Organic Green Tea",
    price: 18.75,
    category: "Tea",
    country: "Japan",
    tags: ["ceremonial-grade", "matcha"],
    isOrganic: true,
    isArtisanal: true,
    rating: 4.9,
    reviews: 203,
    image: "/placeholder.svg?height=200&width=200",
  },
  {
    id: 4,
    name: "Artisan Dark Chocolate",
    price: 32.0,
    category: "Chocolate",
    country: "Belgium",
    tags: ["70%-cacao", "fair-trade"],
    isOrganic: false,
    isArtisanal: true,
    rating: 4.7,
    reviews: 156,
    image: "/placeholder.svg?height=200&width=200",
  },
  {
    id: 5,
    name: "Wild Honey",
    price: 28.99,
    category: "Honey",
    country: "New Zealand",
    tags: ["raw", "manuka"],
    isOrganic: true,
    isArtisanal: true,
    rating: 4.8,
    reviews: 94,
    image: "/placeholder.svg?height=200&width=200",
  },
  {
    id: 6,
    name: "Basmati Rice",
    price: 15.25,
    category: "Grains",
    country: "India",
    tags: ["aged", "aromatic"],
    isOrganic: true,
    isArtisanal: false,
    rating: 4.5,
    reviews: 78,
    image: "/placeholder.svg?height=200&width=200",
  },
  {
    id: 7,
    name: "French Lavender Oil",
    price: 45.0,
    category: "Essential Oils",
    country: "France",
    tags: ["therapeutic-grade", "steam-distilled"],
    isOrganic: true,
    isArtisanal: true,
    rating: 4.9,
    reviews: 167,
    image: "/placeholder.svg?height=200&width=200",
  },
  {
    id: 8,
    name: "Aged Balsamic Vinegar",
    price: 38.5,
    category: "Condiments",
    country: "Italy",
    tags: ["12-year-aged", "traditional"],
    isOrganic: false,
    isArtisanal: true,
    rating: 4.8,
    reviews: 112,
    image: "/placeholder.svg?height=200&width=200",
  },
]

const categories = ["Coffee", "Tea", "Spices", "Chocolate", "Honey", "Grains", "Essential Oils", "Condiments"]
const countries = ["Ethiopia", "Pakistan", "Japan", "Belgium", "New Zealand", "India", "France", "Italy"]
const allTags = [
  "single-origin",
  "medium-roast",
  "mineral-rich",
  "unrefined",
  "ceremonial-grade",
  "matcha",
  "70%-cacao",
  "fair-trade",
  "raw",
  "manuka",
  "aged",
  "aromatic",
  "therapeutic-grade",
  "steam-distilled",
  "12-year-aged",
  "traditional",
]

export default function HomePage() {
  const [searchQuery, setSearchQuery] = useState("")
  const [selectedCategory, setSelectedCategory] = useState("")
  const [priceRange, setPriceRange] = useState<[number, number]>([0, 200])
  const [selectedCountries, setSelectedCountries] = useState<string[]>([])
  const [selectedTags, setSelectedTags] = useState<string[]>([])
  const [isOrganic, setIsOrganic] = useState(false)
  const [isArtisanal, setIsArtisanal] = useState(false)

  const { state: cartState, dispatch: cartDispatch } = useCart()

  const filteredProducts = useMemo(() => {
    return products.filter((product) => {
      // Search query filter
      if (searchQuery && !product.name.toLowerCase().includes(searchQuery.toLowerCase())) {
        return false
      }

      // Category filter
      if (selectedCategory && product.category !== selectedCategory) {
        return false
      }

      // Price range filter
      if (product.price < priceRange[0] || product.price > priceRange[1]) {
        return false
      }

      // Country filter
      if (selectedCountries.length > 0 && !selectedCountries.includes(product.country)) {
        return false
      }

      // Tags filter
      if (selectedTags.length > 0 && !selectedTags.some((tag) => product.tags.includes(tag))) {
        return false
      }

      // Organic filter
      if (isOrganic && !product.isOrganic) {
        return false
      }

      // Artisanal filter
      if (isArtisanal && !product.isArtisanal) {
        return false
      }

      return true
    })
  }, [searchQuery, selectedCategory, priceRange, selectedCountries, selectedTags, isOrganic, isArtisanal])

  const clearAllFilters = () => {
    setSelectedCategory("")
    setPriceRange([0, 200])
    setSelectedCountries([])
    setSelectedTags([])
    setIsOrganic(false)
    setIsArtisanal(false)
    setSearchQuery("")
  }

  const featuredProducts = products.slice(0, 3)

  const handleAddToCart = (product: any) => {
    cartDispatch({
      type: "ADD_ITEM",
      payload: {
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: 1,
        image: product.image,
        category: product.category,
        stock: 50, // Default stock
      },
    })
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <h1 className="text-2xl font-bold">Artisan Market</h1>
            <div className="flex items-center gap-4">
              <Link href="/orders">
                <Button variant="ghost">Orders</Button>
              </Link>
              <Link href="/support">
                <Button variant="ghost">Support</Button>
              </Link>
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

      {/* Hero Section with Search */}
      <section className="bg-gradient-to-r from-orange-50 to-amber-50 py-12">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-4xl font-bold mb-4">Discover Premium Artisan Products</h2>
          <p className="text-lg text-muted-foreground mb-8">
            Curated selection of organic, artisanal, and specialty items from around the world
          </p>
          <div className="max-w-2xl mx-auto relative">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-5 w-5" />
            <Input
              placeholder="Search for products, categories, or brands..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="pl-10 py-3 text-lg"
            />
          </div>
        </div>
      </section>

      {/* Featured Products */}
      {!searchQuery && !selectedCategory && (
        <section className="py-12">
          <div className="container mx-auto px-4">
            <h3 className="text-2xl font-bold mb-8">Featured Products</h3>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {featuredProducts.map((product) => (
                <Card key={product.id} className="overflow-hidden">
                  <Link href={`/product/${product.id}`}>
                    <div className="aspect-square relative cursor-pointer">
                      <img
                        src={product.image || "/placeholder.svg"}
                        alt={product.name}
                        className="w-full h-full object-cover"
                      />
                      {product.isOrganic && <Badge className="absolute top-2 left-2 bg-green-500">Organic</Badge>}
                      {product.isArtisanal && <Badge className="absolute top-2 right-2 bg-purple-500">Artisanal</Badge>}
                    </div>
                  </Link>
                  <CardContent className="p-4">
                    <div className="flex items-center gap-2 text-sm text-muted-foreground mb-2">
                      <span>{product.category}</span>
                      <span>•</span>
                      <span>{product.country}</span>
                    </div>
                    <Link href={`/product/${product.id}`}>
                      <h4 className="font-semibold mb-2 line-clamp-2 hover:text-primary cursor-pointer">
                        {product.name}
                      </h4>
                    </Link>
                    <div className="flex items-center gap-2 mb-2">
                      <div className="flex items-center">
                        <Star className="h-4 w-4 fill-yellow-400 text-yellow-400" />
                        <span className="text-sm ml-1">{product.rating}</span>
                      </div>
                      <span className="text-sm text-muted-foreground">({product.reviews} reviews)</span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-lg font-bold">${product.price}</span>
                      <Button size="sm" onClick={() => handleAddToCart(product)}>
                        Add to Cart
                      </Button>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        </section>
      )}

      {/* Main Content */}
      <div className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-8">
          {/* Filters Sidebar */}
          <div className="lg:col-span-1">
            <SearchFilters
              categories={categories}
              countries={countries}
              tags={allTags}
              selectedCategory={selectedCategory}
              onCategoryChange={setSelectedCategory}
              priceRange={priceRange}
              onPriceRangeChange={setPriceRange}
              selectedCountries={selectedCountries}
              onCountriesChange={setSelectedCountries}
              selectedTags={selectedTags}
              onTagsChange={setSelectedTags}
              isOrganic={isOrganic}
              onOrganicChange={setIsOrganic}
              isArtisanal={isArtisanal}
              onArtisanalChange={setIsArtisanal}
              onClearAll={clearAllFilters}
            />
          </div>

          {/* Products Grid */}
          <div className="lg:col-span-3">
            <div className="flex items-center justify-between mb-6">
              <h3 className="text-xl font-semibold">
                {searchQuery || selectedCategory ? "Search Results" : "All Products"}
                <span className="text-muted-foreground ml-2">({filteredProducts.length} products)</span>
              </h3>
            </div>

            {filteredProducts.length === 0 ? (
              <div className="text-center py-12">
                <p className="text-lg text-muted-foreground mb-4">No products found matching your criteria</p>
                <Button onClick={clearAllFilters} variant="outline">
                  Clear All Filters
                </Button>
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
                {filteredProducts.map((product) => (
                  <Card key={product.id} className="overflow-hidden hover:shadow-lg transition-shadow">
                    <Link href={`/product/${product.id}`}>
                      <div className="aspect-square relative cursor-pointer">
                        <img
                          src={product.image || "/placeholder.svg"}
                          alt={product.name}
                          className="w-full h-full object-cover"
                        />
                        <div className="absolute top-2 left-2 flex flex-col gap-1">
                          {product.isOrganic && <Badge className="bg-green-500 text-white">Organic</Badge>}
                          {product.isArtisanal && <Badge className="bg-purple-500 text-white">Artisanal</Badge>}
                        </div>
                        <Button
                          size="icon"
                          variant="ghost"
                          className="absolute top-2 right-2 bg-white/80 hover:bg-white"
                          onClick={(e) => e.preventDefault()}
                        >
                          <Heart className="h-4 w-4" />
                        </Button>
                      </div>
                    </Link>
                    <CardContent className="p-4">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground mb-2">
                        <span>{product.category}</span>
                        <span>•</span>
                        <span>{product.country}</span>
                      </div>
                      <Link href={`/product/${product.id}`}>
                        <h4 className="font-semibold mb-2 line-clamp-2 hover:text-primary cursor-pointer">
                          {product.name}
                        </h4>
                      </Link>
                      <div className="flex items-center gap-2 mb-3">
                        <div className="flex items-center">
                          <Star className="h-4 w-4 fill-yellow-400 text-yellow-400" />
                          <span className="text-sm ml-1">{product.rating}</span>
                        </div>
                        <span className="text-sm text-muted-foreground">({product.reviews})</span>
                      </div>
                      <div className="flex flex-wrap gap-1 mb-3">
                        {product.tags.slice(0, 2).map((tag) => (
                          <Badge key={tag} variant="secondary" className="text-xs">
                            {tag}
                          </Badge>
                        ))}
                      </div>
                      <div className="flex items-center justify-between">
                        <span className="text-lg font-bold">${product.price}</span>
                        <Button size="sm" onClick={() => handleAddToCart(product)}>
                          <ShoppingCart className="h-4 w-4 mr-1" />
                          Add to Cart
                        </Button>
                      </div>
                    </CardContent>
                  </Card>
                ))}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
