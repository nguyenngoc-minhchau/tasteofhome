"use client"

import { useState } from "react"
import { ChevronDown, ChevronUp, Filter, X } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Checkbox } from "@/components/ui/checkbox"
import { Label } from "@/components/ui/label"
import { Slider } from "@/components/ui/slider"
import { Badge } from "@/components/ui/badge"
import { Collapsible, CollapsibleContent, CollapsibleTrigger } from "@/components/ui/collapsible"

interface SearchFiltersProps {
  categories: string[]
  selectedCategory: string
  onCategoryChange: (category: string) => void
  capacities: string[]
  selectedCapacity: string
  onCapacityChange: (capacity: string) => void
  priceRange: [number, number]
  onPriceRangeChange: (range: [number, number]) => void
  onClearAll: () => void
  minPrice: number
  maxPrice: number
}

export function SearchFilters({
  categories = [],
  selectedCategory,
  onCategoryChange,
  capacities = [],
  selectedCapacity,
  onCapacityChange,
  priceRange,
  onPriceRangeChange,
  onClearAll,
  minPrice = 0,
  maxPrice = 1000000,
}: SearchFiltersProps) {
  const [openSections, setOpenSections] = useState({
    category: true,
    price: true,
    capacity: true,
  })

  const toggleSection = (section: keyof typeof openSections) => {
    setOpenSections((prev) => ({ ...prev, [section]: !prev[section] }))
  }

  const activeFiltersCount =
    (selectedCategory ? 1 : 0) +
    (selectedCapacity ? 1 : 0) +
    (priceRange && priceRange[0] > minPrice || priceRange && priceRange[1] < maxPrice ? 1 : 0)

  // Guard to ensure priceRange values are valid numbers before calling toLocaleString
  const fromPrice = priceRange && typeof priceRange[0] === "number" ? priceRange[0] : minPrice
  const toPrice = priceRange && typeof priceRange[1] === "number" ? priceRange[1] : maxPrice

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle className="flex items-center gap-2">
            <Filter className="h-5 w-5" />
            Filters
            {activeFiltersCount > 0 && (
              <Badge variant="secondary" className="ml-2">
                {activeFiltersCount}
              </Badge>
            )}
          </CardTitle>
          {activeFiltersCount > 0 && (
            <Button variant="ghost" size="sm" onClick={onClearAll}>
              <X className="h-4 w-4 mr-1" />
              Clear All
            </Button>
          )}
        </div>
      </CardHeader>
      <CardContent className="space-y-6">
        {/* Category Filter */}
        <Collapsible open={openSections.category} onOpenChange={() => toggleSection("category")}>
          <CollapsibleTrigger asChild>
            <Button variant="ghost" className="w-full p-0 h-auto">
              <div className="flex w-full justify-between items-center">
                <span className="font-medium">Phân loại</span>
                {openSections.category ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
              </div>
            </Button>
          </CollapsibleTrigger>
          <CollapsibleContent className="space-y-2 mt-3">
            <div className="space-y-2">
              <Label className="flex items-center space-x-2 cursor-pointer">
                <Checkbox checked={selectedCategory === ""} onCheckedChange={() => onCategoryChange("")} />
                <span>Tất cả các phân loại</span>
              </Label>
              {categories.map((category) => (
                <Label key={category} className="flex items-center space-x-2 cursor-pointer">
                  <Checkbox
                    checked={selectedCategory === category}
                    onCheckedChange={() => onCategoryChange(selectedCategory === category ? "" : category)}
                  />
                  <span>{category}</span>
                </Label>
              ))}
            </div>
          </CollapsibleContent>
        </Collapsible>

        {/* Capacity Filter */}
        <Collapsible open={openSections.capacity} onOpenChange={() => toggleSection("capacity")}>
          <CollapsibleTrigger asChild>
            <Button variant="ghost" className="w-full p-0 h-auto">
              <div className="flex w-full justify-between items-center">
                <span className="font-medium">Thuộc tính</span>
                {openSections.capacity ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
              </div>
            </Button>
          </CollapsibleTrigger>
          <CollapsibleContent className="space-y-2 mt-3">
            <div className="space-y-2">
              <Label className="flex items-center space-x-2 cursor-pointer">
                <Checkbox checked={selectedCapacity === ""} onCheckedChange={() => onCapacityChange("")} />
                <span>Tất cả các thuộc tính</span>
              </Label>
              {capacities.map((capacity) => (
                <Label key={capacity} className="flex items-center space-x-2 cursor-pointer">
                  <Checkbox
                    checked={selectedCapacity === capacity}
                    onCheckedChange={() => onCapacityChange(selectedCapacity === capacity ? "" : capacity)}
                  />
                  <span>{capacity}</span>
                </Label>
              ))}
            </div>
          </CollapsibleContent>
        </Collapsible>

        {/* Price Range Filter */}
        <Collapsible open={openSections.price} onOpenChange={() => toggleSection("price")}>
          <CollapsibleTrigger asChild>
            <Button variant="ghost" className="w-full p-0 h-auto">
              <div className="flex w-full justify-between items-center">
                <span className="font-medium">Giá</span>
                {openSections.price ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
              </div>
            </Button>
          </CollapsibleTrigger>
          <CollapsibleContent className="space-y-4 mt-3">
            <div className="px-2">
              <Slider
                value={priceRange}
                onValueChange={(value) => onPriceRangeChange(value as [number, number])}
                min={minPrice}
                max={maxPrice}
                step={1000}
                className="w-full"
              />
              <div className="flex justify-between text-sm text-muted-foreground mt-2">
                <span>{fromPrice.toLocaleString("vi-VN")}₫</span>
                <span>{toPrice.toLocaleString("vi-VN")}₫+</span>
              </div>
            </div>
          </CollapsibleContent>
        </Collapsible>

        {/* Active Filters Summary */}
        {activeFiltersCount > 0 && (
          <div className="pt-4 border-t">
            <p className="text-sm text-muted-foreground">
              {activeFiltersCount} bộ lọc được áp dụng
            </p>
          </div>
        )}
      </CardContent>
    </Card>
  )
}
