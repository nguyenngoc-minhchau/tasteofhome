import { useState, useEffect } from 'react'

export interface User {
  id: string
  email: string
  name: string
  username: string
  role: string
}

interface AuthContextType {
  user: User | null
  isAuthenticated: boolean
  loading: boolean
  logout: () => Promise<void>
}

export function useAuth(): AuthContextType {
  const [user, setUser] = useState<User | null>(null)
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    const validateSession = async () => {
      try {
        const response = await fetch('/api/auth/validate-session')
        if (response.ok) {
          const data = await response.json()
          setUser(data.user)
          setIsAuthenticated(data.isAuthenticated)
        } else {
          setUser(null)
          setIsAuthenticated(false)
        }
      } catch (error) {
        console.error('Session validation error:', error)
        setUser(null)
        setIsAuthenticated(false)
      } finally {
        setLoading(false)
      }
    }

    validateSession()
  }, [])

  const logout = async () => {
    try {
      await fetch('/api/logout', { method: 'POST' })
      setUser(null)
      setIsAuthenticated(false)
      // Reload page để cập nhật state
      window.location.href = '/'
    } catch (error) {
      console.error('Logout error:', error)
    }
  }

  return {
    user,
    isAuthenticated,
    loading,
    logout
  }
}






