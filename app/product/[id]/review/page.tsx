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

  useEffect(() => {
    async function fetchProduct() {
      setLoading(true)
      setError("")

      try {
        const res = await fetch(`/api/product/${productId}`)
        if (!res.ok) throw new Error("Không thể lấy thông tin sản phẩm")
        const data = await res.json()
        setProduct(data.product || {})
      } catch (e: any) {
        setError(e.message || "Không thể tải sản phẩm")
      } finally {
        setLoading(false)
      }
    }

    if (productId) fetchProduct()
  }, [productId])

  const handleSubmitReview = async () => {
    if (!isLoggedIn || !user) {
      alert("Bạn phải đăng nhập để gửi đánh giá.")
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
        throw new Error(err.message || "Gửi đánh giá thất bại")
      }

      setReviewSubmitted(true)
    } catch (err: any) {
      alert(err.message)
    } finally {
      setIsSubmitting(false)
    }
  }

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center text-lg">Đang tải sản phẩm...</div>
  }

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center text-center p-4">
        <p className="text-red-600 mb-4">{error}</p>
        <Link href="/">
          <Button>Trở về trang chủ</Button>
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
              <ArrowLeft className="h-5 w-5" /> Trở về sản phẩm
            </Link>
            <h1 className="text-2xl font-bold">Đã gửi đánh giá</h1>
            <div className="w-24" />
          </div>
        </header>

        <div className="container mx-auto px-4 py-8 max-w-2xl">
          <Card>
            <CardHeader className="text-center">
              <div className="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                <CheckCircle className="h-8 w-8 text-green-600" />
              </div>
              <CardTitle className="text-2xl">Cảm ơn bạn đã đánh giá!</CardTitle>
              <p className="text-muted-foreground">Đánh giá của bạn đã được gửi thành công.</p>
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
                <p>✓ Đánh giá đã lưu vào cơ sở dữ liệu</p>
                <p>✓ Đã cập nhật điểm đánh giá sản phẩm</p>
                <p>✓ Đếm số lượng đánh giá tăng</p>
                <p>• Đánh giá sẽ sớm hiển thị trên trang sản phẩm</p>
              </div>

              <div className="flex gap-3">
                <Link href={`/product/${productId}`} className="flex-1">
                  <Button className="w-full">Xem sản phẩm</Button>
                </Link>
                <Link href="/orders" className="flex-1">
                  <Button variant="outline" className="w-full bg-transparent">
                    Đơn hàng của tôi
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
            Trở về sản phẩm
          </Link>
          <h1 className="text-2xl font-bold">Viết đánh giá</h1>
          <div className="w-24" />
        </div>
      </header>

      <div className="container mx-auto px-4 py-8 max-w-2xl">
        <Card>
          <CardHeader>
            <CardTitle>Chia sẻ trải nghiệm của bạn</CardTitle>
            <p className="text-muted-foreground">Hãy giúp khách hàng khác bằng cách chia sẻ đánh giá chân thực về sản phẩm này.</p>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="flex items-center gap-4 p-4 bg-gray-50 rounded-lg">
              <img src={product.image || "/placeholder.svg"} alt={product.title} className="w-20 h-20 object-cover rounded-md" />
              <div>
                <h3 className="font-semibold text-lg">{product.title}</h3>
                {/* Đã bỏ phần verified purchase */}
              </div>
            </div>

            <div>
              <Label className="text-base font-semibold">Đánh giá tổng thể</Label>
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
                {rating === 0 && <p className="text-sm text-red-600 mt-1">Vui lòng chọn số sao</p>}
                {rating > 0 && <span className="ml-2 text-lg font-semibold">{rating}/5</span>}
              </div>
            </div>

            <div>
              <Label htmlFor="reviewText" className="text-base font-semibold">Viết đánh giá của bạn</Label>
              <Textarea
                id="reviewText"
                placeholder="Chia sẻ cảm nhận của bạn về sản phẩm. Bạn thích hay không thích điều gì? Chất lượng ra sao? Bạn có muốn giới thiệu không?"
                value={reviewText}
                onChange={(e) => setReviewText(e.target.value)}
                rows={6}
                className="mt-2"
              />
              {reviewText.trim().length > 0 && reviewText.trim().length < 10 && (
                <p className="text-sm text-red-600 mt-1">Đánh giá phải ít nhất 10 ký tự</p>
              )}
            </div>

            <Button
              onClick={handleSubmitReview}
              disabled={rating === 0 || reviewText.trim().length < 10 || isSubmitting}
              className="w-full"
              size="lg"
            >
              {isSubmitting ? "Đang gửi đánh giá..." : "Gửi đánh giá"}
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
