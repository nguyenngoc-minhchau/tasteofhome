"use client"

import { useAuth } from "@/components/auth-provider"
import { useRouter } from "next/navigation"
import { useState, useEffect } from "react"
import Link from "next/link"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { Calendar } from "lucide-react"
import { toast } from "sonner"

// Mock data cho wishlist
const mockWishlistItems = [
  { id: "p1", name: "Premium Ethiopian Coffee Beans", price: 24.99, imageUrl: "https://via.placeholder.com/150" },
  { id: "p2", name: "Organic Green Tea", price: 18.75, imageUrl: "https://via.placeholder.com/150" },
  { id: "p3", name: "French Lavender Oil", price: 45.00, imageUrl: "https://via.placeholder.com/150" },
]

export default function ProfilePage() {
  const { user, loading } = useAuth()
  const router = useRouter()

  const [formData, setFormData] = useState({
    firstName: "",
    lastName: "",
    birthDate: "",
    email: "",
    address: "",
    phone: "",
    password: "",
    confirmPassword: "",
    notifications: true,
  })

  // State moi de quan ly wishlist (mock)
  const [wishlistItems, setWishlistItems] = useState(mockWishlistItems)

  useEffect(() => {
    // Neu khong dang nhap va khong dang loading, chuyen huong ve trang chu
    if (!loading && !user) {
      router.push("/")
    } else if (user) {
      // Set thong tin ca nhan vao form
      const [first, last] = user.name?.split(" ") || ["", ""]
      setFormData({
        firstName: first,
        lastName: last,
        birthDate: "",
        email: user.email,
        address: "",
        phone: "",
        password: "",
        confirmPassword: "",
        notifications: true,
      })
    }
  }, [user, loading, router])

  const handleChange = (field: string, value: string | boolean) => {
    setFormData((prev) => ({ ...prev, [field]: value }))
  }

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()

    if (formData.password !== formData.confirmPassword) {
      toast.error("Passwords do not match")
      return
    }

    // TODO: Submit form data
    toast.success("Profile updated!")
  }
  
  // Ham xu ly xoa san pham khoi wishlist (mock)
  const handleRemoveFromWishlist = (productId: string) => {
    setWishlistItems(prevItems => prevItems.filter(item => item.id !== productId));
    toast.info("Item removed from wishlist.");
  };

  // Ham xu ly them vao gio hang (mock)
  const handleAddToCart = (productId: string) => {
    // TODO: Thuc hien logic them vao gio hang that su
    toast.success("Item added to cart!");
  };

  if (loading) return <p>Loading profile...</p>

  // Chi hien thi noi dung trang khi da dang nhap va thong tin user da co
  if (!user) return null;


  return (
    <div className="max-w-2xl mx-auto p-6 space-y-8">
      <h2 className="text-3xl font-bold">Your Profile</h2>
      <form onSubmit={handleSubmit} className="space-y-6">
        {/* Thong tin ca nhan */}
        <div className="grid grid-cols-2 gap-4">
          <div>
            <Label>First Name</Label>
            <Input value={formData.firstName} onChange={(e) => handleChange("firstName", e.target.value)} />
          </div>
          <div>
            <Label>Last Name</Label>
            <Input value={formData.lastName} onChange={(e) => handleChange("lastName", e.target.value)} />
          </div>
        </div>

        <div>
          <Label>Date of Birth</Label>
          <div className="relative">
            <Input type="date" value={formData.birthDate} onChange={(e) => handleChange("birthDate", e.target.value)} />
            <Calendar className="absolute right-2 top-2 h-4 w-4 text-muted-foreground" />
          </div>
        </div>

        <div>
          <Label>Email</Label>
          <Input type="email" value={formData.email} onChange={(e) => handleChange("email", e.target.value)} />
        </div>

        <div>
          <Label>Address</Label>
          <Input value={formData.address} onChange={(e) => handleChange("address", e.target.value)} />
        </div>

        <div>
          <Label>Phone</Label>
          <Input value={formData.phone} onChange={(e) => handleChange("phone", e.target.value)} />
        </div>

        <Separator />

        {/* Mat khau */}
        <h3 className="text-xl font-semibold">Change Password</h3>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <Label>New Password</Label>
            <Input type="password" value={formData.password} onChange={(e) => handleChange("password", e.target.value)} />
          </div>
          <div>
            <Label>Confirm Password</Label>
            <Input type="password" value={formData.confirmPassword} onChange={(e) => handleChange("confirmPassword", e.target.value)} />
          </div>
        </div>

        <Button type="submit">Update Profile</Button>
      </form>

      <Separator />

      {/* Thong bao */}
      <div>
        <h3 className="text-xl font-semibold">Notification Settings</h3>
        <Label className="flex items-center gap-2">
          <input
            type="checkbox"
            checked={formData.notifications}
            onChange={(e) => handleChange("notifications", e.target.checked)}
          />
          Receive updates via email (orders, promos, account)
        </Label>
      </div>

      {/* Cac muc chi danh cho role 'customer' */}
      {user?.role === "customer" && (
        <>
          <Separator />
          
          {/* Wishlist */}
          <div className="space-y-4">
            <h3 className="text-xl font-semibold">My Wishlist</h3>
            {wishlistItems.length > 0 ? (
              <div className="space-y-4">
                {wishlistItems.map((item) => (
                  <div key={item.id} className="flex items-center gap-4 border p-4 rounded-md">
                    <img src={item.imageUrl} alt={item.name} className="h-16 w-16 object-cover rounded-md" />
                    <div className="flex-1">
                      <p className="font-semibold">{item.name}</p>
                      <p className="text-muted-foreground">${item.price.toFixed(2)}</p>
                    </div>
                    <div className="flex flex-col gap-2">
                      <Button variant="outline" onClick={() => handleAddToCart(item.id)}>Add to Cart</Button>
                      <Button variant="ghost" className="text-red-500" onClick={() => handleRemoveFromWishlist(item.id)}>Remove</Button>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <p className="text-muted-foreground">Your wishlist is empty.</p>
            )}
            <Link href="/" className="text-blue-600 hover:underline block mt-4">
              Continue Shopping
            </Link>
          </div>

          <Separator />

          {/* Ho tro khach hang */}
          <div className="space-y-2">
            <h3 className="text-xl font-semibold">Customer Support</h3>
            <Link href="/support/tickets" className="text-blue-600 hover:underline block">My Tickets</Link>
            <Link href="/support/new-ticket" className="text-blue-600 hover:underline block">Submit New Ticket</Link>
          </div>

          <Separator />

          {/* Lich su mua hang */}
          <div className="space-y-2">
            <h3 className="text-xl font-semibold">Purchase History</h3>
            <Link href="/orders/history" className="text-blue-600 hover:underline block">Order History</Link>
            <Link href="/orders/purchased" className="text-blue-600 hover:underline block">My Purchased Items</Link>
          </div>
        </>
      )}
    </div>
  )
}