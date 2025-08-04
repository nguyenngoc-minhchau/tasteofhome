"use client"

import { useCart } from "@/contexts/cart-context"
import { Button } from "@/components/ui/button"
import { useRouter } from "next/navigation"//
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
} from "@/components/ui/sheet"
import { useEffect, useState } from "react"

export function MiniCart({ openTrigger }: { openTrigger: any }) {
  const router = useRouter(); //
  const { state: cartState } = useCart()
  const [open, setOpen] = useState(false)

  useEffect(() => {
    if (openTrigger) {
      setOpen(true)
    }
  }, [openTrigger])

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetContent
        side="right"
        className="w-[350px] sm:w-[400px] p-6 flex flex-col max-h-screen overflow-y-auto"
      >
        <div className="flex justify-between items-center mb-4">
          <SheetTitle className="text-lg font-semibold">Your Cart</SheetTitle>
          {/* <Button variant="ghost" size="icon" onClick={() => setOpen(false)}>
            <X className="w-5 h-5" />
          </Button> */}
        </div>

        <div className="space-y-4">
          {cartState.items.length === 0 ? (
            <p className="text-muted-foreground">Your cart is empty.</p>
          ) : (
            cartState.items.map((item) => (
              <div
                key={item.id}
                className="flex justify-between items-center border-b pb-2"
              >
                <div>
                  <p className="font-medium">{item.name}</p>
                  <p className="text-sm text-muted-foreground">
                    {item.quantity} × ${item.price}
                  </p>
                </div>
                <img
                  src={item.image}
                  alt={item.name}
                  className="w-12 h-12 object-cover rounded-md"
                />
              </div>
            ))
          )}
        </div>

        <div className="mt-auto border-t pt-4">
          <div className="flex justify-between font-medium">
            <span>Total:</span>
            <span>${cartState.total.toFixed(2)}</span>
          </div>
          <Button
            className="w-full mt-4"
            onClick={() => {
              setOpen(false)
              router.push("/cart") 
            }}
          >
            Go to Cart
          </Button>
        </div>
      </SheetContent>
    </Sheet>
  )
}

