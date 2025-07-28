"use client"

import { useState } from "react"
import Link from "next/link"
import { ArrowLeft, Search, Users, Edit, Trash2, Shield, Mail, Calendar, MoreHorizontal } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Badge } from "@/components/ui/badge"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"
import { Checkbox } from "@/components/ui/checkbox"

// Mock user data
const userData = [
  {
    id: 1,
    name: "John Doe",
    email: "john@example.com",
    role: "customer",
    status: "active",
    joinDate: "2024-01-15",
    lastLogin: "2024-01-22",
    orders: 5,
    totalSpent: 234.56,
    verified: true,
  },
  {
    id: 2,
    name: "Jane Smith",
    email: "jane@example.com",
    role: "customer",
    status: "active",
    joinDate: "2024-01-10",
    lastLogin: "2024-01-21",
    orders: 8,
    totalSpent: 456.78,
    verified: true,
  },
  {
    id: 3,
    name: "Bob Johnson",
    email: "bob@example.com",
    role: "staff",
    status: "active",
    joinDate: "2023-12-01",
    lastLogin: "2024-01-22",
    orders: 0,
    totalSpent: 0,
    verified: true,
  },
  {
    id: 4,
    name: "Alice Brown",
    email: "alice@example.com",
    role: "customer",
    status: "suspended",
    joinDate: "2024-01-05",
    lastLogin: "2024-01-18",
    orders: 2,
    totalSpent: 89.99,
    verified: false,
  },
  {
    id: 5,
    name: "Mike Davis",
    email: "mike@example.com",
    role: "manager",
    status: "active",
    joinDate: "2023-11-15",
    lastLogin: "2024-01-22",
    orders: 0,
    totalSpent: 0,
    verified: true,
  },
  {
    id: 6,
    name: "Carol Lee",
    email: "carol@example.com",
    role: "customer",
    status: "inactive",
    joinDate: "2023-10-20",
    lastLogin: "2023-12-15",
    orders: 12,
    totalSpent: 789.45,
    verified: true,
  },
]

const roleColors = {
  customer: "bg-blue-500",
  staff: "bg-green-500",
  manager: "bg-purple-500",
  administrator: "bg-red-500",
}

const statusColors = {
  active: "bg-green-500",
  inactive: "bg-gray-500",
  suspended: "bg-red-500",
}

