"use client"

import { useEffect } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { CheckCircle } from "lucide-react"
import Link from "next/link"

export default function ResetSuccessPage() {
  const router = useRouter()

  useEffect(() => {
    // Auto-redirect to login after 5 seconds
    const timer = setTimeout(() => {
      router.push("/auth")
    }, 5000)

    return () => clearTimeout(timer)
  }, [router])

  return (
    <div className="container mx-auto px-4 py-16 max-w-md">
      <Card>
        <CardHeader className="text-center">
          <div className="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-green-100">
            <CheckCircle className="h-6 w-6 text-green-600" />
          </div>
          <CardTitle className="text-green-600">Password Reset Complete!</CardTitle>
        </CardHeader>
        <CardContent className="text-center space-y-4">
          <p className="text-muted-foreground">
            Your password has been successfully updated. You can now log in to your WorldTaste account with your new
            password.
          </p>

          <div className="space-y-2">
            <Link href="/auth">
              <Button className="w-full">Continue to Login</Button>
            </Link>
            <p className="text-sm text-muted-foreground">Redirecting automatically in 5 seconds...</p>
          </div>

          <div className="pt-4 border-t">
            <p className="text-xs text-muted-foreground">
              For your security, make sure to log out of all devices and log back in with your new password.
            </p>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
