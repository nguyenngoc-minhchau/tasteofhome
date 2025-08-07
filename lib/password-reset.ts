// Utility functions for password reset functionality
// In a real application, these would interact with your backend API

export interface ResetToken {
  token: string
  email: string
  expiresAt: Date
  used: boolean
}

export class PasswordResetService {
  // Generate a secure reset token
  static generateResetToken(): string {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    let token = ""
    for (let i = 0; i < 32; i++) {
      token += chars.charAt(Math.floor(Math.random() * chars.length))
    }
    return token
  }

  // Validate email format
  static isValidEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(email)
  }

  // Check if user exists (mock implementation)
  static async checkUserExists(email: string): Promise<boolean> {
    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 500))

    // For demo purposes, assume user exists if email is valid
    return this.isValidEmail(email)
  }

  // Generate reset URL
  static generateResetUrl(token: string, email: string, baseUrl = "http://localhost:3000"): string {
    const params = new URLSearchParams({
      token,
      email,
    })
    return `${baseUrl}/auth/reset-password?${params.toString()}`
  }

  // Validate reset token (mock implementation)
  static async validateResetToken(token: string, email: string): Promise<{ valid: boolean; expired: boolean }> {
    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 1000))

    // For demo purposes, consider token valid if both token and email exist
    if (!token || !email) {
      return { valid: false, expired: false }
    }

    // Simulate token expiration (in real app, check against database)
    const mockExpirationTime = Date.now() - 60 * 60 * 1000 // 1 hour ago
    const isExpired = Math.random() > 0.8 // 20% chance of being expired for demo

    return {
      valid: !isExpired,
      expired: isExpired,
    }
  }

  // Send reset email (mock implementation)
  static async sendResetEmail(email: string, resetUrl: string): Promise<boolean> {
    // Simulate email sending
    await new Promise((resolve) => setTimeout(resolve, 1500))

    // In a real application, this would use an email service like:
    // - SendGrid
    // - AWS SES
    // - Mailgun
    // - Resend
    // etc.

    console.log(`Password reset email would be sent to: ${email}`)
    console.log(`Reset URL: ${resetUrl}`)

    return true
  }

  // Update user password (mock implementation)
  static async updatePassword(email: string, newPassword: string, token: string): Promise<boolean> {
    // Simulate password update
    await new Promise((resolve) => setTimeout(resolve, 1000))

    // In a real application, this would:
    // 1. Hash the new password
    // 2. Update the user's password in the database
    // 3. Invalidate the reset token
    // 4. Log the password change event

    console.log(`Password updated for user: ${email}`)
    return true
  }

  // Password strength validation
  static validatePasswordStrength(password: string): { valid: boolean; errors: string[] } {
    const errors: string[] = []

    if (password.length < 8) {
      errors.push("Password must be at least 8 characters long")
    }
    if (!/(?=.*[a-z])/.test(password)) {
      errors.push("Password must contain at least one lowercase letter")
    }
    if (!/(?=.*[A-Z])/.test(password)) {
      errors.push("Password must contain at least one uppercase letter")
    }
    if (!/(?=.*\d)/.test(password)) {
      errors.push("Password must contain at least one number")
    }
    if (!/(?=.*[@$!%*?&])/.test(password)) {
      errors.push("Password must contain at least one special character (@$!%*?&)")
    }

    return {
      valid: errors.length === 0,
      errors,
    }
  }
}
