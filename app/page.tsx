// /app/page.tsx
"use client"

import { useState, useMemo, useEffect } from "react"
import Image from "next/image"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { Search, ShoppingCart, Heart, LogOut, User as UserIcon, CheckCircle, ChevronRight, ChevronLeft } from "lucide-react"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { SearchFilters } from "@/components/search-filters"
import { MiniCart } from "@/components/mini-cart"
import { DropdownMenu, DropdownMenuTrigger, DropdownMenuContent, DropdownMenuLabel, DropdownMenuSeparator, DropdownMenuItem } from "@/components/ui/dropdown-menu"
import { useCart } from "@/contexts/cart-context"
import { useAuth } from "@/hooks/use-auth"

interface Product {
  id: number
  title: string
  image: string | null
  price: number
  price_discount?: number
  re_name?: string
  category?: string
  capacity?: string
}

interface Category {
  id: number
  title: string
  re_name: string
  ishot: number
  isnew: number
  priority: number
}

interface Capacity {
  id: number
  title: string
  priority: number
}

const formatPrice = (price: number) =>
  new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  }).format(price)

export default function HomePage() {
  const [products, setProducts] = useState<Product[]>([])
  const [categories, setCategories] = useState<Category[]>([])
  const [capacities, setCapacities] = useState<Capacity[]>([])
  const [priceRange, setPriceRange] = useState<[number, number]>([0, 0])
  const [minPrice, setMinPrice] = useState(0)
  const [maxPrice, setMaxPrice] = useState(0)
  const [hotProducts, setHotProducts] = useState<Product[]>([])
  const [newProducts, setNewProducts] = useState<Product[]>([])

  const [hotExpanded, setHotExpanded] = useState(false)
  const [newExpanded, setNewExpanded] = useState(false)

  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const [searchQuery, setSearchQuery] = useState("")
  const [selectedCategory, setSelectedCategory] = useState("")
  const [selectedCapacity, setSelectedCapacity] = useState("")

  const { state: cartState, dispatch: cartDispatch } = useCart()
  const [addedProductIds, setAddedProductIds] = useState<number[]>([])
  const [loadingProductIds, setLoadingProductIds] = useState<number[]>([])
  const { user, isAuthenticated, logout } = useAuth()
  const router = useRouter()

  const PRODUCTS_PER_PAGE = 12
  const [currentPage, setCurrentPage] = useState(1)

  useEffect(() => {
    if (isAuthenticated && user?.role !== "customer") {
      router.replace("/dashboard")
      return
    }

    async function fetchData() {
      try {
        setIsLoading(true)
        setError(null)

        const [productsRes, categoriesRes, priceRangeRes, capacitiesRes, highlightsRes] = await Promise.all([
          fetch("/api/product"),
          fetch("/api/categories"),
          fetch("/api/products/price-range"),
          fetch("/api/capacities"),
          fetch("/api/products/highlights"),
        ])

        if (!productsRes.ok) throw new Error("Failed to fetch products")
        if (!categoriesRes.ok) throw new Error("Failed to fetch categories")
        if (!priceRangeRes.ok) throw new Error("Failed to fetch price range")
        if (!capacitiesRes.ok) throw new Error("Failed to fetch capacities")
        if (!highlightsRes.ok) throw new Error("Failed to fetch highlights")

        const productsData = await productsRes.json()
        const categoriesData = await categoriesRes.json()
        const priceRangeData = await priceRangeRes.json()
        const capacitiesData = await capacitiesRes.json()
        const highlightsData = await highlightsRes.json()

        setProducts(productsData)
        setCategories(categoriesData)
        setPriceRange([priceRangeData.minPrice, priceRangeData.maxPrice])
        setMinPrice(priceRangeData.minPrice)
        setMaxPrice(priceRangeData.maxPrice)
        setCapacities(capacitiesData)
        setHotProducts(highlightsData.hot || [])
        setNewProducts(highlightsData.new || [])
      } catch (err: any) {
        setError(err.message || "Something went wrong")
      } finally {
        setIsLoading(false)
      }
    }

    fetchData()
  }, [isAuthenticated, user, router])

  const handleLogout = () => {
    logout()
    router.push("/auth")
  }

  const featuredProducts = useMemo(() => {
    const allHighlights = [...hotProducts, ...newProducts];
    const uniqueProducts = Array.from(new Map(allHighlights.map(item => [item.id, item])).values());
    return uniqueProducts.slice(0, 3);
  }, [hotProducts, newProducts]);

  const filteredProducts = useMemo(() => {
    const productsToFilter = products.filter((product) => {
      if (searchQuery && !product.title.toLowerCase().includes(searchQuery.toLowerCase())) return false
      if (selectedCategory && product.category !== selectedCategory) return false
      if (product.price < priceRange[0] || product.price > priceRange[1]) return false
      if (selectedCapacity && product.capacity !== selectedCapacity) return false
      return true
    })
    return productsToFilter
  }, [products, searchQuery, selectedCategory, priceRange, selectedCapacity])

  const totalPages = Math.ceil(filteredProducts.length / PRODUCTS_PER_PAGE)
  const currentProducts = useMemo(() => {
    const startIndex = (currentPage - 1) * PRODUCTS_PER_PAGE
    const endIndex = startIndex + PRODUCTS_PER_PAGE
    return filteredProducts.slice(startIndex, endIndex)
  }, [filteredProducts, currentPage])

  useEffect(() => {
    setCurrentPage(1)
  }, [searchQuery, selectedCategory, selectedCapacity, priceRange])

  const handlePageChange = (page: number) => {
    if (page < 1 || page > totalPages) return
    setCurrentPage(page)
    window.scrollTo({ top: 0, behavior: "smooth" })
  }

  const clearAllFilters = () => {
    setSearchQuery("")
    setSelectedCategory("")
    setSelectedCapacity("")
    setPriceRange([minPrice, maxPrice])
  }

  const renderProductCard = (product: Product, buttonWidth: string = "w-[140px]") => (
    <Card key={product.id} className="overflow-hidden hover:shadow-lg transition-shadow">
      <Link href={`/product/${product.id}`}>
        <div className="aspect-square relative cursor-pointer">
          <Image
          src={product.image ? (product.image.startsWith("/") ? product.image : `/${product.image}`) : "/placeholder.svg"}
          alt={product.title}
          width={400}
          height={400}
          quality={100}
          className="object-cover"
          />
        </div>
      </Link>
      <CardContent className="p-4">
        <div className="flex items-center gap-2 text-sm text-muted-foreground mb-2">
          <span>{product.category}</span>
        </div>
        <Link href={`/product/${product.id}`}>
          <h4 className="font-semibold mb-2 line-clamp-2 hover:text-primary cursor-pointer">
            {product.title}
          </h4>
        </Link>
        <div className="flex items-center justify-between">
          <span className="text-lg font-bold">{formatPrice(product.price)}</span>
          <Button
            size="sm"
            onClick={() => handleAddToCart(product)}
            className={`${buttonWidth} justify-center`}
            disabled={loadingProductIds.includes(product.id) || addedProductIds.includes(product.id)}
          >
            {loadingProductIds.includes(product.id) ? (
              <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white" />
            ) : addedProductIds.includes(product.id) ? (
              <>
                <CheckCircle className="h-4 w-4 mr-1" />
                Added
              </>
            ) : (
              <>
                <ShoppingCart className="h-4 w-4 mr-1" />
                Add to Cart
              </>
            )}
          </Button>
        </div>
      </CardContent>
    </Card>
  )

  const handleAddToCart = (product: Product) => {
    if (loadingProductIds.includes(product.id) || addedProductIds.includes(product.id)) return
    setLoadingProductIds((prev) => [...prev, product.id])
    setTimeout(() => {
      cartDispatch({
        type: "ADD_ITEM",
        payload: {
          id: product.id,
          name: product.title,
          price: product.price,
          quantity: 1,
          image: product.image ? (product.image.startsWith("/") ? product.image : `/${product.image}`) : "/placeholder.svg",
          category: product.category || "",
          stock: 50,
        },
      })
      setLoadingProductIds((prev) => prev.filter((id) => id !== product.id))
      setAddedProductIds((prev) => [...prev, product.id])
      setTimeout(() => {
        setAddedProductIds((prev) => prev.filter((id) => id !== product.id))
      }, 700)
    }, 700)
  }

  const renderProductGroup = (
    title: string,
    productsList: Product[],
    expanded: boolean,
    setExpanded: (val: boolean) => void
  ) => {
    const visibleCount = 3
    const displayedProducts = expanded ? productsList : productsList.slice(0, visibleCount)
    if (productsList.length === 0) return null
    return (
      <section className={`py-12 ${
      title === "Hot Products" ? "bg-beige" : "bg-yellowish"}`}>
        <div className="container mx-auto px-4">
          <div className="relative mb-8">
            <h3 className="text-3xl font-bold text-center text-[#1C352D]">{title}</h3>
            {productsList.length > visibleCount && (
              <button
                onClick={() => setExpanded(!expanded)}
                className="absolute right-0 top-1/2 -translate-y-1/2 text-primary text-base font-semibold hover:underline"
              >
              {expanded ? "Less" : "More"}
            </button>
          )}
        </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-2">
            {displayedProducts.map((product) => renderProductCard(product))}
          </div>
        </div>
      </section>
    )
  }

  const renderPagination = () => {
    if (totalPages <= 1) return null

    const pageNumbers = []
    const maxPageButtons = 5
    const startPage = Math.max(1, currentPage - Math.floor(maxPageButtons / 2))
    const endPage = Math.min(totalPages, startPage + maxPageButtons - 1)

    for (let i = startPage; i <= endPage; i++) {
        pageNumbers.push(i)
    }

    return (
        <div className="flex items-center justify-center space-x-2 mt-6">
            <Button
                variant="outline"
                size="icon"
                onClick={() => handlePageChange(currentPage - 1)}
                disabled={currentPage === 1}
            >
                <ChevronLeft className="h-4 w-4" />
            </Button>
            {pageNumbers.map(page => (
                <Button
                    key={page}
                    variant={currentPage === page ? "default" : "outline"}
                    onClick={() => handlePageChange(page)}
                >
                    {page}
                </Button>
            ))}
            <Button
                variant="outline"
                size="icon"
                onClick={() => handlePageChange(currentPage + 1)}
                disabled={currentPage === totalPages}
            >
                <ChevronRight className="h-4 w-4" />
            </Button>
        </div>
    )
  }

  if (isAuthenticated && user?.role !== "customer") {
    return null
  }

  if (isLoading) {
    return <div className="min-h-screen flex items-center justify-center text-xl font-semibold">Loading products...</div>
  }

  if (error) {
    return <div className="min-h-screen flex items-center justify-center text-lg text-red-500">Error: {error}</div>
  }

  const isFiltered = searchQuery || selectedCategory || selectedCapacity || priceRange[0] !== minPrice || priceRange[1] !== maxPrice;


  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b bg-white sticky top-0 z-50">
        <div className="container mx-auto px-4 py-4 flex items-center justify-between">
          <Link href="/" className="ml-16">
            <Image src="/logo.png" alt="Team Logo" width={120} height={80} priority />
          </Link>

          <div className="flex items-center gap-4">
            {isAuthenticated ? (
              <DropdownMenu>
                <DropdownMenuTrigger asChild>
                  <Button variant="ghost" className="relative w-8 h-8 rounded-full overflow-hidden p-0">
                    <img
                      src="/placeholder-user.jpg"
                      alt={user?.name || "User Avatar"}
                      className="w-full h-full object-cover"
                    />
                  </Button>
                </DropdownMenuTrigger>
                <DropdownMenuContent className="w-56" align="end" forceMount>
                  <DropdownMenuLabel>{user?.name || "My Account"}</DropdownMenuLabel>
                  <DropdownMenuSeparator />
                  <DropdownMenuItem>
                    <Link href="/profile" className="flex items-center">
                      <UserIcon className="mr-2 h-4 w-4" />
                      Profile
                    </Link>
                  </DropdownMenuItem>
                  <DropdownMenuItem onClick={handleLogout}>
                    <LogOut className="mr-2 h-4 w-4" />
                    Log Out
                  </DropdownMenuItem>
                </DropdownMenuContent>
              </DropdownMenu>
            ) : (
              <Link href="/auth">
                <Button variant="ghost">Sign In</Button>
              </Link>
            )}

            <Link href="/orders">
              <Button variant="ghost">Orders</Button>
            </Link>

            <Link href="/support">
              <Button variant="ghost">Support</Button>
            </Link>

            <Button variant="ghost" size="icon">
              <Heart className="h-5 w-5" />
            </Button>

            <Link href="/cart" className="relative">
              <Button variant="ghost" size="icon">
                <ShoppingCart className="h-5 w-5" />
                {cartState?.itemCount > 0 && (
                  <Badge className="absolute -top-2 -right-2 h-5 w-5 rounded-full p-0 flex items-center justify-center text-xs">
                    {cartState.itemCount}
                  </Badge>
                )}
              </Button>
            </Link>
          </div>
        </div>
      </header>

      {/* Hero Section with Search */}
      <section className="bg-beige py-12">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-4xl font-bold mb-4">Discover Premium Artisan Products</h2>
          <p className="text-lg text-muted-foreground mb-8">
            Curated selection of organic, artisanal, and specialty items from around the world
          </p>
          <div className="max-w-2xl mx-auto relative">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-5 w-5" />
            <Input placeholder="Search for products, categories, or brands..." value={searchQuery} onChange={(e) => setSearchQuery(e.target.value)} className="pl-10 py-3 text-lg" />
          </div>
        </div>
      </section>
      <MiniCart openTrigger={addedProductIds.at(-1)} />

      {/* Featured Products */}
      {!isFiltered && featuredProducts.length > 0 && (
        <section className="py-12 bg-yellowish">
          <div className="container mx-auto px-4">
            <h3 className="text-3xl font-bold mb-8 text-center text-[#1C352D]">Featured Products</h3>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {featuredProducts.map((product) => renderProductCard(product))}
            </div>
          </div>
        </section>
      )}

      {/* Dynamic Product Sections (Hot/New) */}
      {!isFiltered && (
        <>
          {renderProductGroup("Hot Products", hotProducts, hotExpanded, setHotExpanded)}
          {renderProductGroup("New Products", newProducts, newExpanded, setNewExpanded)}
        </>
      )}
      
      {/* Main Content & Filtered Results */}
      <div className="container mx-auto px-4 py-8">
          <div className="grid grid-cols-1 lg:grid-cols-4 gap-8">
              <aside className="lg:col-span-1">
                  <SearchFilters
                      categories={categories.map((c) => c.title)}
                      capacities={capacities.map((c) => c.title)}
                      selectedCategory={selectedCategory}
                      onCategoryChange={setSelectedCategory}
                      selectedCapacity={selectedCapacity}
                      onCapacityChange={setSelectedCapacity}
                      priceRange={priceRange}
                      onPriceRangeChange={setPriceRange}
                      onClearAll={clearAllFilters}
                      minPrice={minPrice}
                      maxPrice={maxPrice}
                  />
              </aside>
              <main className="lg:col-span-3">
                  <div className="flex items-center justify-between mb-6">
                      <h3 className="text-xl font-semibold">
                          {isFiltered ? "Search Results" : "All Products"} <span className="text-muted-foreground ml-2">({filteredProducts.length} products)</span>
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
                      <>
                          <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
                              {currentProducts.map((product) => renderProductCard(product))}
                          </div>
                          {renderPagination()}
                      </>
                  )}
              </main>
          </div>
      </div>
    </div>
  )
}
