// app/providers.tsx
'use client'

import { ThemeProvider } from "@/components/theme-provider"
import { CartProvider } from "@/contexts/cart-context"

export function Providers({ children }: { children: React.ReactNode }) {
  return (
    <CartProvider>
      <ThemeProvider
        attribute="class"
        defaultTheme="system"
        enableSystem
        disableTransitionOnChange
      >
        {children}
      </ThemeProvider>
    </CartProvider>
  )
}
