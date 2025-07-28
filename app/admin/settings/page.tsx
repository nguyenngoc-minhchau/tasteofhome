"use client"

import { useState } from "react"
import Link from "next/link"
import { ArrowLeft, Save, Mail, CreditCard, Shield, Bell, Database, Globe } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Switch } from "@/components/ui/switch"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Separator } from "@/components/ui/separator"
import { Badge } from "@/components/ui/badge"

const systemSettings = {
  general: {
    siteName: "E-Commerce Store",
    siteDescription: "Your trusted online marketplace",
    contactEmail: "support@store.com",
    timezone: "America/New_York",
    language: "en",
    currency: "USD",
    maintenanceMode: false,
  },
  email: {
    provider: "sendgrid",
    smtpHost: "smtp.sendgrid.net",
    smtpPort: "587",
    smtpUsername: "apikey",
    smtpPassword: "••••••••••••",
    fromEmail: "noreply@store.com",
    fromName: "E-Commerce Store",
    emailSignature: "Best regards,\nE-Commerce Store Team",
  },
  payment: {
    stripeEnabled: true,
    stripePublishableKey: "pk_test_••••••••••••",
    stripeSecretKey: "sk_test_••••••••••••",
    paypalEnabled: true,
    paypalClientId: "••••••••••••",
    paypalClientSecret: "••••••••••••",
    testMode: true,
  },
  notifications: {
    orderConfirmation: true,
    shipmentTracking: true,
    lowStockAlerts: true,
    newUserRegistration: true,
    systemMaintenance: true,
    emailNotifications: true,
    smsNotifications: false,
    pushNotifications: true,
  },
  security: {
    twoFactorAuth: true,
    passwordComplexity: "medium",
    sessionTimeout: "4",
    loginAttempts: "5",
    ipWhitelist: "",
    apiRateLimit: "100",
    sslRequired: true,
  },
  backup: {
    autoBackup: true,
    backupFrequency: "daily",
    retentionDays: "30",
    cloudStorage: "aws",
    lastBackup: "2024-01-22 03:00:00",
    backupSize: "2.4GB",
  },
}

