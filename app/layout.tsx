import type React from "react"
import type { Metadata } from "next"
import "./globals.css"
import { CartProvider } from "@/contexts/cart-context"
import { ThemeProvider } from "@/components/theme-provider"
import { Inter } from "next/font/google"
import { Toaster } from "sonner"

const inter = Inter({ subsets: ["latin"] })

export const metadata: Metadata = {
  title: "Taste Of Home",
  description: "market place sells specialties",
  generator: "farmer",
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <CartProvider>
          <ThemeProvider attribute="class" defaultTheme="system" enableSystem disableTransitionOnChange>
            {children}
          </ThemeProvider>
        </CartProvider>
        <Toaster richColors position="top-right" />
      </body>
    </html>
  )
}
