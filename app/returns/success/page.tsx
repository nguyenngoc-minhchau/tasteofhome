"use client"

import { useSearchParams } from "next/navigation"
import Link from "next/link"
import { CheckCircle, Package, ArrowRight, Clock } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"

export default function ReturnSuccessPage() {
  const searchParams = useSearchParams()
  const returnId = searchParams.get("returnId") || "RET-ORD-2024-005-003"
  const orderId = searchParams.get("orderId") || "ORD-2024-005"

  // Mock success data - in real app this would come from the return submission
  const successData = {
    returnId: returnId,
    orderId: orderId,
    submissionDate: new Date().toISOString(),
    items: [{ name: "Artisan Dark Chocolate", quantity: 1, refundAmount: 32.0 }],
    totalRefund: 32.0,
    estimatedProcessing: "3-5 business days",
    nextSteps: [
      "Return request created and submitted for review",
      "You'll receive an email confirmation within 24 hours",
      "If approved, return shipping label will be provided",
      "Package items securely and ship within 14 days",
      "Refund will be processed after item inspection",
    ],
  }

  return (
    <div className="min-h-screen bg-background flex items-center justify-center">
      <div className="container mx-auto px-4 py-8">
        <div className="max-w-2xl mx-auto">
          <Card>
            <CardHeader className="text-center pb-4">
              <div className="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                <CheckCircle className="h-8 w-8 text-green-600" />
              </div>
              <CardTitle className="text-2xl">Return Request Submitted Successfully!</CardTitle>
              <p className="text-muted-foreground">Your return request has been received and is being processed.</p>
            </CardHeader>
            <CardContent className="space-y-6">
              {/* Return Summary */}
              <div className="bg-gray-50 p-4 rounded-lg space-y-3">
                <div className="flex justify-between items-center">
                  <span className="font-medium">Return Request ID:</span>
                  <span className="font-mono text-sm">{successData.returnId}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="font-medium">Original Order:</span>
                  <span className="font-mono text-sm">{successData.orderId}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="font-medium">Submission Date:</span>
                  <span className="text-sm">{new Date(successData.submissionDate).toLocaleDateString()}</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="font-medium">Items to Return:</span>
                  <span className="text-sm">{successData.items.length} item(s)</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="font-medium">Expected Refund:</span>
                  <span className="font-bold text-green-600">${successData.totalRefund.toFixed(2)}</span>
                </div>
              </div>

              {/* Status Badge */}
              <div className="flex justify-center">
                <Badge className="bg-yellow-500 text-white px-4 py-2">
                  <Clock className="h-4 w-4 mr-2" />
                  Pending Review
                </Badge>
              </div>

              {/* Next Steps */}
              <div className="space-y-4">
                <h3 className="font-semibold text-lg">What Happens Next?</h3>
                <div className="space-y-3">
                  {successData.nextSteps.map((step, index) => (
                    <div key={index} className="flex items-start gap-3">
                      <div className="w-6 h-6 rounded-full bg-blue-100 flex items-center justify-center flex-shrink-0 mt-0.5">
                        <span className="text-xs font-medium text-blue-600">{index + 1}</span>
                      </div>
                      <p className="text-sm text-muted-foreground">{step}</p>
                    </div>
                  ))}
                </div>
              </div>

              {/* Important Information */}
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <h4 className="font-medium text-blue-800 mb-2">Important Information</h4>
                <ul className="text-sm text-blue-700 space-y-1">
                  <li>• Processing time: {successData.estimatedProcessing}</li>
                  <li>• Return window: 30 days from delivery date</li>
                  <li>• Items must be in original condition</li>
                  <li>• Return shipping is free for defective items</li>
                  <li>• Refunds are processed to original payment method</li>
                </ul>
              </div>

              {/* Email Confirmation */}
              <div className="bg-green-50 border border-green-200 rounded-lg p-4">
                <div className="flex items-start gap-3">
                  <CheckCircle className="h-5 w-5 text-green-600 mt-0.5" />
                  <div>
                    <p className="font-medium text-green-800">Email Confirmation Sent</p>
                    <p className="text-sm text-green-700">
                      A confirmation email with your return details has been sent to your registered email address.
                    </p>
                  </div>
                </div>
              </div>

              {/* Action Buttons */}
              <div className="space-y-3">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <Link href={`/returns/${successData.returnId}`}>
                    <Button className="w-full">
                      <Package className="h-4 w-4 mr-2" />
                      Track Return Status
                    </Button>
                  </Link>
                  <Link href="/returns">
                    <Button variant="outline" className="w-full bg-transparent">
                      View All Returns
                      <ArrowRight className="h-4 w-4 ml-2" />
                    </Button>
                  </Link>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <Link href={`/orders/${successData.orderId}`}>
                    <Button variant="outline" className="w-full bg-transparent">
                      View Original Order
                    </Button>
                  </Link>
                  <Link href="/">
                    <Button variant="outline" className="w-full bg-transparent">
                      Continue Shopping
                    </Button>
                  </Link>
                </div>
              </div>

              {/* Support Information */}
              <div className="text-center pt-4 border-t">
                <p className="text-sm text-muted-foreground mb-2">Need help with your return?</p>
                <Link href="/support">
                  <Button variant="link" className="text-sm">
                    Contact Customer Support
                  </Button>
                </Link>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