export default function SystemSettingsManagement() {
  const [settings, setSettings] = useState(systemSettings)
  const [activeTab, setActiveTab] = useState("general")
  const [isSaving, setIsSaving] = useState(false)
  const [hasChanges, setHasChanges] = useState(false)

  const handleSettingChange = (section: string, key: string, value: any) => {
    setSettings((prev) => ({
      ...prev,
      [section]: {
        ...prev[section as keyof typeof prev],
        [key]: value,
      },
    }))
    setHasChanges(true)
  }

  const handleSaveSettings = async () => {
    setIsSaving(true)

    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 2000))

    console.log("Settings saved:", settings)
    setIsSaving(false)
    setHasChanges(false)
  }

  const handleTestEmailConfig = async () => {
    // Simulate testing email configuration
    await new Promise((resolve) => setTimeout(resolve, 1000))
    alert("Test email sent successfully!")
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div>
              <Link href="/admin" className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-2">
                <ArrowLeft className="h-5 w-5" />
                Back to Admin
              </Link>
              <h1 className="text-2xl font-bold">System Settings</h1>
              <p className="text-muted-foreground">Configure system-wide settings and preferences</p>
            </div>
            <div className="flex items-center gap-4">
              {hasChanges && (
                <Badge variant="outline" className="text-orange-600 border-orange-600">
                  Unsaved Changes
                </Badge>
              )}
              <Button onClick={handleSaveSettings} disabled={!hasChanges || isSaving}>
                <Save className="h-4 w-4 mr-2" />
                {isSaving ? "Saving..." : "Save Settings"}
              </Button>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <Tabs value={activeTab} onValueChange={setActiveTab}>
          <TabsList className="grid w-full grid-cols-6">
            <TabsTrigger value="general">General</TabsTrigger>
            <TabsTrigger value="email">Email</TabsTrigger>
            <TabsTrigger value="payment">Payment</TabsTrigger>
            <TabsTrigger value="notifications">Notifications</TabsTrigger>
            <TabsTrigger value="security">Security</TabsTrigger>
            <TabsTrigger value="backup">Backup</TabsTrigger>
          </TabsList>

          {/* General Settings */}
          <TabsContent value="general">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Globe className="h-5 w-5" />
                  General Settings
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <Label htmlFor="siteName">Site Name</Label>
                    <Input
                      id="siteName"
                      value={settings.general.siteName}
                      onChange={(e) => handleSettingChange("general", "siteName", e.target.value)}
                    />
                  </div>
                  <div>
                    <Label htmlFor="contactEmail">Contact Email</Label>
                    <Input
                      id="contactEmail"
                      type="email"
                      value={settings.general.contactEmail}
                      onChange={(e) => handleSettingChange("general", "contactEmail", e.target.value)}
                    />
                  </div>
                </div>

                <div>
                  <Label htmlFor="siteDescription">Site Description</Label>
                  <Textarea
                    id="siteDescription"
                    value={settings.general.siteDescription}
                    onChange={(e) => handleSettingChange("general", "siteDescription", e.target.value)}
                  />
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  <div>
                    <Label htmlFor="timezone">Timezone</Label>
                    <Select
                      value={settings.general.timezone}
                      onValueChange={(value) => handleSettingChange("general", "timezone", value)}
                    >
                      <SelectTrigger>
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="America/New_York">Eastern Time</SelectItem>
                        <SelectItem value="America/Chicago">Central Time</SelectItem>
                        <SelectItem value="America/Denver">Mountain Time</SelectItem>
                        <SelectItem value="America/Los_Angeles">Pacific Time</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="language">Language</Label>
                    <Select
                      value={settings.general.language}
                      onValueChange={(value) => handleSettingChange("general", "language", value)}
                    >
                      <SelectTrigger>
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="en">English</SelectItem>
                        <SelectItem value="es">Spanish</SelectItem>
                        <SelectItem value="fr">French</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="currency">Currency</Label>
                    <Select
                      value={settings.general.currency}
                      onValueChange={(value) => handleSettingChange("general", "currency", value)}
                    >
                      <SelectTrigger>
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="USD">US Dollar</SelectItem>
                        <SelectItem value="EUR">Euro</SelectItem>
                        <SelectItem value="GBP">British Pound</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                </div>

                <div className="flex items-center space-x-2">
                  <Switch
                    id="maintenanceMode"
                    checked={settings.general.maintenanceMode}
                    onCheckedChange={(checked) => handleSettingChange("general", "maintenanceMode", checked)}
                  />
                  <Label htmlFor="maintenanceMode">Maintenance Mode</Label>
                  <Badge variant={settings.general.maintenanceMode ? "destructive" : "default"}>
                    {settings.general.maintenanceMode ? "Enabled" : "Disabled"}
                  </Badge>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Email Settings */}
          <TabsContent value="email">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Mail className="h-5 w-5" />
                  Email Configuration
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <Label htmlFor="fromEmail">From Email</Label>
                    <Input
                      id="fromEmail"
                      type="email"
                      value={settings.email.fromEmail}
                      onChange={(e) => handleSettingChange("email", "fromEmail", e.target.value)}
                    />
                  </div>
                  <div>
                    <Label htmlFor="fromName">From Name</Label>
                    <Input
                      id="fromName"
                      value={settings.email.fromName}
                      onChange={(e) => handleSettingChange("email", "fromName", e.target.value)}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  <div>
                    <Label htmlFor="smtpHost">SMTP Host</Label>
                    <Input
                      id="smtpHost"
                      value={settings.email.smtpHost}
                      onChange={(e) => handleSettingChange("email", "smtpHost", e.target.value)}
                    />
                  </div>
                  <div>
                    <Label htmlFor="smtpPort">SMTP Port</Label>
                    <Input
                      id="smtpPort"
                      value={settings.email.smtpPort}
                      onChange={(e) => handleSettingChange("email", "smtpPort", e.target.value)}
                    />
                  </div>
                  <div>
                    <Label htmlFor="smtpUsername">SMTP Username</Label>
                    <Input
                      id="smtpUsername"
                      value={settings.email.smtpUsername}
                      onChange={(e) => handleSettingChange("email", "smtpUsername", e.target.value)}
                    />
                  </div>
                </div>

                <div>
                  <Label htmlFor="emailSignature">Email Signature</Label>
                  <Textarea
                    id="emailSignature"
                    value={settings.email.emailSignature}
                    onChange={(e) => handleSettingChange("email", "emailSignature", e.target.value)}
                  />
                </div>

                <div className="flex gap-4">
                  <Button onClick={handleTestEmailConfig} variant="outline">
                    Test Email Configuration
                  </Button>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Payment Settings */}
          <TabsContent value="payment">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <CreditCard className="h-5 w-5" />
                  Payment Configuration
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="flex items-center space-x-2 mb-4">
                  <Switch
                    id="testMode"
                    checked={settings.payment.testMode}
                    onCheckedChange={(checked) => handleSettingChange("payment", "testMode", checked)}
                  />
                  <Label htmlFor="testMode">Test Mode</Label>
                  <Badge variant={settings.payment.testMode ? "secondary" : "default"}>
                    {settings.payment.testMode ? "Test" : "Live"}
                  </Badge>
                </div>

                <Separator />

                <div>
                  <h4 className="font-semibold mb-4">Stripe Configuration</h4>
                  <div className="space-y-4">
                    <div className="flex items-center space-x-2 mb-2">
                      <Switch
                        id="stripeEnabled"
                        checked={settings.payment.stripeEnabled}
                        onCheckedChange={(checked) => handleSettingChange("payment", "stripeEnabled", checked)}
                      />
                      <Label htmlFor="stripeEnabled">Enable Stripe</Label>
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div>
                        <Label htmlFor="stripePublishable">Publishable Key</Label>
                        <Input
                          id="stripePublishable"
                          type="password"
                          value={settings.payment.stripePublishableKey}
                          onChange={(e) => handleSettingChange("payment", "stripePublishableKey", e.target.value)}
                        />
                      </div>
                      <div>
                        <Label htmlFor="stripeSecret">Secret Key</Label>
                        <Input
                          id="stripeSecret"
                          type="password"
                          value={settings.payment.stripeSecretKey}
                          onChange={(e) => handleSettingChange("payment", "stripeSecretKey", e.target.value)}
                        />
                      </div>
                    </div>
                  </div>
                </div>

                <Separator />

                <div>
                  <h4 className="font-semibold mb-4">PayPal Configuration</h4>
                  <div className="space-y-4">
                    <div className="flex items-center space-x-2 mb-2">
                      <Switch
                        id="paypalEnabled"
                        checked={settings.payment.paypalEnabled}
                        onCheckedChange={(checked) => handleSettingChange("payment", "paypalEnabled", checked)}
                      />
                      <Label htmlFor="paypalEnabled">Enable PayPal</Label>
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div>
                        <Label htmlFor="paypalClientId">Client ID</Label>
                        <Input
                          id="paypalClientId"
                          type="password"
                          value={settings.payment.paypalClientId}
                          onChange={(e) => handleSettingChange("payment", "paypalClientId", e.target.value)}
                        />
                      </div>
                      <div>
                        <Label htmlFor="paypalSecret">Client Secret</Label>
                        <Input
                          id="paypalSecret"
                          type="password"
                          value={settings.payment.paypalClientSecret}
                          onChange={(e) => handleSettingChange("payment", "paypalClientSecret", e.target.value)}
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Notification Settings */}
          <TabsContent value="notifications">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Bell className="h-5 w-5" />
                  Notification Settings
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <div>
                  <h4 className="font-semibold mb-4">Order Notifications</h4>
                  <div className="space-y-3">
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="orderConfirmation"
                        checked={settings.notifications.orderConfirmation}
                        onCheckedChange={(checked) =>
                          handleSettingChange("notifications", "orderConfirmation", checked)
                        }
                      />
                      <Label htmlFor="orderConfirmation">Order Confirmation</Label>
                    </div>
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="shipmentTracking"
                        checked={settings.notifications.shipmentTracking}
                        onCheckedChange={(checked) => handleSettingChange("notifications", "shipmentTracking", checked)}
                      />
                      <Label htmlFor="shipmentTracking">Shipment Tracking Updates</Label>
                    </div>
                  </div>
                </div>

                <Separator />

                <div>
                  <h4 className="font-semibold mb-4">System Notifications</h4>
                  <div className="space-y-3">
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="lowStockAlerts"
                        checked={settings.notifications.lowStockAlerts}
                        onCheckedChange={(checked) => handleSettingChange("notifications", "lowStockAlerts", checked)}
                      />
                      <Label htmlFor="lowStockAlerts">Low Stock Alerts</Label>
                    </div>
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="newUserRegistration"
                        checked={settings.notifications.newUserRegistration}
                        onCheckedChange={(checked) =>
                          handleSettingChange("notifications", "newUserRegistration", checked)
                        }
                      />
                      <Label htmlFor="newUserRegistration">New User Registration</Label>
                    </div>
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="systemMaintenance"
                        checked={settings.notifications.systemMaintenance}
                        onCheckedChange={(checked) =>
                          handleSettingChange("notifications", "systemMaintenance", checked)
                        }
                      />
                      <Label htmlFor="systemMaintenance">System Maintenance</Label>
                    </div>
                  </div>
                </div>

                <Separator />

                <div>
                  <h4 className="font-semibold mb-4">Notification Channels</h4>
                  <div className="space-y-3">
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="emailNotifications"
                        checked={settings.notifications.emailNotifications}
                        onCheckedChange={(checked) =>
                          handleSettingChange("notifications", "emailNotifications", checked)
                        }
                      />
                      <Label htmlFor="emailNotifications">Email Notifications</Label>
                    </div>
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="smsNotifications"
                        checked={settings.notifications.smsNotifications}
                        onCheckedChange={(checked) => handleSettingChange("notifications", "smsNotifications", checked)}
                      />
                      <Label htmlFor="smsNotifications">SMS Notifications</Label>
                    </div>
                    <div className="flex items-center space-x-2">
                      <Switch
                        id="pushNotifications"
                        checked={settings.notifications.pushNotifications}
                        onCheckedChange={(checked) =>
                          handleSettingChange("notifications", "pushNotifications", checked)
                        }
                      />
                      <Label htmlFor="pushNotifications">Push Notifications</Label>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Security Settings */}
          <TabsContent value="security">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Shield className="h-5 w-5" />
                  Security Settings
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <Label htmlFor="passwordComplexity">Password Complexity</Label>
                    <Select
                      value={settings.security.passwordComplexity}
                      onValueChange={(value) => handleSettingChange("security", "passwordComplexity", value)}
                    >
                      <SelectTrigger>
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="low">Low</SelectItem>
                        <SelectItem value="medium">Medium</SelectItem>
                        <SelectItem value="high">High</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="sessionTimeout">Session Timeout (hours)</Label>
                    <Input
                      id="sessionTimeout"
                      type="number"
                      value={settings.security.sessionTimeout}
                      onChange={(e) => handleSettingChange("security", "sessionTimeout", e.target.value)}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <Label htmlFor="loginAttempts">Max Login Attempts</Label>
                    <Input
                      id="loginAttempts"
                      type="number"
                      value={settings.security.loginAttempts}
                      onChange={(e) => handleSettingChange("security", "loginAttempts", e.target.value)}
                    />
                  </div>
                  <div>
                    <Label htmlFor="apiRateLimit">API Rate Limit (per minute)</Label>
                    <Input
                      id="apiRateLimit"
                      type="number"
                      value={settings.security.apiRateLimit}
                      onChange={(e) => handleSettingChange("security", "apiRateLimit", e.target.value)}
                    />
                  </div>
                </div>

                <div>
                  <Label htmlFor="ipWhitelist">IP Whitelist (comma-separated)</Label>
                  <Textarea
                    id="ipWhitelist"
                    placeholder="192.168.1.1, 10.0.0.1"
                    value={settings.security.ipWhitelist}
                    onChange={(e) => handleSettingChange("security", "ipWhitelist", e.target.value)}
                  />
                </div>

                <div className="space-y-3">
                  <div className="flex items-center space-x-2">
                    <Switch
                      id="twoFactorAuth"
                      checked={settings.security.twoFactorAuth}
                      onCheckedChange={(checked) => handleSettingChange("security", "twoFactorAuth", checked)}
                    />
                    <Label htmlFor="twoFactorAuth">Require Two-Factor Authentication</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <Switch
                      id="sslRequired"
                      checked={settings.security.sslRequired}
                      onCheckedChange={(checked) => handleSettingChange("security", "sslRequired", checked)}
                    />
                    <Label htmlFor="sslRequired">Force SSL/HTTPS</Label>
                  </div>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          {/* Backup Settings */}
          <TabsContent value="backup">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Database className="h-5 w-5" />
                  Backup & Recovery
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  <div>
                    <Label htmlFor="backupFrequency">Backup Frequency</Label>
                    <Select
                      value={settings.backup.backupFrequency}
                      onValueChange={(value) => handleSettingChange("backup", "backupFrequency", value)}
                    >
                      <SelectTrigger>
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="hourly">Hourly</SelectItem>
                        <SelectItem value="daily">Daily</SelectItem>
                        <SelectItem value="weekly">Weekly</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="retentionDays">Retention Period (days)</Label>
                    <Input
                      id="retentionDays"
                      type="number"
                      value={settings.backup.retentionDays}
                      onChange={(e) => handleSettingChange("backup", "retentionDays", e.target.value)}
                    />
                  </div>
                  <div>
                    <Label htmlFor="cloudStorage">Cloud Storage</Label>
                    <Select
                      value={settings.backup.cloudStorage}
                      onValueChange={(value) => handleSettingChange("backup", "cloudStorage", value)}
                    >
                      <SelectTrigger>
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="aws">Amazon S3</SelectItem>
                        <SelectItem value="gcp">Google Cloud Storage</SelectItem>
                        <SelectItem value="azure">Azure Blob Storage</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                </div>

                <div className="flex items-center space-x-2">
                  <Switch
                    id="autoBackup"
                    checked={settings.backup.autoBackup}
                    onCheckedChange={(checked) => handleSettingChange("backup", "autoBackup", checked)}
                  />
                  <Label htmlFor="autoBackup">Enable Automatic Backups</Label>
                </div>

                <div className="bg-gray-50 p-4 rounded-lg">
                  <h4 className="font-semibold mb-2">Last Backup Information</h4>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                    <div>
                      <span className="font-medium">Last Backup:</span>
                      <span className="ml-2">{settings.backup.lastBackup}</span>
                    </div>
                    <div>
                      <span className="font-medium">Backup Size:</span>
                      <span className="ml-2">{settings.backup.backupSize}</span>
                    </div>
                  </div>
                </div>

                <div className="flex gap-4">
                  <Button variant="outline">Create Manual Backup</Button>
                  <Button variant="outline">Restore from Backup</Button>
                  <Button variant="outline">Download Backup</Button>
                </div>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </div>
    </div>
  )
}
