"use client"

import { useState } from "react"
import Link from "next/link"
import { ArrowLeft, Shield, Users, Settings, Plus, Edit, Trash2, Save, X } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Badge } from "@/components/ui/badge"
import { Checkbox } from "@/components/ui/checkbox"
import { Textarea } from "@/components/ui/textarea"
import { Separator } from "@/components/ui/separator"

// Mock roles and permissions data
const rolesData = [
  {
    id: 1,
    name: "Administrator",
    description: "Full system access with all permissions",
    userCount: 2,
    permissions: [
      "user_management",
      "role_management",
      "order_management",
      "product_management",
      "inventory_management",
      "system_settings",
      "reports_access",
      "financial_data",
    ],
    isSystem: true,
  },
  {
    id: 2,
    name: "Manager",
    description: "Business operations and staff management",
    userCount: 3,
    permissions: [
      "order_management",
      "product_management",
      "inventory_management",
      "reports_access",
      "staff_management",
      "customer_support",
    ],
    isSystem: false,
  },
  {
    id: 3,
    name: "Staff",
    description: "Basic operational tasks and customer support",
    userCount: 8,
    permissions: ["order_processing", "customer_support", "inventory_view", "basic_reports"],
    isSystem: false,
  },
  {
    id: 4,
    name: "Customer Support",
    description: "Customer service and support ticket management",
    userCount: 4,
    permissions: ["customer_support", "order_view", "refund_processing", "ticket_management"],
    isSystem: false,
  },
]

const allPermissions = [
  {
    category: "User Management",
    permissions: [
      { key: "user_management", label: "Manage Users", description: "Create, edit, and delete user accounts" },
      { key: "role_management", label: "Manage Roles", description: "Create and modify user roles and permissions" },
      { key: "staff_management", label: "Manage Staff", description: "Manage staff profiles and schedules" },
    ],
  },
  {
    category: "Order Management",
    permissions: [
      { key: "order_management", label: "Full Order Management", description: "Complete order management access" },
      { key: "order_processing", label: "Process Orders", description: "Process and fulfill orders" },
      { key: "order_view", label: "View Orders", description: "View order details and history" },
      { key: "refund_processing", label: "Process Refunds", description: "Handle refunds and returns" },
    ],
  },
  {
    category: "Product & Inventory",
    permissions: [
      { key: "product_management", label: "Manage Products", description: "Add, edit, and remove products" },
      { key: "inventory_management", label: "Manage Inventory", description: "Control stock levels and inventory" },
      { key: "inventory_view", label: "View Inventory", description: "View inventory levels and reports" },
    ],
  },
  {
    category: "System & Settings",
    permissions: [
      { key: "system_settings", label: "System Settings", description: "Configure system-wide settings" },
      { key: "reports_access", label: "Access Reports", description: "View business and operational reports" },
      { key: "basic_reports", label: "Basic Reports", description: "View basic performance reports" },
      { key: "financial_data", label: "Financial Data", description: "Access financial reports and data" },
    ],
  },
  {
    category: "Customer Service",
    permissions: [
      { key: "customer_support", label: "Customer Support", description: "Handle customer inquiries and support" },
      { key: "ticket_management", label: "Ticket Management", description: "Manage support tickets and escalations" },
    ],
  },
]

