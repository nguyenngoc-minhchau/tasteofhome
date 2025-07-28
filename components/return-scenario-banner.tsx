"use client"

import { AlertCircle, Package, Clock } from "lucide-react"
import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import Link from "next/link"
import { Button } from "@/components/ui/button"

export function ReturnScenarioBanner() {
  return (
    <Card className="border-blue-200 bg-blue-50">
      <CardContent className="p-4">
        <div className="flex items-start gap-3">
          <div className="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center flex-shrink-0">
            <Package className="h-4 w-4 text-blue-600" />
          </div>
          <div className="flex-1">
            <h3 className="font-semibold text-blue-900 mb-2">🎯 Test Return Scenario Available!</h3>
            <p className="text-sm text-blue-800 mb-3">
              Order <strong>ORD-2024-005</strong> was recently delivered and is perfect for testing the return
              functionality.
            </p>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-3 mb-4">
              <div className="flex items-center gap-2 text-xs">
                <Badge variant="outline" className="bg-green-50 text-green-700 border-green-200">
                  <Clock className="h-3 w-3 mr-1" />
                  Delivered Jan 20
                </Badge>
              </div>
              <div className="flex items-center gap-2 text-xs">
                <Badge variant="outline" className="bg-blue-50 text-blue-700 border-blue-200">
                  <Package className="h-3 w-3 mr-1" />3 Items
                </Badge>
              </div>
              <div className="flex items-center gap-2 text-xs">
                <Badge variant="outline" className="bg-purple-50 text-purple-700 border-purple-200">
                  <AlertCircle className="h-3 w-3 mr-1" />
                  Return Eligible
                </Badge>
              </div>
            </div>

            <div className="text-xs text-blue-700 mb-3">
              <strong>Items available for return:</strong>
              <ul className="list-disc list-inside mt-1 space-y-1">
                <li>1x Organic Green Tea ($18.75)</li>
                <li>2x Artisan Dark Chocolate ($32.00 each)</li>
                <li>1x French Lavender Oil ($45.00)</li>
              </ul>
            </div>

            <div className="flex gap-2">
              <Link href="/orders/ORD-2024-005">
                <Button size="sm" variant="outline" className="text-xs bg-white">
                  View Order Details
                </Button>
              </Link>
              <Link href="/orders/ORD-2024-005/return">
                <Button size="sm" className="text-xs">
                  Start Return Process
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}
