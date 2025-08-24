"use client"

import { useState, useEffect } from "react"
import { useParams, useRouter } from "next/navigation"
import Link from "next/link"
import { ArrowLeft, Star, CheckCircle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Textarea } from "@/components/ui/textarea"
import { Label } from "@/components/ui/label"
import { useAuth } from "@/components/auth-provider"

export default function WriteReviewPage() {
  const { user, isLoggedIn } = useAuth()
  const params = useParams()
  const router = useRouter()
  const productId = params.id

  const [product, setProduct] = useState<any>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState("")
  const [rating, setRating] = useState(0)
  const [hoveredRating, setHoveredRating] = useState(0)
  const [reviewText, setReviewText] = useState("")
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [reviewSubmitted, setReviewSubmitted] = useState(false)
  const [hasPurchased, setHasPurchased] = useState<boolean | null>(null)

  useEffect(() => {
    async function fetchProduct() {
      setLoading(true)
      setError("")

      try {
        const res = await fetch(`/api/product/${productId}`)
        if (!res.ok) throw new Error("Failed to fetch product")
        const data = await res.json()
        setProduct(data.product || {})
      } catch (e: any) {
        setError(e.message || "Failed to load product")
      } finally {
        setLoading(false)
      }
    }

    async function checkHasPurchased() {
      if (!isLoggedIn || !user) {
        setHasPurchased(false)
        return
      }
      try {
        const res = await fetch(`/api/order`) // API lấy đơn hàng của user từ cookie/session
        if (!res.ok) throw new Error("Failed to fetch orders")
        const orders = await res.json()

        const purchased = orders.some((order: any) =>
          order.items?.some((item: any) => item.id === Number(productId))
        )
        setHasPurchased(purchased)
      } catch {
        setHasPurchased(false)
      }
    }

    if (productId) fetchProduct()
    if (isLoggedIn) checkHasPurchased()
  }, [productId, isLoggedIn, user])

  const handleSubmitReview = async () => {
    if (!isLoggedIn || !user) {
      alert("Bạn phải đăng nhập để gửi review.")
      return
    }
    if (hasPurchased === false) {
      alert("Bạn phải mua sản phẩm mới được gửi review.")
      return
    }
    if (rating === 0 || reviewText.trim().length < 10) return
    setIsSubmitting(true)

    try {
      const response = await fetch("/api/reviews", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          product_id: productId,
          user_id: user.id,
          star_id: rating,
          title: reviewText.substring(0, 50),
          brief: reviewText,
          image: "",
        }),
      })

      if (!response.ok) {
        const err = await response.json()
        throw new Error(err.message || "Failed to submit review")
      }

      setReviewSubmitted(true)
    } catch (err: any) {
      alert(err.message)
    } finally {
      setIsSubmitting(false)
    }
  }

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center text-lg">Loading product...</div>
  }

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center text-center p-4">
        <p className="text-red-600 mb-4">{error}</p>
        <Link href="/">
          <Button>Back to Home</Button>
        </Link>
      </div>
    )
  }

  if (reviewSubmitted) {
    return (
      <div className="min-h-screen bg-background">
        <header className="border-b">
          <div className="container mx-auto px-4 py-4 flex items-center justify-between">
            <Link href={`/product/${productId}`} className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" /> Back to Product
            </Link>
            <h1 className="text-2xl font-bold">Review Submitted</h1>
            <div className="w-24" />
          </div>
        </header>

        <div className="container mx-auto px-4 py-8 max-w-2xl">
          <Card>
            <CardHeader className="text-center">
              <div className="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                <CheckCircle className="h-8 w-8 text-green-600" />
              </div>
              <CardTitle className="text-2xl">Thank You for Your Review!</CardTitle>
              <p className="text-muted-foreground">Your review has been submitted successfully.</p>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="bg-gray-50 p-4 rounded-lg flex items-center gap-4">
                <img src={product.image || "/placeholder.svg"} alt={product.title} className="w-16 h-16 object-cover rounded-md" />
                <div>
                  <h3 className="font-semibold">{product.title}</h3>
                  <div className="flex items-center gap-1">
                    {Array.from({ length: 5 }, (_, i) => (
                      <Star key={i} className={`h-4 w-4 ${i < rating ? "fill-yellow-400 text-yellow-400" : "text-gray-300"}`} />
                    ))}
                    <span className="ml-2 font-semibold">{rating}/5</span>
                  </div>
                </div>
              </div>

              <p className="text-sm text-muted-foreground italic">"{reviewText}"</p>

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
    )
  }

  return (
    <div className="min-h-screen bg-background">
      <header className="border-b">
        <div className="container mx-auto px-4 py-4 flex items-center justify-between">
          <Link href={`/product/${productId}`} className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
            <ArrowLeft className="h-5 w-5" />
            Back to Product
          </Link>
          <h1 className="text-2xl font-bold">Write a Review</h1>
          <div className="w-24" />
        </div>
      </header>

      <div className="container mx-auto px-4 py-8 max-w-2xl">
        <Card>
          <CardHeader>
            <CardTitle>Share Your Experience</CardTitle>
            <p className="text-muted-foreground">Help other customers by sharing your honest review of this product.</p>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="flex items-center gap-4 p-4 bg-gray-50 rounded-lg">
              <img src={product.image || "/placeholder.svg"} alt={product.title} className="w-20 h-20 object-cover rounded-md" />
              <div>
                <h3 className="font-semibold text-lg">{product.title}</h3>
                <p className="text-sm text-green-600 font-medium">✓ Verified Purchase</p>
              </div>
            </div>

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
                {rating === 0 && <p className="text-sm text-red-600 mt-1">Please select a rating</p>}
                {rating > 0 && <span className="ml-2 text-lg font-semibold">{rating}/5</span>}
              </div>
            </div>

            <div>
              <Label htmlFor="reviewText" className="text-base font-semibold">Write Your Review</Label>
              <Textarea
                id="reviewText"
                placeholder="Share your thoughts about this product. What did you like or dislike? How was the quality? Would you recommend it to others?"
                value={reviewText}
                onChange={(e) => setReviewText(e.target.value)}
                rows={6}
                className="mt-2"
              />
              {reviewText.trim().length > 0 && reviewText.trim().length < 10 && (
                <p className="text-sm text-red-600 mt-1">Review must be at least 10 characters long</p>
              )}
            </div>

            <Button
              onClick={handleSubmitReview}
              disabled={rating === 0 || reviewText.trim().length < 10 || isSubmitting || hasPurchased === false}
              className="w-full"
              size="lg"
              title={hasPurchased === false ? "You must purchase this product to submit a review" : undefined}
            >
              {isSubmitting ? "Submitting Review..." : "Submit Review"}
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