export default function RolePermissionManagement() {
  const [roles, setRoles] = useState(rolesData)
  const [selectedRole, setSelectedRole] = useState<any>(null)
  const [isCreating, setIsCreating] = useState(false)
  const [newRole, setNewRole] = useState({
    name: "",
    description: "",
    permissions: [] as string[],
  })

  const handleCreateRole = () => {
    if (!newRole.name.trim()) return

    const role = {
      id: Date.now(),
      name: newRole.name,
      description: newRole.description,
      userCount: 0,
      permissions: newRole.permissions,
      isSystem: false,
    }

    setRoles([...roles, role])
    setNewRole({ name: "", description: "", permissions: [] })
    setIsCreating(false)
  }

  const handleUpdateRole = (roleId: number, updatedPermissions: string[]) => {
    setRoles(roles.map((role) => (role.id === roleId ? { ...role, permissions: updatedPermissions } : role)))
  }

  const handleDeleteRole = (roleId: number) => {
    setRoles(roles.filter((role) => role.id !== roleId))
  }

  const togglePermission = (permission: string) => {
    if (selectedRole) {
      const updatedPermissions = selectedRole.permissions.includes(permission)
        ? selectedRole.permissions.filter((p: string) => p !== permission)
        : [...selectedRole.permissions, permission]

      setSelectedRole({ ...selectedRole, permissions: updatedPermissions })
    } else {
      setNewRole((prev) => ({
        ...prev,
        permissions: prev.permissions.includes(permission)
          ? prev.permissions.filter((p) => p !== permission)
          : [...prev.permissions, permission],
      }))
    }
  }

  const roleStats = {
    totalRoles: roles.length,
    totalUsers: roles.reduce((sum, role) => sum + role.userCount, 0),
    systemRoles: roles.filter((role) => role.isSystem).length,
    customRoles: roles.filter((role) => !role.isSystem).length,
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
              <h1 className="text-2xl font-bold">Role & Permission Management</h1>
              <p className="text-muted-foreground">Manage user roles, permissions, and access control</p>
            </div>
            <Button onClick={() => setIsCreating(true)}>
              <Plus className="h-4 w-4 mr-2" />
              Create Role
            </Button>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* Stats */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Roles</CardTitle>
              <Shield className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{roleStats.totalRoles}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Users</CardTitle>
              <Users className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{roleStats.totalUsers}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">System Roles</CardTitle>
              <Settings className="h-4 w-4 text-red-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-red-600">{roleStats.systemRoles}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Custom Roles</CardTitle>
              <Shield className="h-4 w-4 text-blue-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-blue-600">{roleStats.customRoles}</div>
            </CardContent>
          </Card>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Roles List */}
          <Card>
            <CardHeader>
              <CardTitle>Roles</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {roles.map((role) => (
                  <Card key={role.id} className="hover:shadow-md transition-shadow">
                    <CardContent className="p-4">
                      <div className="flex items-center justify-between">
                        <div className="space-y-2">
                          <div className="flex items-center gap-2">
                            <h3 className="font-semibold">{role.name}</h3>
                            {role.isSystem && (
                              <Badge variant="outline" className="text-red-600 border-red-600">
                                System
                              </Badge>
                            )}
                          </div>
                          <p className="text-sm text-muted-foreground">{role.description}</p>
                          <div className="flex items-center gap-4 text-xs text-muted-foreground">
                            <span>{role.userCount} users</span>
                            <span>{role.permissions.length} permissions</span>
                          </div>
                        </div>
                        <div className="flex items-center gap-2">
                          <Button variant="outline" size="sm" onClick={() => setSelectedRole(role)}>
                            <Edit className="h-4 w-4 mr-1" />
                            Edit
                          </Button>
                          {!role.isSystem && (
                            <Button
                              variant="outline"
                              size="sm"
                              onClick={() => handleDeleteRole(role.id)}
                              className="text-red-600 hover:text-red-700"
                            >
                              <Trash2 className="h-4 w-4" />
                            </Button>
                          )}
                        </div>
                      </div>
                    </CardContent>
                  </Card>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Permission Editor */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center justify-between">
                {selectedRole ? `Edit ${selectedRole.name}` : isCreating ? "Create New Role" : "Permissions"}
                {(selectedRole || isCreating) && (
                  <div className="flex gap-2">
                    <Button
                      size="sm"
                      onClick={() => {
                        if (selectedRole) {
                          handleUpdateRole(selectedRole.id, selectedRole.permissions)
                          setSelectedRole(null)
                        } else {
                          handleCreateRole()
                        }
                      }}
                    >
                      <Save className="h-4 w-4 mr-1" />
                      Save
                    </Button>
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => {
                        setSelectedRole(null)
                        setIsCreating(false)
                        setNewRole({ name: "", description: "", permissions: [] })
                      }}
                    >
                      <X className="h-4 w-4 mr-1" />
                      Cancel
                    </Button>
                  </div>
                )}
              </CardTitle>
            </CardHeader>
            <CardContent>
              {selectedRole || isCreating ? (
                <div className="space-y-6">
                  {isCreating && (
                    <>
                      <div>
                        <Label htmlFor="role-name">Role Name</Label>
                        <Input
                          id="role-name"
                          value={newRole.name}
                          onChange={(e) => setNewRole((prev) => ({ ...prev, name: e.target.value }))}
                          placeholder="Enter role name"
                        />
                      </div>
                      <div>
                        <Label htmlFor="role-description">Description</Label>
                        <Textarea
                          id="role-description"
                          value={newRole.description}
                          onChange={(e) => setNewRole((prev) => ({ ...prev, description: e.target.value }))}
                          placeholder="Describe the role's purpose"
                        />
                      </div>
                      <Separator />
                    </>
                  )}

                  <div>
                    <h4 className="font-semibold mb-4">Permissions</h4>
                    <div className="space-y-6">
                      {allPermissions.map((category) => (
                        <div key={category.category}>
                          <h5 className="font-medium mb-3">{category.category}</h5>
                          <div className="space-y-3">
                            {category.permissions.map((permission) => (
                              <div key={permission.key} className="flex items-start space-x-3">
                                <Checkbox
                                  id={permission.key}
                                  checked={
                                    selectedRole
                                      ? selectedRole.permissions.includes(permission.key)
                                      : newRole.permissions.includes(permission.key)
                                  }
                                  onCheckedChange={() => togglePermission(permission.key)}
                                />
                                <div className="space-y-1">
                                  <Label
                                    htmlFor={permission.key}
                                    className="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                  >
                                    {permission.label}
                                  </Label>
                                  <p className="text-xs text-muted-foreground">{permission.description}</p>
                                </div>
                              </div>
                            ))}
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              ) : (
                <div className="text-center py-8">
                  <Shield className="h-12 w-12 text-muted-foreground mx-auto mb-4" />
                  <p className="text-muted-foreground">Select a role to edit permissions</p>
                </div>
              )}
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
