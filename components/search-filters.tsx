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
  countries: string[]
  tags: string[]
  selectedCategory: string
  onCategoryChange: (category: string) => void
  priceRange: [number, number]
  onPriceRangeChange: (range: [number, number]) => void
  selectedCountries: string[]
  onCountriesChange: (countries: string[]) => void
  selectedTags: string[]
  onTagsChange: (tags: string[]) => void
  isOrganic: boolean
  onOrganicChange: (organic: boolean) => void
  isArtisanal: boolean
  onArtisanalChange: (artisanal: boolean) => void
  onClearAll: () => void
}

export function SearchFilters({
  categories,
  countries,
  tags,
  selectedCategory,
  onCategoryChange,
  priceRange,
  onPriceRangeChange,
  selectedCountries,
  onCountriesChange,
  selectedTags,
  onTagsChange,
  isOrganic,
  onOrganicChange,
  isArtisanal,
  onArtisanalChange,
  onClearAll,
}: SearchFiltersProps) {
  const [openSections, setOpenSections] = useState({
    category: true,
    price: true,
    country: true,
    features: true,
    tags: false,
  })

  const toggleSection = (section: keyof typeof openSections) => {
    setOpenSections((prev) => ({ ...prev, [section]: !prev[section] }))
  }

  const handleCountryChange = (country: string, checked: boolean) => {
    if (checked) {
      onCountriesChange([...selectedCountries, country])
    } else {
      onCountriesChange(selectedCountries.filter((c) => c !== country))
    }
  }

  const handleTagChange = (tag: string, checked: boolean) => {
    if (checked) {
      onTagsChange([...selectedTags, tag])
    } else {
      onTagsChange(selectedTags.filter((t) => t !== tag))
    }
  }

  const activeFiltersCount =
    (selectedCategory ? 1 : 0) +
    (selectedCountries.length > 0 ? 1 : 0) +
    (selectedTags.length > 0 ? 1 : 0) +
    (isOrganic ? 1 : 0) +
    (isArtisanal ? 1 : 0) +
    (priceRange[0] > 0 || priceRange[1] < 200 ? 1 : 0)

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
            <Button variant="ghost" className="w-full justify-between p-0 h-auto">
              <span className="font-medium">Category</span>
              {openSections.category ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
            </Button>
          </CollapsibleTrigger>
          <CollapsibleContent className="space-y-2 mt-3">
            <div className="space-y-2">
              <Label className="flex items-center space-x-2 cursor-pointer">
                <Checkbox checked={selectedCategory === ""} onCheckedChange={() => onCategoryChange("")} />
                <span>All Categories</span>
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

        {/* Price Range Filter */}
        <Collapsible open={openSections.price} onOpenChange={() => toggleSection("price")}>
          <CollapsibleTrigger asChild>
            <Button variant="ghost" className="w-full justify-between p-0 h-auto">
              <span className="font-medium">Price Range</span>
              {openSections.price ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
            </Button>
          </CollapsibleTrigger>
          <CollapsibleContent className="space-y-4 mt-3">
            <div className="px-2">
              <Slider
                value={priceRange}
                onValueChange={(value) => onPriceRangeChange(value as [number, number])}
                max={200}
                min={0}
                step={5}
                className="w-full"
              />
              <div className="flex justify-between text-sm text-muted-foreground mt-2">
                <span>${priceRange[0]}</span>
                <span>${priceRange[1]}+</span>
              </div>
            </div>
          </CollapsibleContent>
        </Collapsible>

        {/* Country Filter */}
        <Collapsible open={openSections.country} onOpenChange={() => toggleSection("country")}>
          <CollapsibleTrigger asChild>
            <Button variant="ghost" className="w-full justify-between p-0 h-auto">
              <span className="font-medium">Country of Origin</span>
              {openSections.country ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
            </Button>
          </CollapsibleTrigger>
          <CollapsibleContent className="space-y-2 mt-3">
            <div className="space-y-2 max-h-48 overflow-y-auto">
              {countries.map((country) => (
                <Label key={country} className="flex items-center space-x-2 cursor-pointer">
                  <Checkbox
                    checked={selectedCountries.includes(country)}
                    onCheckedChange={(checked) => handleCountryChange(country, checked as boolean)}
                  />
                  <span>{country}</span>
                </Label>
              ))}
            </div>
          </CollapsibleContent>
        </Collapsible>

        {/* Features Filter */}
        <Collapsible open={openSections.features} onOpenChange={() => toggleSection("features")}>
          <CollapsibleTrigger asChild>
            <Button variant="ghost" className="w-full justify-between p-0 h-auto">
              <span className="font-medium">Features</span>
              {openSections.features ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
            </Button>
          </CollapsibleTrigger>
          <CollapsibleContent className="space-y-2 mt-3">
            <div className="space-y-2">
              <Label className="flex items-center space-x-2 cursor-pointer">
                <Checkbox checked={isOrganic} onCheckedChange={onOrganicChange} />
                <span>Organic</span>
              </Label>
              <Label className="flex items-center space-x-2 cursor-pointer">
                <Checkbox checked={isArtisanal} onCheckedChange={onArtisanalChange} />
                <span>Artisanal</span>
              </Label>
            </div>
          </CollapsibleContent>
        </Collapsible>

        {/* Tags Filter */}
        <Collapsible open={openSections.tags} onOpenChange={() => toggleSection("tags")}>
          <CollapsibleTrigger asChild>
            <Button variant="ghost" className="w-full justify-between p-0 h-auto">
              <span className="font-medium">Tags</span>
              {openSections.tags ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
            </Button>
          </CollapsibleTrigger>
          <CollapsibleContent className="space-y-2 mt-3">
            <div className="space-y-2 max-h-48 overflow-y-auto">
              {tags.map((tag) => (
                <Label key={tag} className="flex items-center space-x-2 cursor-pointer">
                  <Checkbox
                    checked={selectedTags.includes(tag)}
                    onCheckedChange={(checked) => handleTagChange(tag, checked as boolean)}
                  />
                  <span className="capitalize">{tag}</span>
                </Label>
              ))}
            </div>
          </CollapsibleContent>
        </Collapsible>

        {/* Active Filters Summary */}
        {activeFiltersCount > 0 && (
          <div className="pt-4 border-t">
            <p className="text-sm text-muted-foreground">
              {activeFiltersCount} filter{activeFiltersCount > 1 ? "s" : ""} applied
            </p>
          </div>
        )}
      </CardContent>
    </Card>
  )
}
