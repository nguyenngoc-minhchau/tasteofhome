"use client"

import type React from "react"

import { useState, useEffect } from "react"
import { useRouter, useSearchParams } from "next/navigation"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Alert, AlertDescription } from "@/components/ui/alert"
import { CheckCircle, XCircle, Eye, EyeOff } from "lucide-react"
import { useToast } from "@/hooks/use-toast"
import Link from "next/link"

export default function ResetPasswordPage() {
  const [isLoading, setIsLoading] = useState(false)
  const [isValidating, setIsValidating] = useState(true)
  const [isValidToken, setIsValidToken] = useState(false)
  const [password, setPassword] = useState("")
  const [confirmPassword, setConfirmPassword] = useState("")
  const [showPassword, setShowPassword] = useState(false)
  const [showConfirmPassword, setShowConfirmPassword] = useState(false)
  const [passwordResetSuccess, setPasswordResetSuccess] = useState(false)
  const [validationErrors, setValidationErrors] = useState<string[]>([])

  const router = useRouter()
  const searchParams = useSearchParams()
  const { toast } = useToast()

  const token = searchParams.get("token")
  const email = searchParams.get("email")

  useEffect(() => {
    // Validate reset token on component mount
    const validateToken = async () => {
      if (!token || !email) {
        setIsValidToken(false)
        setIsValidating(false)
        return
      }

      // Simulate token validation
      await new Promise((resolve) => setTimeout(resolve, 1500))

      // For demo purposes, consider token valid if it exists
      // In real implementation, this would validate against backend
      setIsValidToken(true)
      setIsValidating(false)
    }

    validateToken()
  }, [token, email])

  const validatePassword = (pwd: string): string[] => {
    const errors: string[] = []

    if (pwd.length < 8) {
      errors.push("Password must be at least 8 characters long")
    }
    if (!/(?=.*[a-z])/.test(pwd)) {
      errors.push("Password must contain at least one lowercase letter")
    }
    if (!/(?=.*[A-Z])/.test(pwd)) {
      errors.push("Password must contain at least one uppercase letter")
    }
    if (!/(?=.*\d)/.test(pwd)) {
      errors.push("Password must contain at least one number")
    }
    if (!/(?=.*[@$!%*?&])/.test(pwd)) {
      errors.push("Password must contain at least one special character")
    }

    return errors
  }

  const handlePasswordChange = (newPassword: string) => {
    setPassword(newPassword)
    const errors = validatePassword(newPassword)
    setValidationErrors(errors)
  }

  const handleResetPassword = async (e: React.FormEvent) => {
    e.preventDefault()

    // Validate passwords match
    if (password !== confirmPassword) {
      toast({
        title: "Passwords don't match",
        description: "Please make sure both passwords are identical.",
        variant: "destructive",
      })
      return
    }

    // Validate password strength
    const errors = validatePassword(password)
    if (errors.length > 0) {
      toast({
        title: "Password requirements not met",
        description: "Please check the password requirements below.",
        variant: "destructive",
      })
      return
    }

    setIsLoading(true)

    try {
      // Simulate password update
      await new Promise((resolve) => setTimeout(resolve, 2000))

      setPasswordResetSuccess(true)

      toast({
        title: "Password reset successful!",
        description: "Your password has been updated successfully.",
      })

      // Redirect to login after 3 seconds
      setTimeout(() => {
        router.push("/auth")
      }, 3000)
    } catch (error) {
      toast({
        title: "Reset failed",
        description: "Something went wrong. Please try again.",
        variant: "destructive",
      })
    } finally {
      setIsLoading(false)
    }
  }

  if (isValidating) {
    return (
      <div className="container mx-auto px-4 py-16 max-w-md">
        <Card>
          <CardContent className="p-8 text-center">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary mx-auto mb-4"></div>
            <p className="text-muted-foreground">Validating reset link...</p>
          </CardContent>
        </Card>
      </div>
    )
  }

  if (!isValidToken) {
    return (
      <div className="container mx-auto px-4 py-16 max-w-md">
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2 text-destructive">
              <XCircle className="h-5 w-5" />
              Invalid Reset Link
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <Alert variant="destructive">
              <AlertDescription>
                This password reset link is invalid or has expired. Reset links are only valid for 1 hour.
              </AlertDescription>
            </Alert>
            <div className="space-y-2">
              <Link href="/auth">
                <Button className="w-full">Back to Login</Button>
              </Link>
              <p className="text-sm text-muted-foreground text-center">
                Need a new reset link?{" "}
                <Link href="/auth" className="text-primary hover:underline">
                  Request password reset
                </Link>
              </p>
            </div>
          </CardContent>
        </Card>
      </div>
    )
  }

  if (passwordResetSuccess) {
    return (
      <div className="container mx-auto px-4 py-16 max-w-md">
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2 text-green-600">
              <CheckCircle className="h-5 w-5" />
              Password Reset Successful
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <Alert className="border-green-200 bg-green-50">
              <AlertDescription className="text-green-800">
                Your password has been successfully updated. You can now log in with your new password.
              </AlertDescription>
            </Alert>
            <div className="text-center">
              <p className="text-sm text-muted-foreground mb-4">Redirecting to login page in a few seconds...</p>
              <Link href="/auth">
                <Button className="w-full">Go to Login</Button>
              </Link>
            </div>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="container mx-auto px-4 py-16 max-w-md">
      <Card>
        <CardHeader>
          <CardTitle>Set New Password</CardTitle>
          <p className="text-sm text-muted-foreground">
            Resetting password for: <strong>{email}</strong>
          </p>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleResetPassword} className="space-y-4">
            <div>
              <Label htmlFor="password">New Password</Label>
              <div className="relative">
                <Input
                  id="password"
                  type={showPassword ? "text" : "password"}
                  value={password}
                  onChange={(e) => handlePasswordChange(e.target.value)}
                  placeholder="Enter your new password"
                  required
                />
                <Button
                  type="button"
                  variant="ghost"
                  size="icon"
                  className="absolute right-0 top-0 h-full px-3 py-2 hover:bg-transparent"
                  onClick={() => setShowPassword(!showPassword)}
                >
                  {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                </Button>
              </div>
            </div>

            <div>
              <Label htmlFor="confirmPassword">Confirm New Password</Label>
              <div className="relative">
                <Input
                  id="confirmPassword"
                  type={showConfirmPassword ? "text" : "password"}
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  placeholder="Confirm your new password"
                  required
                />
                <Button
                  type="button"
                  variant="ghost"
                  size="icon"
                  className="absolute right-0 top-0 h-full px-3 py-2 hover:bg-transparent"
                  onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                >
                  {showConfirmPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                </Button>
              </div>
            </div>

            {/* Password Requirements */}
            <div className="space-y-2">
              <Label className="text-sm font-medium">Password Requirements:</Label>
              <div className="space-y-1">
                {[
                  { text: "At least 8 characters", valid: password.length >= 8 },
                  { text: "One lowercase letter", valid: /(?=.*[a-z])/.test(password) },
                  { text: "One uppercase letter", valid: /(?=.*[A-Z])/.test(password) },
                  { text: "One number", valid: /(?=.*\d)/.test(password) },
                  { text: "One special character", valid: /(?=.*[@$!%*?&])/.test(password) },
                ].map((req, index) => (
                  <div key={index} className="flex items-center gap-2 text-sm">
                    {req.valid ? (
                      <CheckCircle className="h-4 w-4 text-green-500" />
                    ) : (
                      <XCircle className="h-4 w-4 text-gray-300" />
                    )}
                    <span className={req.valid ? "text-green-600" : "text-muted-foreground"}>{req.text}</span>
                  </div>
                ))}
              </div>
            </div>

            {/* Password Match Indicator */}
            {confirmPassword && (
              <div className="flex items-center gap-2 text-sm">
                {password === confirmPassword ? (
                  <>
                    <CheckCircle className="h-4 w-4 text-green-500" />
                    <span className="text-green-600">Passwords match</span>
                  </>
                ) : (
                  <>
                    <XCircle className="h-4 w-4 text-red-500" />
                    <span className="text-red-600">Passwords don't match</span>
                  </>
                )}
              </div>
            )}

            <Button
              type="submit"
              className="w-full"
              disabled={isLoading || validationErrors.length > 0 || password !== confirmPassword}
            >
              {isLoading ? "Updating password..." : "Update Password"}
            </Button>

            <div className="text-center">
              <Link href="/auth">
                <Button type="button" variant="ghost" className="text-sm">
                  Back to Login
                </Button>
              </Link>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}
