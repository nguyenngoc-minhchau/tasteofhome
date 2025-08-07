"use client"

import { createContext, useContext, useState, useEffect, type ReactNode } from "react"

export interface User {
  id: string
  email: string
  name: string
  role: "admin" | "manager" | "staff" | "customer"
  // avatarUrl?: string
}

interface AuthContextType {
  user: User | null
  isLoggedIn: boolean
  loading: boolean
  login: (user: User) => void
  logout: () => void
}

const AuthContext = createContext<AuthContextType | null>(null)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [isLoggedIn, setIsLoggedIn] = useState(false)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (typeof window !== 'undefined') {
      const storedUser = localStorage.getItem('currentUser')
      if (storedUser) {
        try {
          const parsedUser: User = JSON.parse(storedUser)
          setUser(parsedUser)
          setIsLoggedIn(true)
        } catch (error) {
          console.error("Failed to parse user data from localStorage:", error)
          localStorage.removeItem('currentUser')
          setUser(null)
          setIsLoggedIn(false)
        }
      }
      setLoading(false)
    }
  }, [])

  const login = (userData: User) => {
    setUser(userData)
    setIsLoggedIn(true)
    if (typeof window !== 'undefined') {
      localStorage.setItem('currentUser', JSON.stringify(userData))
    }
  }

  const logout = () => {
    setUser(null)
    setIsLoggedIn(false)
    if (typeof window !== 'undefined') {
      localStorage.removeItem('currentUser')
    }
  }

  return (
    <AuthContext.Provider value={{ user, isLoggedIn, loading, login, logout }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider")
  }
  return context
}