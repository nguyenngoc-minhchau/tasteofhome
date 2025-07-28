"use client"

import { useState } from "react"
import { useParams, useRouter } from "next/navigation"
import Link from "next/link"
import { ArrowLeft, Star, CheckCircle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Textarea } from "@/components/ui/textarea"
import { Label } from "@/components/ui/label"

// Mock product data
const productData = {
  "1": {
    id: 1,
    name: "Premium Ethiopian Coffee Beans",
    image: "/placeholder.svg?height=200&width=200&text=Coffee",
    purchaseVerified: true,
    previousReview: null, // or existing review object
  },
}

export default function WriteReviewPage() {
  const params = useParams()
  const router = useRouter()
  const productId = params.id as string
  const product = productData[productId as keyof typeof productData]

  const [rating, setRating] = useState(0)
  const [hoveredRating, setHoveredRating] = useState(0)
  const [reviewText, setReviewText] = useState("")
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [reviewSubmitted, setReviewSubmitted] = useState(false)

  if (!product) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Product Not Found</h1>
          <Link href="/">
            <Button>Back to Shop</Button>
          </Link>
        </div>
      </div>
    )
  }

  if (!product.purchaseVerified) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center max-w-md">
          <h1 className="text-2xl font-bold mb-4">Purchase Required</h1>
          <p className="text-muted-foreground mb-6">
            You can only review products you have purchased. Please purchase this product first to leave a review.
          </p>
          <Link href={`/product/${productId}`}>
            <Button>View Product</Button>
          </Link>
        </div>
      </div>
    )
  }

  const handleSubmitReview = async () => {
    setIsSubmitting(true)

    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 2000))

    setReviewSubmitted(true)
    setIsSubmitting(false)

    // In a real app, you would:
    // 1. Validate rating and review content
    // 2. Save to database
    // 3. Update product's average rating
    // 4. Send confirmation to user
    // 5. Optionally moderate review before display
  }

  if (reviewSubmitted) {
    return (
      <div className="min-h-screen bg-background">
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link
                href={`/product/${productId}`}
                className="flex items-center gap-2 text-lg font-semibold hover:text-primary"
              >
                <ArrowLeft className="h-5 w-5" />
                Back to Product
              </Link>
              <h1 className="text-2xl font-bold">Review Submitted</h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        <div className="container mx-auto px-4 py-8">
          <div className="max-w-2xl mx-auto">
            <Card>
              <CardHeader className="text-center">
                <div className="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                  <CheckCircle className="h-8 w-8 text-green-600" />
                </div>
                <CardTitle className="text-2xl">Thank You for Your Review!</CardTitle>
                <p className="text-muted-foreground">Your review has been submitted successfully.</p>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="bg-gray-50 p-4 rounded-lg">
                  <div className="flex items-center gap-4 mb-4">
                    <img
                      src={product.image || "/placeholder.svg"}
                      alt={product.name}
                      className="w-16 h-16 object-cover rounded-md"
                    />
                    <div>
                      <h3 className="font-semibold">{product.name}</h3>
                      <div className="flex items-center gap-1">
                        {Array.from({ length: 5 }, (_, i) => (
                          <Star
                            key={i}
                            className={`h-4 w-4 ${i < rating ? "fill-yellow-400 text-yellow-400" : "text-gray-300"}`}
                          />
                        ))}
                        <span className="ml-2 font-semibold">{rating}/5</span>
                      </div>
                    </div>
                  </div>
                  <p className="text-sm text-muted-foreground italic">"{reviewText}"</p>
                </div>

                <div className="space-y-2 text-sm text-muted-foreground">
                  <p>✓ Review saved to database</p>
                  <p>✓ Product rating updated</p>
                  <p>✓ Review count incremented</p>
                  <p>• Review will appear on product page shortly</p>
                </div>

                <div className="flex gap-3">
                  <Link href={`/product/${productId}`} className="flex-1">
                    <Button className="w-full">View Product</Button>
                  </Link>
                  <Link href="/orders" className="flex-1">
                    <Button variant="outline" className="w-full bg-transparent">
                      My Orders
                    </Button>
                  </Link>
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
            <Link
              href={`/product/${productId}`}
              className="flex items-center gap-2 text-lg font-semibold hover:text-primary"
            >
              <ArrowLeft className="h-5 w-5" />
              Back to Product
            </Link>
            <h1 className="text-2xl font-bold">Write a Review</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-2xl mx-auto">
          <Card>
            <CardHeader>
              <CardTitle>Share Your Experience</CardTitle>
              <p className="text-muted-foreground">
                Help other customers by sharing your honest review of this product.
              </p>
            </CardHeader>
            <CardContent className="space-y-6">
              {/* Product Info */}
              <div className="flex items-center gap-4 p-4 bg-gray-50 rounded-lg">
                <img
                  src={product.image || "/placeholder.svg"}
                  alt={product.name}
                  className="w-20 h-20 object-cover rounded-md"
                />
                <div>
                  <h3 className="font-semibold text-lg">{product.name}</h3>
                  <p className="text-sm text-green-600 font-medium">✓ Verified Purchase</p>
                </div>
              </div>

              {/* Rating */}
              <div>
                <Label className="text-base font-semibold">Overall Rating</Label>
                <div className="flex items-center gap-2 mt-2">
                  {Array.from({ length: 5 }, (_, i) => (
                    <button
                      key={i}
                      onClick={() => setRating(i + 1)}
                      onMouseEnter={() => setHoveredRating(i + 1)}
                      onMouseLeave={() => setHoveredRating(0)}
                      className="transition-colors"
                    >
                      <Star
                        className={`h-8 w-8 ${
                          i < (hoveredRating || rating)
                            ? "fill-yellow-400 text-yellow-400"
                            : "text-gray-300 hover:text-yellow-300"
                        }`}
                      />
                    </button>
                  ))}
                  {rating > 0 && <span className="ml-2 text-lg font-semibold">{rating}/5</span>}
                </div>
                {rating > 0 && (
                  <p className="text-sm text-muted-foreground mt-1">
                    {rating === 1 && "Poor"}
                    {rating === 2 && "Fair"}
                    {rating === 3 && "Good"}
                    {rating === 4 && "Very Good"}
                    {rating === 5 && "Excellent"}
                  </p>
                )}
              </div>

              {/* Review Text */}
              <div>
                <Label htmlFor="reviewText" className="text-base font-semibold">
                  Write Your Review
                </Label>
                <Textarea
                  id="reviewText"
                  placeholder="Share your thoughts about this product. What did you like or dislike? How was the quality? Would you recommend it to others?"
                  value={reviewText}
                  onChange={(e) => setReviewText(e.target.value)}
                  rows={6}
                  className="mt-2"
                />
                <p className="text-sm text-muted-foreground mt-1">{reviewText.length}/500 characters</p>
              </div>

              {/* Guidelines */}
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <h4 className="font-medium text-blue-800 mb-2">Review Guidelines</h4>
                <ul className="text-sm text-blue-700 space-y-1">
                  <li>• Be honest and helpful to other customers</li>
                  <li>• Focus on the product features and your experience</li>
                  <li>• Avoid inappropriate language or personal information</li>
                  <li>• Reviews are moderated and may take time to appear</li>
                </ul>
              </div>

              {/* Submit Button */}
              <Button
                onClick={handleSubmitReview}
                disabled={rating === 0 || reviewText.trim().length < 10 || isSubmitting}
                className="w-full"
                size="lg"
              >
                {isSubmitting ? "Submitting Review..." : "Submit Review"}
              </Button>

              {rating === 0 && <p className="text-sm text-red-600 text-center">Please select a rating</p>}
              {reviewText.trim().length < 10 && reviewText.length > 0 && (
                <p className="text-sm text-red-600 text-center">Review must be at least 10 characters long</p>
              )}
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
