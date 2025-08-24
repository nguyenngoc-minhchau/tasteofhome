"use client"

import Image from "next/image"
import { useEffect, useState } from "react"
import { useParams } from "next/navigation"
import Link from "next/link"
import { Loader2, ArrowLeft, ShoppingCart, CheckCircle, Star } from "lucide-react"
import { Button } from "@/components/ui/button"
import { useCart } from "@/contexts/cart-context"
import { MiniCart } from "@/components/mini-cart"

export default function ProductDetailPage() {
  const { id } = useParams()
  const [product, setProduct] = useState<any>(null)
  const [relatedProducts, setRelatedProducts] = useState<any[]>([])
  const [reviews, setReviews] = useState<any[]>([])
  const [loading, setLoading] = useState(true)

  const { state: cartState, dispatch: cartDispatch } = useCart()
  const [addedProductIds, setAddedProductIds] = useState<number[]>([])
  const [loadingProductIds, setLoadingProductIds] = useState<number[]>([])
  const [openMiniCartTrigger, setOpenMiniCartTrigger] = useState<number | null>(null)

  // Tính trung bình đánh giá
  const averageRating = reviews.length
    ? reviews.reduce((sum, r) => sum + r.star_id, 0) / reviews.length
    : 0

  useEffect(() => {
    setLoading(true)
    setProduct(null)
    setRelatedProducts([])
    setReviews([])
    const fetchProduct = async () => {
      try {
        const res = await fetch(`/api/product/${id}`)
        if (!res.ok) throw new Error("Không thể lấy thông tin sản phẩm")
        const data = await res.json()
        setProduct(data)
        setRelatedProducts(data.relatedProducts || [])

        if (id) {
          const reviewsRes = await fetch(`/api/reviews?product_id=${id}`)
          if (reviewsRes.ok) {
            const revs = await reviewsRes.json()
            setReviews(revs)
          }
        }
      } catch (err) {
        console.error(err)
      } finally {
        setLoading(false)
      }
    }

    if (id) fetchProduct()
  }, [id])

  const handleAddToCart = (product: any) => {
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
          image: product.image || "/placeholder.png",
          category: product.category || "",
          stock: 50,
        },
      })
      setLoadingProductIds((prev) => prev.filter((id) => id !== product.id))
      setAddedProductIds((prev) => [...prev, product.id])
      setOpenMiniCartTrigger(product.id) // trigger mở mini-cart
      setTimeout(() => setAddedProductIds((prev) => prev.filter((id) => id !== product.id)), 700)
    }, 700)
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <Loader2 className="h-6 w-6 animate-spin" />
        <span className="ml-2">Đang tải...</span>
      </div>
    )
  }

  if (!product) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Không tìm thấy sản phẩm</h1>
          <Link href="/">
            <Button>
              <ArrowLeft className="mr-2 h-4 w-4" /> Trở về trang chính
            </Button>
          </Link>
        </div>
      </div>
    )
  }

  return (
    <>
      <div className="container mx-auto px-4 py-8">
        <div className="mb-6">
          <Link href="/">
            <Button variant="ghost" size="sm">
              <ArrowLeft className="mr-2 h-4 w-4" /> Trở về trang chính
            </Button>
          </Link>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {/* Ảnh sản phẩm */}
          <div className="aspect-square rounded-2xl overflow-hidden border bg-gray-100">
          <Image
            src={`/${product.image}`}
            alt={product.title ?? "Product"}
            width={600} 
            height={600}
          className="w-full h-full object-cover"
          />
        </div>

          {/* Thông tin sản phẩm */}
          <div>
            <h1 className="text-3xl font-bold mb-4">{product.title}</h1>
            <p className="text-lg text-muted-foreground mb-6">{product.category}</p>
            <div className="text-2xl font-bold text-primary mb-6">
              {product.price.toLocaleString("vi-VN")} ₫
            </div>

            {product.brief && (
              <div
                className="text-muted-foreground mb-6 space-y-2"
                dangerouslySetInnerHTML={{ __html: product.brief }}
              />
            )}

            <p className="text-muted-foreground mb-6">
              Dung tích: {product.capacityTitle ? `${product.capacityTitle} ` : ""}{product.capacity ?? ""}
            </p>

            <Button
              className="w-full justify-center"
              onClick={() => handleAddToCart(product)}
              disabled={loadingProductIds.includes(product.id) || addedProductIds.includes(product.id)}
            >
              {loadingProductIds.includes(product.id) ? (
                <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white" />
              ) : addedProductIds.includes(product.id) ? (
                <>
                  <CheckCircle className="h-4 w-4 mr-1" />
                  Đã thêm vào giỏ
                </>
              ) : (
                <>
                  <ShoppingCart className="h-4 w-4 mr-1" />
                  Thêm vào giỏ
                </>
              )}
            </Button>

            {/* Đánh giá trung bình */}
            <div className="mt-6">
              <h2 className="text-xl font-semibold mb-2">Đánh giá khách hàng</h2>
              <div className="flex items-center gap-2">
                {[...Array(5)].map((_, i) => (
                  <Star
                    key={i}
                    className={`h-6 w-6 ${
                      i < Math.round(averageRating)
                        ? "fill-yellow-400 text-yellow-400"
                        : "text-gray-300"
                    }`}
                  />
                ))}
                <span className="font-semibold text-lg">{averageRating.toFixed(1)}</span>
                <span className="text-muted-foreground">({reviews.length} đánh giá)</span>
              </div>

              {/* Nút chuyển sang trang review */}
              <div className="mt-4">
                <Link href={`/product/${id}/review`}>
                  <Button variant="outline" className="w-full">
                    Viết đánh giá
                  </Button>
                </Link>
              </div>
            </div>

            {/* Hiển thị review chi tiết nếu có */}
            <div className="mt-4">
              {reviews.length === 0 ? (
                <p className="text-muted-foreground">Chưa có đánh giá nào.</p>
              ) : (
                reviews.map((review) => (
                  <div key={review.id} className="my-4 border p-4 rounded-lg bg-white shadow-sm">
                    <div className="flex items-center gap-2 mb-2">
                      {[...Array(5)].map((_, i) => (
                        <Star
                          key={i}
                          className={`h-5 w-5 ${
                            i < review.star_id ? "fill-yellow-400 text-yellow-400" : "text-gray-300"
                          }`}
                        />
                      ))}
                      <span className="text-muted-foreground text-sm">
                        {new Date(review.created_at).toLocaleDateString()}
                      </span>
                    </div>
                    <h3 className="font-semibold">{review.title}</h3>
                    <p className="mt-1">{review.brief}</p>
                  </div>
                ))
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Mini Cart */}
      <MiniCart openTrigger={openMiniCartTrigger} />

      {/* Sản phẩm liên quan */}
      {relatedProducts.length > 0 && (
        <div className="container mx-auto px-4 py-8 mt-12">
          <h2 className="text-2xl font-bold mb-6">Sản phẩm liên quan</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            {relatedProducts.map((rp: any) => (
              <Link key={rp.id} href={`/product/${rp.id}`} className="block">
                <div className="rounded-2xl overflow-hidden border shadow-sm hover:shadow-lg transition bg-white">
                  <div className="w-full h-48 bg-gray-100 flex items-center justify-center overflow-hidden">
                    <Image
                      src={`/${rp.image}`} 
                      alt={rp.title ?? "Product"}
                      width={300}
                      height={200}
                      className="w-full h-full object-cover"
                    />
                  </div>

                  <div className="p-4">
                    <h3 className="font-semibold text-lg mb-1 text-black">{rp.title}</h3>
                    <p className="text-sm text-gray-600 mb-2">{rp.category}</p>
                    <p className="font-bold text-black">{rp.price.toLocaleString("vi-VN")} ₫</p>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      )}
    </>
  )
}
