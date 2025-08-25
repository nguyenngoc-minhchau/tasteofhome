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
  isactive: boolean
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
        setError(err.message || "Đang có lỗi xảy ra")
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
    return uniqueProducts.filter(product => product.isactive).slice(0, 3)
  }, [hotProducts, newProducts]);

  // Kiểm tra ký tự ngoài chữ và số Unicode (bao gồm cả tiếng Việt)
  // Chuỗi chỉ được gồm các ký tự chữ hoặc số, không được chứa ký tự đặc biệt, khoảng trắng, dấu câu...
  // Regex Unicode chữ và số: \p{L} là chữ, \p{N} là số
  // Cờ 'u' là Unicode, '^\p{L}\p{N}' là ký tự không phải chữ và số
  const hasInvalidChars = (input: string) => {
    // Nếu có kí tự khác chữ hoặc số thì trả về true
    // Regex: tìm ký tự không phải chữ (bao gồm các chữ Unicode, ví dụ tiếng Việt) hoặc số
    return /[^\p{L}\p{N}]/u.test(input)
  }

  const filteredProducts = useMemo(() => {
    if (hasInvalidChars(searchQuery)) {
      // Nếu có ký tự đặc biệt không hợp lệ thì không trả về sản phẩm nào
      return []
    }
    const productsToFilter = products.filter((product) => {
      if (!product.isactive) return false   
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

  const renderProductCard = (product: Product) => {
    const cartItem = cartState.items.find(item => item.id === product.id)

    return (
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

            {cartItem ? (
              <div className="flex items-center gap-2">
                <Button
                  size="sm"
                  onClick={() => cartDispatch({ type: "UPDATE_QUANTITY", payload: { id: product.id, quantity: cartItem.quantity - 1 } })}
                  disabled={cartItem.quantity <= 1}
                >
                  -
                </Button>
                <span>{cartItem.quantity}</span>
                <Button
                  size="sm"
                  onClick={() => cartDispatch({ type: "UPDATE_QUANTITY", payload: { id: product.id, quantity: cartItem.quantity + 1 } })}
                  disabled={cartItem.quantity >= 50} // stock limit
                >
                  +
                </Button>
              </div>
            ) : (
              <Button
                size="sm"
                onClick={() => handleAddToCart(product)}
                className="w-[120px] justify-center bg-orange text-black hover:bg-orange/80"
              >
                <ShoppingCart className="h-6 w-6" />
                Thêm vào giỏ
              </Button>
            )}
          </div>
        </CardContent>
      </Card>
    )
  }

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
      <section className={`py-6 ${
      title === "Hot Products" ? "bg-beige" : "bg-yellowish"}`}>
        <div className="container mx-auto px-4">
          <div className="relative mb-8">
            <h3 className="text-3xl font-bold text-center text-[#1C352D]">{title}</h3>
            {productsList.length > visibleCount && (
              <button
                onClick={() => setExpanded(!expanded)}
                className="absolute right-0 top-1/2 -translate-y-1/2 text-primary text-base font-semibold hover:underline"
              >
              {expanded ? "Thu gọn" : "Nhiều hơn"}
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
      {/* Welcome bar */}
      <div className="bg-red text-white text-sm text-center py-2">
        Chào mừng đến Taste Of Home
      </div>
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
                <Button variant="ghost">Đăng Nhập</Button>
              </Link>
            )}

            <Link href="/orders">
              <Button variant="ghost">Đơn Hàng</Button>
            </Link>

            <Link href="/support">
              <Button variant="ghost">Hỗ Trợ</Button>
            </Link>

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
          <h2 className="text-4xl font-bold mb-4">Khám Phá Các Sản Phẩm Đặc Sản Việt Nam</h2>
          <p className="text-lg text-muted-foreground mb-8">
            Tuyển chọn các mặt hàng đặc sản từ khắp các tỉnh thành Việt Nam với giá cả phải chăng
          </p>
          <div className="max-w-2xl mx-auto relative">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-5 w-5" />
            <Input
              placeholder="Tìm kiếm"
              value={searchQuery}
              onChange={(e) => {
                const val = e.target.value
                setSearchQuery(val)
                if (hasInvalidChars(val)) {
                  alert("Không được nhập ký tự đặc biệt hoặc dấu cách trong tìm kiếm")
                }
              }}
              className="pl-10 py-3 text-lg"
            />
            {/* Hiển thị cảnh báo dưới input */}
            {hasInvalidChars(searchQuery) && (
              <p className="text-red-500 mt-2 text-sm">Không được nhập ký tự đặc biệt hoặc dấu cách trong tìm kiếm</p>
            )}
          </div>
        </div>
      </section>
      <MiniCart openTrigger={addedProductIds.at(-1)} />

      {/* Featured Products */}
      {!isFiltered && featuredProducts.length > 0 && (
        <section className="py-12 bg-yellowish">
          <div className="container mx-auto px-4">
            <h3 className="text-3xl font-bold mb-8 text-center text-[#1C352D]">Sản Phẩm Nổi Bật</h3>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {featuredProducts.map((product) => renderProductCard(product))}
            </div>
          </div>
        </section>
      )}

      {/* Dynamic Product Sections (Hot/New) */}
      {!isFiltered && (
        <>
          {renderProductGroup("Sản Phẩm Bán Chạy", hotProducts, hotExpanded, setHotExpanded)}
          {renderProductGroup("Sản Phẩm Mới", newProducts, newExpanded, setNewExpanded)}
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
                          {isFiltered ? "Kết quả tìm kiếm" : "Tất cả sản phẩm"} <span className="text-muted-foreground ml-2">({filteredProducts.length} products)</span>
                      </h3>
                  </div>

                  {filteredProducts.length === 0 ? (
                      <div className="text-center py-12">
                          <p className="text-lg text-muted-foreground mb-4">Không có sản phẩm phù hợp với bộ lọc</p>
                          <Button onClick={clearAllFilters} variant="outline">
                              Xóa tất cả bộ lọc
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
      {/* Footer */}
      <footer className="bg-beige text-black mt-12">
        <div className="container mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-3 gap-6 text-sm place-items-center items-start">
          {/* Logo & liên hệ */}
          <div>
            <img src="/logo.png" alt="TasteOfHome Logo" className="h-12 mb-3" />
            <p>Địa chỉ: 227 Nguyễn Văn Cừ, phường Chợ Quán, TP.HCM</p>
            <p>Hotline: 0123 456 789</p>
            <p>Email: support@tasteofhome.com</p>
          </div>

          {/* Danh mục chính */}
          <div>
            <h3 className="font-semibold mb-2">Danh mục chính</h3>
            <ul className="space-y-1">
              <li>Rau củ quả</li>
              <li>Thịt cá</li>
              <li>Đặc sản vùng miền</li>
              <li>Gia vị & Nước chấm</li>
            </ul>
          </div>

          {/* Giới thiệu ngắn */}
          <div>
            <h3 className="font-semibold mb-2">Về chúng tôi</h3>
            <p>
              TasteOfHome mang hương vị quê hương đến từng bữa ăn của bạn. 
              Cam kết sản phẩm sạch, chất lượng, an toàn và giao hàng tận nơi.
            </p>
          </div>
        </div>

        {/* Bản quyền */}
        <div className="bg-black text-center text-white py-3 text-xs">
          © 2025 TasteOfHome. Bản quyền thuộc về nhóm 08.
        </div>
      </footer>
    </div>
  )
}
