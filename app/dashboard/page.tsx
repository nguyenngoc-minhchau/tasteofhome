"use client"

import { useEffect } from "react"
import { useRouter } from "next/navigation"
import { useAuth } from "@/hooks/use-auth"

export default function ProfilePage() {
  const router = useRouter()
  const { user, loading } = useAuth()

  useEffect(() => {
    if (loading) return

    if (!user || !user.role) {
      router.push("/") // chua dang nhap thi ve trang chu
      return
    }

    const roleRoutes: Record<string, string> = {
      admin: "/admin",
      staff: "/staff/dashboard",
      manager: "/manager",
    }

    const targetRoute = roleRoutes[user.role]

    if (targetRoute) {
      router.push(targetRoute)
    }
    
  }, [user, loading, router])

  return <p>Redirecting to your dashboard, please wait...</p>
}