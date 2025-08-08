"use client"

import type React from "react"

import { useState } from "react"
import Link from "next/link"
import { ArrowLeft, MessageCircle, Phone, Mail, Clock, CheckCircle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"

export default function SupportPage() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    subject: "",
    category: "",
    priority: "",
    message: "",
    orderNumber: "",
  })
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [ticketSubmitted, setTicketSubmitted] = useState(false)
  const [ticketNumber, setTicketNumber] = useState("")

  const handleInputChange = (field: string, value: string) => {
    setFormData((prev) => ({ ...prev, [field]: value }))
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsSubmitting(true)

try {
  const res = await fetch("/api/support", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      name: formData.name,
      email: formData.email,
      subject: formData.subject,
      message: formData.message,
      order_id: formData.orderNumber || null,
      screenshot_url: null, // You can add file upload later
    }),
  })

  if (!res.ok) {
    const { error } = await res.json()
    throw new Error(error || "Failed to submit support request")
  }

  const { record } = await res.json()
  setTicketNumber(`SUP-${record.id.toString().padStart(6, "0")}`)
  setTicketSubmitted(true)
} catch (error) {
  console.error("Submission error:", error)
  alert("There was a problem submitting your request. Please try again.")
} finally {
  setIsSubmitting(false)
}

    // In a real app, you would:
    // 1. Validate form data
    // 2. Create support ticket in database
    // 3. Send confirmation email to customer
    // 4. Notify customer service team
    // 5. Set up automated responses based on category/priority
  }

  if (ticketSubmitted) {
    return (
      <div className="min-h-screen bg-background">
        <header className="border-b">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
                <ArrowLeft className="h-5 w-5" />
                Back to Shop
              </Link>
              <h1 className="text-2xl font-bold">Support Request Submitted</h1>
              <div className="w-24"></div>
            </div>
          </div>
        </header>

        <div className="container mx-auto px-4 py-8">
          <div className="max-w-2xl mx-auto">
            <Card>
              <CardHeader className="text-center">
                <div className="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                  <CheckCircle className="h-8 w-8 text-green-600" />
                </div>
                <CardTitle className="text-2xl">Support Request Received!</CardTitle>
                <p className="text-muted-foreground">
                  Thank you for contacting us. We've received your support request and will respond soon.
                </p>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="bg-gray-50 p-4 rounded-lg space-y-2">
                  <div className="flex justify-between">
                    <span className="font-medium">Ticket Number:</span>
                    <span className="font-mono font-bold text-blue-600">{ticketNumber}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Subject:</span>
                    <span>{formData.subject}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Category:</span>
                    <span>{formData.category}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Priority:</span>
                    <span className="capitalize">{formData.priority}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="font-medium">Email:</span>
                    <span>{formData.email}</span>
                  </div>
                </div>

                <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                  <h4 className="font-medium text-blue-800 mb-2">What happens next?</h4>
                  <ul className="text-sm text-blue-700 space-y-1">
                    <li>✓ Confirmation email sent to {formData.email}</li>
                    <li>✓ Customer service team has been notified</li>
                    <li>• You'll receive a response within 24 hours</li>
                    <li>• Check your email for updates on ticket {ticketNumber}</li>
                  </ul>
                </div>

                <div className="space-y-2 text-sm text-muted-foreground">
                  <p>
                    <strong>Response Time:</strong> We typically respond to{" "}
                    {formData.priority === "high" ? "high priority" : formData.priority} requests within{" "}
                    {formData.priority === "high"
                      ? "4-8 hours"
                      : formData.priority === "medium"
                        ? "12-24 hours"
                        : "24-48 hours"}
                    .
                  </p>
                </div>

                <div className="flex gap-3">
                  <Link href="/" className="flex-1">
                    <Button className="w-full">Back to Shop</Button>
                  </Link>
                  <Link href="/support" className="flex-1">
                    <Button variant="outline" className="w-full bg-transparent">
                      Submit Another Request
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

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/" className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
              <ArrowLeft className="h-5 w-5" />
              Back to Shop
            </Link>
            <h1 className="text-2xl font-bold">Customer Support</h1>
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-6xl mx-auto">
          {/* Support Options */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <Card className="text-center">
              <CardContent className="p-6">
                <MessageCircle className="h-12 w-12 mx-auto text-blue-600 mb-4" />
                <h3 className="font-semibold mb-2">Live Chat</h3>
                <p className="text-sm text-muted-foreground mb-4">Chat with our support team in real-time</p>
                <Button variant="outline" className="w-full bg-transparent">
                  Start Chat
                </Button>
              </CardContent>
            </Card>

            <Card className="text-center">
              <CardContent className="p-6">
                <Phone className="h-12 w-12 mx-auto text-green-600 mb-4" />
                <h3 className="font-semibold mb-2">Phone Support</h3>
                <p className="text-sm text-muted-foreground mb-4">Call us directly for immediate assistance</p>
                <Button variant="outline" className="w-full bg-transparent">
                  1-800-SUPPORT
                </Button>
              </CardContent>
            </Card>

            <Card className="text-center">
              <CardContent className="p-6">
                <Mail className="h-12 w-12 mx-auto text-purple-600 mb-4" />
                <h3 className="font-semibold mb-2">Email Support</h3>
                <p className="text-sm text-muted-foreground mb-4">Send us a detailed message below</p>
                <Button className="w-full">Submit Request</Button>
              </CardContent>
            </Card>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            {/* Support Form */}
            <div className="lg:col-span-2">
              <Card>
                <CardHeader>
                  <CardTitle>Submit a Support Request</CardTitle>
                  <p className="text-muted-foreground">
                    Fill out the form below and we'll get back to you as soon as possible.
                  </p>
                </CardHeader>
                <CardContent>
                  <form onSubmit={handleSubmit} className="space-y-6">
                    {/* Contact Information */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div>
                        <Label htmlFor="name">Full Name *</Label>
                        <Input
                          id="name"
                          value={formData.name}
                          onChange={(e) => handleInputChange("name", e.target.value)}
                          required
                        />
                      </div>
                      <div>
                        <Label htmlFor="email">Email Address *</Label>
                        <Input
                          id="email"
                          type="email"
                          value={formData.email}
                          onChange={(e) => handleInputChange("email", e.target.value)}
                          required
                        />
                      </div>
                    </div>

                    {/* Request Details */}
                    <div>
                      <Label htmlFor="subject">Subject *</Label>
                      <Input
                        id="subject"
                        value={formData.subject}
                        onChange={(e) => handleInputChange("subject", e.target.value)}
                        placeholder="Brief description of your issue"
                        required
                      />
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div>
                        <Label htmlFor="category">Category *</Label>
                        <Select
                          value={formData.category}
                          onValueChange={(value) => handleInputChange("category", value)}
                        >
                          <SelectTrigger>
                            <SelectValue placeholder="Select a category" />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="order-issue">Order Issue</SelectItem>
                            <SelectItem value="product-question">Product Question</SelectItem>
                            <SelectItem value="shipping-delivery">Shipping & Delivery</SelectItem>
                            <SelectItem value="returns-refunds">Returns & Refunds</SelectItem>
                            <SelectItem value="account-billing">Account & Billing</SelectItem>
                            <SelectItem value="technical-issue">Technical Issue</SelectItem>
                            <SelectItem value="general-inquiry">General Inquiry</SelectItem>
                          </SelectContent>
                        </Select>
                      </div>
                      <div>
                        <Label htmlFor="priority">Priority *</Label>
                        <Select
                          value={formData.priority}
                          onValueChange={(value) => handleInputChange("priority", value)}
                        >
                          <SelectTrigger>
                            <SelectValue placeholder="Select priority" />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="low">Low - General question</SelectItem>
                            <SelectItem value="medium">Medium - Issue affecting experience</SelectItem>
                            <SelectItem value="high">High - Urgent issue requiring immediate attention</SelectItem>
                          </SelectContent>
                        </Select>
                      </div>
                    </div>

                    {/* Optional Fields */}
                    <div>
                      <Label htmlFor="orderNumber">Order Number (if applicable)</Label>
                      <Input
                        id="orderNumber"
                        value={formData.orderNumber}
                        onChange={(e) => handleInputChange("orderNumber", e.target.value)}
                        placeholder="ORD-2024-001"
                      />
                    </div>

                    {/* Message */}
                    <div>
                      <Label htmlFor="message">Message *</Label>
                      <Textarea
                        id="message"
                        value={formData.message}
                        onChange={(e) => handleInputChange("message", e.target.value)}
                        placeholder="Please provide detailed information about your issue or question..."
                        rows={6}
                        required
                      />
                      <p className="text-sm text-muted-foreground mt-1">{formData.message.length}/1000 characters</p>
                    </div>

                    <Button
                      type="submit"
                      disabled={
                        !formData.name ||
                        !formData.email ||
                        !formData.subject ||
                        !formData.category ||
                        !formData.priority ||
                        !formData.message ||
                        isSubmitting
                      }
                      className="w-full"
                      size="lg"
                    >
                      {isSubmitting ? "Submitting Request..." : "Submit Support Request"}
                    </Button>
                  </form>
                </CardContent>
              </Card>
            </div>

            {/* Support Information */}
            <div className="lg:col-span-1 space-y-6">
              <Card>
                <CardHeader>
                  <CardTitle className="flex items-center gap-2">
                    <Clock className="h-5 w-5" />
                    Support Hours
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  <div>
                    <p className="font-medium">Monday - Friday</p>
                    <p className="text-sm text-muted-foreground">9:00 AM - 6:00 PM EST</p>
                  </div>
                  <div>
                    <p className="font-medium">Saturday</p>
                    <p className="text-sm text-muted-foreground">10:00 AM - 4:00 PM EST</p>
                  </div>
                  <div>
                    <p className="font-medium">Sunday</p>
                    <p className="text-sm text-muted-foreground">Closed</p>
                  </div>
                  <div className="pt-2 border-t">
                    <p className="text-sm text-muted-foreground">
                      Emergency support available 24/7 for high-priority issues
                    </p>
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader>
                  <CardTitle>Response Times</CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  <div className="flex justify-between">
                    <span className="text-sm">High Priority</span>
                    <span className="text-sm font-medium text-red-600">4-8 hours</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-sm">Medium Priority</span>
                    <span className="text-sm font-medium text-yellow-600">12-24 hours</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-sm">Low Priority</span>
                    <span className="text-sm font-medium text-green-600">24-48 hours</span>
                  </div>
                </CardContent>
              </Card>

              <Card>
                <CardHeader>
                  <CardTitle>Frequently Asked Questions</CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  <div>
                    <p className="font-medium text-sm">How do I track my order?</p>
                    <p className="text-xs text-muted-foreground">
                      Visit your order history page or use the tracking number in your email.
                    </p>
                  </div>
                  <div>
                    <p className="font-medium text-sm">What's your return policy?</p>
                    <p className="text-xs text-muted-foreground">
                      30-day returns on most items. See our returns page for details.
                    </p>
                  </div>
                  <div>
                    <p className="font-medium text-sm">How do I cancel an order?</p>
                    <p className="text-xs text-muted-foreground">
                      Orders can be cancelled within 1 hour of placement if not yet shipped.
                    </p>
                  </div>
                  <Link href="/faq">
                    <Button variant="outline" size="sm" className="w-full mt-3 bg-transparent">
                      View All FAQs
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
