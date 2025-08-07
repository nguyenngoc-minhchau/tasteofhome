"use client" 

import { useState, useEffect } from "react"
import Link from "next/link"
import {
    Package, // Icon cho san pham
    Users, // Icon cho nhan vien
    ShoppingCart, // Icon cho don hang
    TrendingUp, // Icon cho doanh so
    AlertTriangle, // Icon cho canh bao
    DollarSign, // Icon cho tien te
    BarChart3, // Icon cho bao cao
    RefreshCw, // Icon cho kho hang/doi tra
    LogOut, // Icon dang xuat
} from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Alert, AlertDescription } from "@/components/ui/alert"
import { useAuth } from "@/components/auth-provider"
import { useRouter } from "next/navigation"

// Component chinh cua dashboard quan ly
export default function ManagerDashboard() {
    // Lay thong tin user va cac ham tu AuthProvider
    const { user, isLoggedIn, logout } = useAuth()
    // Su dung hook useRouter de dieu huong trang
    const router = useRouter()
    
    // State luu tru cac so lieu kinh doanh
    const [businessStats, setBusinessStats] = useState({
        totalProducts: 156,
        lowStockProducts: 8,
        totalStaff: 12,
        activeOrders: 45,
        todayRevenue: 2847.5,
        monthlyRevenue: 45678.9,
        pendingReturns: 3,
        inventoryValue: 125000,
    })

    // Su dung useEffect de xu ly xac thuc va chuyen huong
    useEffect(() => {
        // Neu chua dang nhap, chuyen huong ve trang dang nhap
        if (!isLoggedIn) {
            router.push('/auth');
        // Neu da dang nhap nhung vai tro khong phai quan ly, chuyen huong ve dashboard tuong ung
        } else if (user?.role !== "manager") {
            router.push('/dashboard');
        }
    }, [isLoggedIn, user, router]);

    // Ham xu ly dang xuat
    const handleLogout = () => {
        logout(); // Goi ham logout tu context
        router.push('/auth'); // Chuyen huong ve trang dang nhap
    }

    // Neu chua dang nhap hoac khong phai quan ly, khong hien thi gi ca
    if (!isLoggedIn || user?.role !== "manager") {
        return null;
    }

    // Giao dien chinh cua dashboard
    return (
        <div className="min-h-screen bg-background">
            {/* Phan header cua dashboard */}
            <header className="border-b">
                <div className="container mx-auto px-4 py-4">
                    <div className="flex items-center justify-between">
                        <div>
                            {/* Tieu de dashboard */}
                            <h1 className="text-3xl font-bold">Manager Dashboard</h1>
                            {/* Mo ta ngan gon */}
                            <p className="text-muted-foreground">Manage business operations, products, staff, and inventory</p>
                        </div>
                        <div className="flex items-center gap-4">
                            {/* Huy hieu the hien quyen truy cap */}
                            <Badge variant="secondary">Manager Access</Badge>
                            {/* Nut dang xuat */}
                            <Button variant="outline" onClick={handleLogout}>
                                <LogOut className="mr-2 h-4 w-4" />
                                Logout
                            </Button>
                        </div>
                    </div>
                </div>
            </header>

            {/* Phan noi dung chinh cua dashboard */}
            <div className="container mx-auto px-4 py-8">
                {/* Phan tong quan kinh doanh voi 4 the hien thi so lieu */}
                <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                    {/* The hien thi doanh thu hom nay */}
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">Today's Revenue</CardTitle>
                            <DollarSign className="h-4 w-4 text-green-600" />
                        </CardHeader>
                        <CardContent>
                            <div className="text-2xl font-bold text-green-600">${businessStats.todayRevenue.toLocaleString()}</div>
                            <p className="text-xs text-muted-foreground">+12% from yesterday</p>
                        </CardContent>
                    </Card>

                    {/* The hien thi don hang dang hoat dong */}
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">Active Orders</CardTitle>
                            <ShoppingCart className="h-4 w-4 text-blue-600" />
                        </CardHeader>
                        <CardContent>
                            <div className="text-2xl font-bold text-blue-600">{businessStats.activeOrders}</div>
                            <p className="text-xs text-muted-foreground">Processing & shipped</p>
                        </CardContent>
                    </Card>

                    {/* The hien thi san pham ton kho thap */}
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">Low Stock Items</CardTitle>
                            <AlertTriangle className="h-4 w-4 text-yellow-600" />
                        </CardHeader>
                        <CardContent>
                            <div className="text-2xl font-bold text-yellow-600">{businessStats.lowStockProducts}</div>
                            <p className="text-xs text-muted-foreground">Need restocking</p>
                        </CardContent>
                    </Card>

                    {/* The hien thi so luong nhan vien */}
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">Staff Members</CardTitle>
                            <Users className="h-4 w-4 text-purple-600" />
                        </CardHeader>
                        <CardContent>
                            <div className="text-2xl font-bold text-purple-600">{businessStats.totalStaff}</div>
                            <p className="text-xs text-muted-foreground">Active employees</p>
                        </CardContent>
                    </Card>
                </div>

                {/* Phan cac hanh dong nhanh */}
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                    {/* Lien ket den trang quan ly san pham */}
                    <Link href="/manager/products">
                        <Card className="hover:shadow-md transition-shadow cursor-pointer">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <Package className="h-5 w-5" />
                                    Product Management
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <p className="text-sm text-muted-foreground mb-4">
                                    Add, edit, and manage your product catalog. Update pricing, descriptions, and availability.
                                </p>
                                <div className="flex items-center justify-between">
                                    <span className="text-sm font-medium">Total Products</span>
                                    <Badge variant="outline">{businessStats.totalProducts}</Badge>
                                </div>
                            </CardContent>
                        </Card>
                    </Link>

                    {/* Lien ket den trang quan ly kho hang */}
                    <Link href="/manager/inventory">
                        <Card className="hover:shadow-md transition-shadow cursor-pointer">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <RefreshCw className="h-5 w-5" />
                                    Inventory Management
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <p className="text-sm text-muted-foreground mb-4">
                                    Monitor stock levels, adjust inventory, and manage supplier relationships.
                                </p>
                                <div className="flex items-center justify-between">
                                    <span className="text-sm font-medium">Inventory Value</span>
                                    <Badge variant="outline">${businessStats.inventoryValue.toLocaleString()}</Badge>
                                </div>
                            </CardContent>
                        </Card>
                    </Link>

                    {/* Lien ket den trang quan ly nhan vien */}
                    <Link href="/manager/staff">
                        <Card className="hover:shadow-md transition-shadow cursor-pointer">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <Users className="h-5 w-5" />
                                    Staff Management
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <p className="text-sm text-muted-foreground mb-4">
                                    Manage employee profiles, schedules, performance, and hiring processes.
                                </p>
                                <div className="flex items-center justify-between">
                                    <span className="text-sm font-medium">Active Staff</span>
                                    <Badge variant="outline">{businessStats.totalStaff}</Badge>
                                </div>
                            </CardContent>
                        </Card>
                    </Link>

                    {/* Lien ket den trang quan ly don hang */}
                    <Link href="/manager/orders">
                        <Card className="hover:shadow-md transition-shadow cursor-pointer">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <ShoppingCart className="h-5 w-5" />
                                    Order Management
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <p className="text-sm text-muted-foreground mb-4">
                                    Process orders, update shipping status, and handle customer requests.
                                </p>
                                <div className="flex items-center justify-between">
                                    <span className="text-sm font-medium">Active Orders</span>
                                    <Badge variant="outline">{businessStats.activeOrders}</Badge>
                                </div>
                            </CardContent>
                        </Card>
                    </Link>

                    {/* Lien ket den trang quan ly doi tra */}
                    <Link href="/manager/returns">
                        <Card className="hover:shadow-md transition-shadow cursor-pointer">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <RefreshCw className="h-5 w-5" />
                                    Return Management
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <p className="text-sm text-muted-foreground mb-4">
                                    Handle return requests, process refunds, and manage return policies.
                                </p>
                                <div className="flex items-center justify-between">
                                    <span className="text-sm font-medium">Pending Returns</span>
                                    <Badge variant="outline">{businessStats.pendingReturns}</Badge>
                                </div>
                            </CardContent>
                        </Card>
                    </Link>

                    {/* Lien ket den trang bao cao doanh so */}
                    <Link href="/manager/reports">
                        <Card className="hover:shadow-md transition-shadow cursor-pointer">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <BarChart3 className="h-5 w-5" />
                                    Sales Reports
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <p className="text-sm text-muted-foreground mb-4">
                                    View sales analytics, performance metrics, and business insights.
                                </p>
                                <div className="flex items-center justify-between">
                                    <span className="text-sm font-medium">Monthly Revenue</span>
                                    <Badge variant="outline">${businessStats.monthlyRevenue.toLocaleString()}</Badge>
                                </div>
                            </CardContent>
                        </Card>
                    </Link>
                </div>

                {/* Phan hoat dong gan day va canh bao */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    {/* The hien thi hoat dong gan day */}
                    <Card>
                        <CardHeader>
                            <CardTitle>Recent Business Activity</CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <div className="space-y-3">
                                <div className="flex items-start gap-3">
                                    <div className="w-2 h-2 bg-green-500 rounded-full mt-2"></div>
                                    <div>
                                        <p className="text-sm font-medium">New product added: Organic Matcha Tea</p>
                                        <p className="text-xs text-muted-foreground">30 minutes ago</p>
                                    </div>
                                </div>
                                <div className="flex items-start gap-3">
                                    <div className="w-2 h-2 bg-blue-500 rounded-full mt-2"></div>
                                    <div>
                                        <p className="text-sm font-medium">Inventory restocked: Ethiopian Coffee</p>
                                        <p className="text-xs text-muted-foreground">2 hours ago</p>
                                    </div>
                                </div>
                                <div className="flex items-start gap-3">
                                    <div className="w-2 h-2 bg-purple-500 rounded-full mt-2"></div>
                                    <div>
                                        <p className="text-sm font-medium">New staff member hired: Sarah Johnson</p>
                                        <p className="text-xs text-muted-foreground">5 hours ago</p>
                                    </div>
                                </div>
                                <div className="flex items-start gap-3">
                                    <div className="w-2 h-2 bg-orange-500 rounded-full mt-2"></div>
                                    <div>
                                        <p className="text-sm font-medium">Return processed: Order #ORD-2024-001</p>
                                        <p className="text-xs text-muted-foreground">1 day ago</p>
                                    </div>
                                </div>
                            </div>
                        </CardContent>
                    </Card>

                    {/* The hien thi canh bao va thong bao */}
                    <Card>
                        <CardHeader>
                            <CardTitle>Alerts & Notifications</CardTitle>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            {/* Canh bao ton kho thap */}
                            <Alert>
                                <AlertTriangle className="h-4 w-4" />
                                <AlertDescription>
                                    <strong>Low Stock Alert:</strong> 8 products are running low on inventory.
                                    <Link href="/manager/inventory" className="underline ml-1">
                                        Review now
                                    </Link>
                                </AlertDescription>
                            </Alert>

                            {/* Thong bao doanh so tang */}
                            <Alert>
                                <TrendingUp className="h-4 w-4" />
                                <AlertDescription>
                                    <strong>Sales Update:</strong> Monthly revenue is up 15% compared to last month.
                                    <Link href="/manager/reports" className="underline ml-1">
                                        View details
                                    </Link>
                                </AlertDescription>
                            </Alert>

                            {/* Thong bao lich lam viec nhan vien */}
                            <Alert>
                                <Users className="h-4 w-4" />
                                <AlertDescription>
                                    <strong>Staff Schedule:</strong> 3 staff members need schedule updates for next week.
                                    <Link href="/manager/staff" className="underline ml-1">
                                        Update schedules
                                    </Link>
                                </AlertDescription>
                            </Alert>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </div>
    )
}
