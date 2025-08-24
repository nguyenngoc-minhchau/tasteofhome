"use client"

import { useEffect, useState, useMemo } from "react"
import Link from "next/link"
import Image from "next/image"
import { SearchFilters } from "@/components/search-filters"
import { Button } from "@/components/ui/button"

export default function ProductsPage() {
  const [products, setProducts] = useState<any[]>([])
  const [categories, setCategories] = useState<any[]>([])
  const [capacities, setCapacities] = useState<any[]>([])
  const [priceRange, setPriceRange] = useState<[number, number]>([0, 0])
  const [minPrice, setMinPrice] = useState(0)
  const [maxPrice, setMaxPrice] = useState(0)

  const [searchQuery, setSearchQuery] = useState("")
  const [selectedCategory, setSelectedCategory] = useState("")
  const [selectedCapacity, setSelectedCapacity] = useState("")

  // pagination
  const [currentPage, setCurrentPage] = useState(1)
  const pageSize = 9 // số sản phẩm mỗi trang

  useEffect(() => {
    async function fetchData() {
      const [productsRes, categoriesRes, capacitiesRes, priceRes] = await Promise.all([
        fetch("/api/product"),
        fetch("/api/categories"),
        fetch("/api/capacities"),
        fetch("/api/products/price-range"),
      ])
      setProducts(await productsRes.json())
      setCategories(await categoriesRes.json())
      setCapacities(await capacitiesRes.json())
      const pr = await priceRes.json()
      setPriceRange([pr.minPrice, pr.maxPrice])
      setMinPrice(pr.minPrice)
      setMaxPrice(pr.maxPrice)
    }
    fetchData()
  }, [])

  const filteredProducts = useMemo(() => {
    return products.filter((p) => {
      if (searchQuery && !p.title.toLowerCase().includes(searchQuery.toLowerCase())) return false
      if (selectedCategory && p.category !== selectedCategory) return false
      if (p.price < priceRange[0] || p.price > priceRange[1]) return false
      if (selectedCapacity && p.capacity !== selectedCapacity) return false
      return true
    })
  }, [products, searchQuery, selectedCategory, selectedCapacity, priceRange])

  // phân trang
  const totalPages = Math.ceil(filteredProducts.length / pageSize)
  const paginatedProducts = filteredProducts.slice(
    (currentPage - 1) * pageSize,
    currentPage * pageSize
  )

  return (
    <div className="container mx-auto px-4 py-8 grid grid-cols-1 lg:grid-cols-4 gap-8">
      {/* Sidebar */}
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
          onClearAll={() => {
            setSearchQuery("")
            setSelectedCategory("")
            setSelectedCapacity("")
            setPriceRange([minPrice, maxPrice])
            setCurrentPage(1)
          }}
          minPrice={minPrice}
          maxPrice={maxPrice}
        />
      </aside>

      {/* Main content */}
      <main className="lg:col-span-3">
        <h3 className="text-xl font-semibold mb-6">
          All Products ({filteredProducts.length})
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
          {paginatedProducts.map((p) => (
            <Link key={p.id} href={`/product/${p.id}`}>
              <div className="border rounded-md p-3 hover:shadow-md transition">
                <Image
                  src={p.image || "/placeholder.svg"}
                  alt={p.title}
                  width={300}
                  height={200}
                  className="w-full h-48 object-cover rounded-md"
                />
                <h4 className="mt-2 font-medium">{p.title}</h4>
              </div>
            </Link>
          ))}
        </div>

        {/* Pagination Controls */}
        {totalPages > 1 && (
          <div className="flex justify-center mt-8 space-x-2">
            <Button
              variant="outline"
              disabled={currentPage === 1}
              onClick={() => setCurrentPage((p) => p - 1)}
            >
              Prev
            </Button>
            {Array.from({ length: totalPages }, (_, i) => i + 1).map((page) => (
              <Button
                key={page}
                variant={page === currentPage ? "default" : "outline"}
                onClick={() => setCurrentPage(page)}
              >
                {page}
              </Button>
            ))}
            <Button
              variant="outline"
              disabled={currentPage === totalPages}
              onClick={() => setCurrentPage((p) => p + 1)}
            >
              Next
            </Button>
          </div>
        )}
      </main>
    </div>
  )
}
