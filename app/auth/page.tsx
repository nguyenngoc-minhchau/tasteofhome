
"use client"

import type React from "react"
import { useState } from "react"
import { useEffect } from "react";
import { useRouter } from "next/navigation"
import Link from "next/link"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Alert, AlertDescription } from "@/components/ui/alert"
import { useAuth } from "@/hooks/use-auth"
import { useToast } from "@/hooks/use-toast"
import { ArrowLeft } from "lucide-react"

export default function AuthPage() {
  const [isLoading, setIsLoading] = useState(false)
  const [showForgotPassword, setShowForgotPassword] = useState(false)
  const [resetEmailSent, setResetEmailSent] = useState(false)
  const [resetEmail, setResetEmail] = useState("")
  const [loginData, setLoginData] = useState({ email: "", password: "" })
  const [registerData, setRegisterData] = useState({ 
    name: "", 
    email: "", 
    password: "", 
    confirmPassword: "" 
  })
  const [error, setError] = useState("")
  const { isAuthenticated, user, logout } = useAuth()
  const { toast } = useToast()
  const router = useRouter()
  // Nếu đã đăng nhập thì chuyển về trang chủ
if (isAuthenticated === null) {
  return (
    <div className="min-h-screen flex items-center justify-center">
      <p>Loading...</p>
    </div>
  )
}
useEffect(() => {
  if (isAuthenticated && user) {
    if (user.role === "admin") {
      router.replace("/admin")
    } else if (user.role === "manager") {
      router.replace("/manager")
    } else if (user.role === "staff") {
      router.replace("/staff") 
    } else {
      router.replace("/")
    }
  }
}, [isAuthenticated, user, router])


  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setError("")

    try {
      const response = await fetch("/api/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email: loginData.email,
          password: loginData.password,
        }),
      })

      const data = await response.json()

      if (!response.ok) {
        throw new Error(data.message || "Đăng nhập thất bại")
      }

      toast({
        title: "Đăng nhập thành công!",
        description: "Chào mừng bạn trở lại.",
      })

      // Reload page để cập nhật authentication state
      window.location.href = "/"
    } catch (error) {
      console.error("Login error:", error)
      setError(error instanceof Error ? error.message : "Đăng nhập thất bại")
      toast({
        title: "Đăng nhập thất bại",
        description: error instanceof Error ? error.message : "Có lỗi xảy ra",
        variant: "destructive",
      })
    } finally {
      setIsLoading(false)
    }
  }

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setError("")

    if (registerData.password !== registerData.confirmPassword) {
      setError("Mật khẩu xác nhận không khớp")
      setIsLoading(false)
      return
    }

    try {
      const response = await fetch("/api/register", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name: registerData.name,
          email: registerData.email,
          password: registerData.password,
        }),
      })

      const data = await response.json()

      if (!response.ok) {
        throw new Error(data.message || "Đăng ký thất bại")
      }

      toast({
        title: "Tài khoản đã được tạo!",
        description: "Bạn có thể đăng nhập ngay bây giờ.",
      })

      // Chuyển về tab đăng nhập
      setRegisterData({ name: "", email: "", password: "", confirmPassword: "" })
      setError("")
    } catch (error) {
      console.error("Register error:", error)
      setError(error instanceof Error ? error.message : "Đăng ký thất bại")
      toast({
        title: "Đăng ký thất bại",
        description: error instanceof Error ? error.message : "Có lỗi xảy ra",
        variant: "destructive",
      })
    } finally {
      setIsLoading(false)
    }
  }

  const handleForgotPassword = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)

    try {
      const response = await fetch("/api/auth/reset-password", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email: resetEmail }),
      })

      const data = await response.json()

      if (!response.ok) {
        throw new Error(data.message || "Gửi email reset thất bại")
      }

      setResetEmailSent(true)
      toast({
        title: "Đã gửi link reset!",
        description: "Kiểm tra email của bạn để reset mật khẩu.",
      })
    } catch (error) {
      console.error("Reset password error:", error)
      toast({
        title: "Gửi email reset thất bại",
        description: error instanceof Error ? error.message : "Có lỗi xảy ra",
        variant: "destructive",
      })
    } finally {
      setIsLoading(false)
    }
  }

  const BackToStoreButton = () => (
    <div className="mb-4">
      <Link href="/">
        <Button variant="ghost" className="flex items-center gap-2 text-sm text-muted-foreground hover:text-primary">
          <ArrowLeft className="h-4 w-4" />
          Quay lại cửa hàng
        </Button>
      </Link>
    </div>
  )

  if (showForgotPassword) {
    return (
      <div className="container mx-auto px-4 py-16 max-w-md">
        <BackToStoreButton />
        <Card>
          <CardHeader>
            <CardTitle>Reset mật khẩu</CardTitle>
          </CardHeader>
          <CardContent>
            {!resetEmailSent ? (
              <form onSubmit={handleForgotPassword} className="space-y-4">
                <div>
                  <Label htmlFor="resetEmail">Địa chỉ email</Label>
                  <Input
                    id="resetEmail"
                    type="email"
                    placeholder="Nhập email đã đăng ký"
                    value={resetEmail}
                    onChange={(e) => setResetEmail(e.target.value)}
                    required
                  />
                </div>
                <Button type="submit" className="w-full" disabled={isLoading}>
                  {isLoading ? "Đang gửi..." : "Gửi link reset"}
                </Button>
                <Button type="button" variant="ghost" className="w-full" onClick={() => setShowForgotPassword(false)}>
                  Quay lại đăng nhập
                </Button>
              </form>
            ) : (
              <div className="space-y-4">
                <Alert>
                  <AlertDescription>
                    Chúng tôi đã gửi link reset mật khẩu đến <strong>{resetEmail}</strong>. 
                    Vui lòng kiểm tra email và click vào link để reset mật khẩu.
                  </AlertDescription>
                </Alert>
                <div className="text-sm text-muted-foreground space-y-2">
                  <p>• Link reset sẽ hết hạn sau 1 giờ</p>
                  <p>• Kiểm tra thư mục spam nếu không thấy email</p>
                  <p>• Bạn có thể yêu cầu link mới nếu cần</p>
                </div>
                <Button
                  type="button"
                  variant="outline"
                  className="w-full bg-transparent"
                  onClick={() => {
                    setShowForgotPassword(false)
                    setResetEmailSent(false)
                    setResetEmail("")
                  }}
                >
                  Quay lại đăng nhập
                </Button>
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="container mx-auto px-4 py-16 max-w-md">
      <BackToStoreButton />
      <Tabs defaultValue="login" className="w-full">
        <TabsList className="grid w-full grid-cols-2">
          <TabsTrigger value="login">Đăng nhập</TabsTrigger>
          <TabsTrigger value="register">Đăng ký</TabsTrigger>
        </TabsList>

        <TabsContent value="login">
          <Card>
            <CardHeader>
              <CardTitle>Đăng nhập vào tài khoản</CardTitle>
            </CardHeader>
            <CardContent>
              {error && (
                <Alert variant="destructive" className="mb-4">
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}
              <form onSubmit={handleLogin} className="space-y-4">
                <div>
                  <Label htmlFor="email">Email</Label>
                  <Input 
                    id="email" 
                    type="email" 
                    placeholder="john@example.com" 
                    value={loginData.email}
                    onChange={(e) => setLoginData({ ...loginData, email: e.target.value })}
                    required 
                  />
                </div>
                <div>
                  <Label htmlFor="password">Mật khẩu</Label>
                  <Input 
                    id="password" 
                    type="password" 
                    value={loginData.password}
                    onChange={(e) => setLoginData({ ...loginData, password: e.target.value })}
                    required 
                  />
                </div>
                <Button type="submit" className="w-full" disabled={isLoading}>
                  {isLoading ? "Đang đăng nhập..." : "Đăng nhập"}
                </Button>
                <div className="text-center">
                  <Button type="button" variant="link" className="text-sm" onClick={() => setShowForgotPassword(true)}>
                    Quên mật khẩu?
                  </Button>
                </div>
              </form>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="register">
          <Card>
            <CardHeader>
              <CardTitle>Tạo tài khoản mới</CardTitle>
            </CardHeader>
            <CardContent>
              {error && (
                <Alert variant="destructive" className="mb-4">
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}
              <form onSubmit={handleRegister} className="space-y-4">
                <div>
                  <Label htmlFor="name">Họ và tên</Label>
                  <Input 
                    id="name" 
                    placeholder="Nguyễn Văn A" 
                    value={registerData.name}
                    onChange={(e) => setRegisterData({ ...registerData, name: e.target.value })}
                    required 
                  />
                </div>
                <div>
                  <Label htmlFor="email">Email</Label>
                  <Input 
                    id="email" 
                    type="email" 
                    placeholder="john@example.com" 
                    value={registerData.email}
                    onChange={(e) => setRegisterData({ ...registerData, email: e.target.value })}
                    required 
                  />
                </div>
                <div>
                  <Label htmlFor="password">Mật khẩu</Label>
                  <Input 
                    id="password" 
                    type="password" 
                    value={registerData.password}
                    onChange={(e) => setRegisterData({ ...registerData, password: e.target.value })}
                    required 
                  />
                </div>
                <div>
                  <Label htmlFor="confirmPassword">Xác nhận mật khẩu</Label>
                  <Input 
                    id="confirmPassword" 
                    type="password" 
                    value={registerData.confirmPassword}
                    onChange={(e) => setRegisterData({ ...registerData, confirmPassword: e.target.value })}
                    required 
                  />
                </div>
                <Button type="submit" className="w-full" disabled={isLoading}>
                  {isLoading ? "Đang tạo tài khoản..." : "Tạo tài khoản"}
                </Button>
              </form>
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  )
}