export default function UserManagementPage() {
  const [searchQuery, setSearchQuery] = useState("")
  const [selectedRole, setSelectedRole] = useState("all")
  const [selectedStatus, setSelectedStatus] = useState("all")
  const [selectedUser, setSelectedUser] = useState<any>(null)
  const [editData, setEditData] = useState({
    name: "",
    email: "",
    role: "",
    status: "",
    verified: false,
  })
  const [isUpdating, setIsUpdating] = useState(false)

  const filteredUsers = userData.filter((user) => {
    const matchesSearch =
      user.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      user.email.toLowerCase().includes(searchQuery.toLowerCase())

    const matchesRole = selectedRole === "all" || user.role === selectedRole
    const matchesStatus = selectedStatus === "all" || user.status === selectedStatus

    return matchesSearch && matchesRole && matchesStatus
  })

  const userStats = {
    totalUsers: userData.length,
    activeUsers: userData.filter((user) => user.status === "active").length,
    customers: userData.filter((user) => user.role === "customer").length,
    staff: userData.filter((user) => user.role === "staff" || user.role === "manager").length,
  }

  const handleEditUser = (user: any) => {
    setSelectedUser(user)
    setEditData({
      name: user.name,
      email: user.email,
      role: user.role,
      status: user.status,
      verified: user.verified,
    })
  }

  const handleUpdateUser = async () => {
    if (!selectedUser) return

    setIsUpdating(true)

    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 2000))

    // In a real app, you would:
    // 1. Validate the user data
    // 2. Update the user in the database
    // 3. Send notification emails if needed
    // 4. Log the changes for audit purposes
    // 5. Update user permissions if role changed

    console.log("User updated:", {
      userId: selectedUser.id,
      changes: editData,
    })

    setIsUpdating(false)
    setSelectedUser(null)
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
              <h1 className="text-2xl font-bold">User Management</h1>
              <p className="text-muted-foreground">Manage user accounts, roles, and permissions</p>
            </div>
            <div className="flex items-center gap-4">
              <Button variant="outline">
                <Mail className="h-4 w-4 mr-2" />
                Send Bulk Email
              </Button>
              <Button variant="outline">Export Users</Button>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        {/* User Stats */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Users</CardTitle>
              <Users className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{userStats.totalUsers}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Active Users</CardTitle>
              <Users className="h-4 w-4 text-green-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-green-600">{userStats.activeUsers}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Customers</CardTitle>
              <Users className="h-4 w-4 text-blue-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-blue-600">{userStats.customers}</div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Staff</CardTitle>
              <Shield className="h-4 w-4 text-purple-600" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-purple-600">{userStats.staff}</div>
            </CardContent>
          </Card>
        </div>

        {/* User Management */}
        <Card>
          <CardHeader>
            <CardTitle>User Accounts</CardTitle>
          </CardHeader>
          <CardContent>
            {/* Search and Filters */}
            <div className="flex gap-4 mb-6">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground h-4 w-4" />
                <Input
                  placeholder="Search by name or email..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="pl-10"
                />
              </div>
              <Select value={selectedRole} onValueChange={setSelectedRole}>
                <SelectTrigger className="w-32">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Roles</SelectItem>
                  <SelectItem value="customer">Customer</SelectItem>
                  <SelectItem value="staff">Staff</SelectItem>
                  <SelectItem value="manager">Manager</SelectItem>
                  <SelectItem value="administrator">Administrator</SelectItem>
                </SelectContent>
              </Select>
              <Select value={selectedStatus} onValueChange={setSelectedStatus}>
                <SelectTrigger className="w-32">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Status</SelectItem>
                  <SelectItem value="active">Active</SelectItem>
                  <SelectItem value="inactive">Inactive</SelectItem>
                  <SelectItem value="suspended">Suspended</SelectItem>
                </SelectContent>
              </Select>
            </div>

            {/* Users Table */}
            <div className="space-y-4">
              {filteredUsers.length === 0 ? (
                <div className="text-center py-8">
                  <p className="text-muted-foreground">No users found matching your criteria</p>
                </div>
              ) : (
                filteredUsers.map((user) => (
                  <Card key={user.id} className="hover:shadow-md transition-shadow">
                    <CardContent className="p-6">
                      <div className="flex items-center justify-between">
                        <div className="space-y-2">
                          <div className="flex items-center gap-4">
                            <h3 className="font-semibold text-lg">{user.name}</h3>
                            <Badge className={roleColors[user.role as keyof typeof roleColors]}>
                              {user.role.charAt(0).toUpperCase() + user.role.slice(1)}
                            </Badge>
                            <Badge className={statusColors[user.status as keyof typeof statusColors]}>
                              {user.status.charAt(0).toUpperCase() + user.status.slice(1)}
                            </Badge>
                            {user.verified && (
                              <Badge variant="outline" className="text-green-600 border-green-600">
                                Verified
                              </Badge>
                            )}
                          </div>
                          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
                            <div>
                              <span className="font-medium">Email:</span>
                              <span className="ml-1">{user.email}</span>
                            </div>
                            <div>
                              <span className="font-medium">Join Date:</span>
                              <span className="ml-1">{new Date(user.joinDate).toLocaleDateString()}</span>
                            </div>
                            <div>
                              <span className="font-medium">Last Login:</span>
                              <span className="ml-1">{new Date(user.lastLogin).toLocaleDateString()}</span>
                            </div>
                            <div>
                              <span className="font-medium">Orders:</span>
                              <span className="ml-1">{user.orders}</span>
                            </div>
                          </div>
                          {user.role === "customer" && (
                            <div className="text-sm text-muted-foreground">
                              <span className="font-medium">Total Spent:</span>
                              <span className="ml-1">${user.totalSpent.toFixed(2)}</span>
                            </div>
                          )}
                        </div>

                        <div className="flex items-center gap-2">
                          <Dialog>
                            <DialogTrigger asChild>
                              <Button variant="outline" size="sm" onClick={() => handleEditUser(user)}>
                                <Edit className="h-4 w-4 mr-1" />
                                Edit
                              </Button>
                            </DialogTrigger>
                            <DialogContent className="max-w-md">
                              <DialogHeader>
                                <DialogTitle>Edit User Account</DialogTitle>
                              </DialogHeader>
                              <div className="space-y-4">
                                <div>
                                  <Label htmlFor="name">Full Name</Label>
                                  <Input
                                    id="name"
                                    value={editData.name}
                                    onChange={(e) => setEditData((prev) => ({ ...prev, name: e.target.value }))}
                                  />
                                </div>

                                <div>
                                  <Label htmlFor="email">Email Address</Label>
                                  <Input
                                    id="email"
                                    type="email"
                                    value={editData.email}
                                    onChange={(e) => setEditData((prev) => ({ ...prev, email: e.target.value }))}
                                  />
                                </div>

                                <div className="grid grid-cols-2 gap-4">
                                  <div>
                                    <Label htmlFor="role">Role</Label>
                                    <Select
                                      value={editData.role}
                                      onValueChange={(value) => setEditData((prev) => ({ ...prev, role: value }))}
                                    >
                                      <SelectTrigger>
                                        <SelectValue />
                                      </SelectTrigger>
                                      <SelectContent>
                                        <SelectItem value="customer">Customer</SelectItem>
                                        <SelectItem value="staff">Staff</SelectItem>
                                        <SelectItem value="manager">Manager</SelectItem>
                                        <SelectItem value="administrator">Administrator</SelectItem>
                                      </SelectContent>
                                    </Select>
                                  </div>
                                  <div>
                                    <Label htmlFor="status">Status</Label>
                                    <Select
                                      value={editData.status}
                                      onValueChange={(value) => setEditData((prev) => ({ ...prev, status: value }))}
                                    >
                                      <SelectTrigger>
                                        <SelectValue />
                                      </SelectTrigger>
                                      <SelectContent>
                                        <SelectItem value="active">Active</SelectItem>
                                        <SelectItem value="inactive">Inactive</SelectItem>
                                        <SelectItem value="suspended">Suspended</SelectItem>
                                      </SelectContent>
                                    </Select>
                                  </div>
                                </div>

                                <div className="flex items-center space-x-2">
                                  <Checkbox
                                    id="verified"
                                    checked={editData.verified}
                                    onCheckedChange={(checked) =>
                                      setEditData((prev) => ({ ...prev, verified: checked as boolean }))
                                    }
                                  />
                                  <Label htmlFor="verified">Email Verified</Label>
                                </div>

                                <Button
                                  onClick={handleUpdateUser}
                                  disabled={!editData.name || !editData.email || isUpdating}
                                  className="w-full"
                                >
                                  {isUpdating ? "Updating..." : "Update User"}
                                </Button>
                              </div>
                            </DialogContent>
                          </Dialog>

                          <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                              <Button variant="outline" size="sm">
                                <MoreHorizontal className="h-4 w-4" />
                              </Button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent>
                              <DropdownMenuItem>
                                <Mail className="h-4 w-4 mr-2" />
                                Send Email
                              </DropdownMenuItem>
                              <DropdownMenuItem>
                                <Calendar className="h-4 w-4 mr-2" />
                                View Activity Log
                              </DropdownMenuItem>
                              {user.role === "customer" && (
                                <DropdownMenuItem>
                                  <Users className="h-4 w-4 mr-2" />
                                  View Orders
                                </DropdownMenuItem>
                              )}
                              <DropdownMenuItem className="text-red-600">
                                <Trash2 className="h-4 w-4 mr-2" />
                                Delete User
                              </DropdownMenuItem>
                            </DropdownMenuContent>
                          </DropdownMenu>
                        </div>
                      </div>
                    </CardContent>
                  </Card>
                ))
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
