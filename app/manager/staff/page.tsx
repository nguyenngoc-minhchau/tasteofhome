"use client"

import { useState, useEffect } from "react"
import Link from "next/link"
import { ArrowLeft, Users, Calendar, Phone, Mail, Edit, Star, Award, Plus } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Badge } from "@/components/ui/badge"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Progress } from "@/components/ui/progress"

const departmentColors = {
  Management: "bg-purple-500",
	Sales: "bg-blue-500",
	Operations: "bg-green-500",
	"Customer Service": "bg-orange-500",
}

export default function StaffDetailsManagement() {
	const [staff, setStaff] = useState<any[]>([])
	const [isMounted, setIsMounted] = useState(false)
	const [selectedStaff, setSelectedStaff] = useState<any>(null)
	const [isDialogOpen, setIsDialogOpen] = useState(false)
	const [searchQuery, setSearchQuery] = useState("")
	const [filterDepartment, setFilterDepartment] = useState("all")
	const [editData, setEditData] = useState({
		name: "",
		email: "",
		phone: "",
		position: "",
		department: "",
		salary: 0,
	})

	useEffect(() => {
		setIsMounted(true)
		const staffList = JSON.parse(localStorage.getItem("staffList") || "[]")
		setStaff(staffList)
	}, [])

	if (!isMounted) return null // Chỉ render sau khi đã mount ở client

	const filteredStaff = staff.filter((member) => {
		const matchesSearch =
			member.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
			member.position.toLowerCase().includes(searchQuery.toLowerCase()) ||
			member.email.toLowerCase().includes(searchQuery.toLowerCase())

		const matchesDepartment = filterDepartment === "all" || member.department === filterDepartment

		return matchesSearch && matchesDepartment
	})

	const staffStats = {
		totalStaff: staff.length,
		activeStaff: staff.filter((s) => s.status === "active").length,
		departments: [...new Set(staff.map((s) => s.department))].length,
		avgRating: (
			staff.reduce(
				(sum, s) =>
					sum +
					(s.performance && typeof s.performance.customerRating === "number"
						? s.performance.customerRating
						: 0),
				0
			) / (staff.filter((s) => s.performance && typeof s.performance.customerRating === "number").length || 1)
		).toFixed(1),
	}

	const handleEditStaff = (member: any) => {
		setSelectedStaff(member)
		setEditData({
			name: member.name,
			email: member.email,
			phone: member.phone,
			position: member.position,
			department: member.department,
			salary: member.salary,
		})
		setIsDialogOpen(true)
	}

	const handleUpdateStaff = () => {
		if (!selectedStaff) return

		const updatedStaff = staff.map((member) =>
			member.id === selectedStaff.id ? { ...member, ...editData } : member
		)

		setStaff(updatedStaff)
		localStorage.setItem("staffList", JSON.stringify(updatedStaff))
		setSelectedStaff(null)
		setIsDialogOpen(false)
	}

	return (
		<div className="min-h-screen bg-background">
			{/* Header */}
			<header className="border-b">
				<div className="container mx-auto px-4 py-4">
					<div className="flex items-center justify-between">
						<div>
							<Link href="/manager" className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-2">
								<ArrowLeft className="h-5 w-5" />
								Back to Manager Dashboard
							</Link>
							<h1 className="text-2xl font-bold">Staff Details Management</h1>
							<p className="text-muted-foreground">Manage staff profiles, schedules, and performance</p>
						</div>
						<Link href="/manager/staff/add">
							<Button>
								<Plus className="h-4 w-4 mr-2" />
								Add New Staff
							</Button>
						</Link>
					</div>
				</div>
			</header>

			<div className="container mx-auto px-4 py-8">
				{/* Staff Stats */}
				{staff.length > 0 && (
					<div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
						<Card>
							<CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
								<CardTitle className="text-sm font-medium">Total Staff</CardTitle>
								<Users className="h-4 w-4 text-muted-foreground" />
							</CardHeader>
							<CardContent>
								<div className="text-2xl font-bold">{staffStats.totalStaff}</div>
							</CardContent>
						</Card>
						<Card>
							<CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
								<CardTitle className="text-sm font-medium">Active Staff</CardTitle>
								<Users className="h-4 w-4 text-green-600" />
							</CardHeader>
							<CardContent>
								<div className="text-2xl font-bold text-green-600">{staffStats.activeStaff}</div>
							</CardContent>
						</Card>
						<Card>
							<CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
								<CardTitle className="text-sm font-medium">Departments</CardTitle>
								<Award className="h-4 w-4 text-blue-600" />
							</CardHeader>
							<CardContent>
								<div className="text-2xl font-bold text-blue-600">{staffStats.departments}</div>
							</CardContent>
						</Card>
						<Card>
							<CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
								<CardTitle className="text-sm font-medium">Avg Rating</CardTitle>
								<Star className="h-4 w-4 text-yellow-600" />
							</CardHeader>
							<CardContent>
								<div className="text-2xl font-bold text-yellow-600">{staffStats.avgRating}</div>
							</CardContent>
						</Card>
					</div>
				)}

				<Tabs defaultValue="directory">
					<TabsList>
						<TabsTrigger value="directory">Staff Directory</TabsTrigger>
						<TabsTrigger value="schedule">Schedule Management</TabsTrigger>
						<TabsTrigger value="performance">Performance Tracking</TabsTrigger>
					</TabsList>

					<TabsContent value="directory">
						<Card>
							<CardHeader>
								<div className="flex items-center justify-between">
									<CardTitle>Staff Directory</CardTitle>
									<div className="flex gap-4">
										<Input
											placeholder="Search staff..."
											value={searchQuery}
											onChange={(e) => setSearchQuery(e.target.value)}
											className="w-64"
										/>
										<Select value={filterDepartment} onValueChange={setFilterDepartment}>
											<SelectTrigger className="w-40">
												<SelectValue />
											</SelectTrigger>
											<SelectContent>
												<SelectItem value="all">All Departments</SelectItem>
												<SelectItem value="Management">Management</SelectItem>
												<SelectItem value="Sales">Sales</SelectItem>
												<SelectItem value="Operations">Operations</SelectItem>
												<SelectItem value="Customer Service">Customer Service</SelectItem>
											</SelectContent>
										</Select>
									</div>
								</div>
							</CardHeader>
							<CardContent>
								{staff.length === 0 ? (
									<div className="text-center text-muted-foreground py-12">No staff data available.</div>
								) : (
									<div className="grid grid-cols-1 md:grid-cols-2 gap-6">
										{filteredStaff.map((member) => (
											<Card key={member.id} className="hover:shadow-md transition-shadow">
												<CardContent className="p-6">
													<div className="flex items-start justify-between">
														<div className="flex items-start gap-4">
															<Avatar className="w-12 h-12">
																<AvatarImage src={member.avatar || "/placeholder.svg"} alt={member.name || ""} />
																<AvatarFallback>
																	{(member.name || "")
																		.split(" ")
																		.map((n: string) => n[0])
																		.join("")}
																</AvatarFallback>
															</Avatar>
															<div className="space-y-2">
																<div>
																	<h3 className="font-semibold text-lg">{member.name}</h3>
																	<p className="text-sm text-muted-foreground">{member.position}</p>
																</div>
																<Badge className={departmentColors[member.department as keyof typeof departmentColors]}>
																	{member.department}
																</Badge>
																<div className="space-y-1 text-sm">
																	<div className="flex items-center gap-2">
																		<Mail className="h-3 w-3" />
																		<span>{member.email}</span>
																	</div>
																	<div className="flex items-center gap-2">
																		<Phone className="h-3 w-3" />
																		<span>{member.phone}</span>
																	</div>
																	<div className="flex items-center gap-2">
																		<Calendar className="h-3 w-3" />
																		<span>
																			Since{" "}
																			{member.hireDate
																				? new Date(member.hireDate).toLocaleDateString()
																				: ""}
																		</span>
																	</div>
																</div>
															</div>
														</div>
														<Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
															<DialogTrigger asChild>
																<Button variant="outline" size="sm" onClick={() => handleEditStaff(member)}>
																	<Edit className="h-4 w-4 mr-1" />
																	Edit
																</Button>
															</DialogTrigger>
															<DialogContent className="max-w-2xl">
																<DialogHeader>
																	<DialogTitle>Staff Member Details</DialogTitle>
																</DialogHeader>
																<Tabs defaultValue="profile">
																	<TabsList>
																		<TabsTrigger value="profile">Profile</TabsTrigger>
																		<TabsTrigger value="schedule">Schedule</TabsTrigger>
																		<TabsTrigger value="performance">Performance</TabsTrigger>
																		<TabsTrigger value="emergency">Emergency</TabsTrigger>
																	</TabsList>

																	<TabsContent value="profile" className="space-y-4">
																		<div className="grid grid-cols-2 gap-4">
																			<div>
																				<Label htmlFor="name">Full Name</Label>
																				<Input
																					id="name"
																					value={editData.name}
																					onChange={(e) => setEditData((prev) => ({ ...prev, name: e.target.value }))}
																				/>
																			</div>
																			<div>
																				<Label htmlFor="email">Email</Label>
																				<Input
																					id="email"
																					value={editData.email}
																					onChange={(e) => setEditData((prev) => ({ ...prev, email: e.target.value }))}
																				/>
																			</div>
																		</div>
																		<div className="grid grid-cols-2 gap-4">
																			<div>
																				<Label htmlFor="phone">Phone</Label>
																				<Input
																					id="phone"
																					value={editData.phone}
																					onChange={(e) => setEditData((prev) => ({ ...prev, phone: e.target.value }))}
																				/>
																			</div>
																			<div>
																				<Label htmlFor="position">Position</Label>
																				<Input
																					id="position"
																					value={editData.position}
																					onChange={(e) => setEditData((prev) => ({ ...prev, position: e.target.value }))}
																				/>
																			</div>
																		</div>
																		<div className="grid grid-cols-2 gap-4">
																			<div>
																				<Label htmlFor="department">Department</Label>
																				<Select
																					value={editData.department}
																					onValueChange={(value) =>
																						setEditData((prev) => ({ ...prev, department: value }))
																					}
																				>
																					<SelectTrigger>
																						<SelectValue />
																					</SelectTrigger>
																					<SelectContent>
																						<SelectItem value="Management">Management</SelectItem>
																						<SelectItem value="Sales">Sales</SelectItem>
																						<SelectItem value="Operations">Operations</SelectItem>
																						<SelectItem value="Customer Service">Customer Service</SelectItem>
																					</SelectContent>
																				</Select>
																			</div>
																			<div>
																				<Label htmlFor="salary">Annual Salary</Label>
																				<Input
																					id="salary"
																					type="number"
																					value={editData.salary}
																					onChange={(e) =>
																						setEditData((prev) => ({ ...prev, salary: Number(e.target.value) }))
																					}
																				/>
																			</div>
																		</div>
																		<div>
																			<h4 className="font-medium mb-2">Skills</h4>
																			<div className="flex gap-2 flex-wrap">
																				{member.skills.map((skill: string, index: number) => (
																					<Badge key={index} variant="outline">
																						{skill}
																					</Badge>
																				))}
																			</div>
																		</div>
																		<Button onClick={handleUpdateStaff} className="w-full">
																			Update Profile
																		</Button>
																	</TabsContent>

																	<TabsContent value="schedule" className="space-y-4">
																		<div className="space-y-3">
																			{Object.entries(member.schedule).map(([day, hours]) => (
																				<div key={day} className="flex justify-between items-center p-3 border rounded">
																					<span className="font-medium capitalize">{day}</span>
																					<span className={hours === "Off" ? "text-red-600" : "text-green-600"}>
																						{String(hours)}
																					</span>
																				</div>
																			))}
																		</div>
																	</TabsContent>

																	<TabsContent value="performance" className="space-y-4">
																		<div className="grid grid-cols-2 gap-4">
																			<div>
																				<Label>Orders Processed</Label>
																				<div className="text-2xl font-bold">{member.performance?.ordersProcessed ?? 0}</div>
																			</div>
																			<div>
																				<Label>Customer Rating</Label>
																				<div className="text-2xl font-bold flex items-center gap-1">
																					{member.performance?.customerRating ?? 0}
																					<Star className="h-5 w-5 text-yellow-500 fill-current" />
																				</div>
																			</div>
																		</div>
																		<div>
																			<Label>Tasks Completed: {member.performance?.tasksCompleted ?? 0}</Label>
																			<Progress value={member.performance?.tasksCompleted ?? 0} className="mt-1" />
																		</div>
																		<div>
																			<Label>Attendance: {member.performance?.attendance ?? 0}%</Label>
																			<Progress value={member.performance?.attendance ?? 0} className="mt-1" />
																		</div>
																	</TabsContent>

																	<TabsContent value="emergency" className="space-y-4">
																		<div className="space-y-3">
																			<div>
																				<Label>Emergency Contact Name</Label>
																				<Input value={member.emergencyContact.name} disabled />
																			</div>
																			<div>
																				<Label>Relationship</Label>
																				<Input value={member.emergencyContact.relationship} disabled />
																			</div>
																			<div>
																				<Label>Emergency Phone</Label>
																				<Input value={member.emergencyContact.phone} disabled />
																			</div>
																		</div>
																	</TabsContent>
																</Tabs>
															</DialogContent>
														</Dialog>
													</div>
												</CardContent>
											</Card>
										))}
									</div>
								)}
							</CardContent>
						</Card>
					</TabsContent>

					<TabsContent value="schedule">
						<Card>
							<CardHeader>
								<CardTitle>Weekly Schedule Overview</CardTitle>
							</CardHeader>
							<CardContent>
								{staff.length === 0 ? (
									<div className="text-center text-muted-foreground py-12">No staff data available.</div>
								) : (
									<div className="space-y-6">
										{staff.map((member) => (
											<div key={member.id} className="border rounded-lg p-4">
												<div className="flex items-center gap-3 mb-4">
													<Avatar className="w-8 h-8">
														<AvatarImage src={member.avatar || "/placeholder.svg"} alt={member.name} />
														<AvatarFallback>
															{member.name
																.split(" ")
																.map((n: string) => n[0])
																.join("")}
														</AvatarFallback>
													</Avatar>
													<div>
														<h4 className="font-medium">{member.name}</h4>
														<p className="text-sm text-muted-foreground">{member.position}</p>
													</div>
												</div>
												<div className="grid grid-cols-7 gap-2">
													{Object.entries(member.schedule).map(([day, hours]) => (
														<div key={day} className="text-center">
															<div className="text-xs font-medium capitalize mb-1">{day.slice(0, 3)}</div>
															<div
																className={`text-xs p-2 rounded ${
																	hours === "Off" ? "bg-red-100 text-red-700" : "bg-green-100 text-green-700"
																}`}
															>
																{hours === "Off" ? "OFF" : String(hours)}
															</div>
														</div>
													))}
												</div>
											</div>
										))}
									</div>
								)}
							</CardContent>
						</Card>
					</TabsContent>

					<TabsContent value="performance">
						<Card>
							<CardHeader>
								<CardTitle>Performance Metrics</CardTitle>
							</CardHeader>
							<CardContent>
								{staff.length === 0 ? (
									<div className="text-center text-muted-foreground py-12">No staff data available.</div>
								) : (
									<div className="space-y-6">
										{staff.map((member) => (
											<div key={member.id} className="border rounded-lg p-6">
												<div className="flex items-center justify-between mb-4">
													<div className="flex items-center gap-3">
														<Avatar className="w-10 h-10">
															<AvatarImage src={member.avatar || "/placeholder.svg"} alt={member.name} />
															<AvatarFallback>
																{member.name
																	.split(" ")
																	.map((n: string) => n[0])
																	.join("")}
															</AvatarFallback>
														</Avatar>
														<div>
															<h4 className="font-semibold">{member.name}</h4>
															<p className="text-sm text-muted-foreground">{member.position}</p>
														</div>
													</div>
													<Badge className={departmentColors[member.department as keyof typeof departmentColors]}>
														{member.department}
													</Badge>
												</div>

												<div className="grid grid-cols-1 md:grid-cols-4 gap-4">
													<div className="text-center">
														<div className="text-2xl font-bold text-blue-600">{member.performance?.ordersProcessed ?? 0}</div>
														<p className="text-sm text-muted-foreground">Orders Processed</p>
													</div>
													<div className="text-center">
														<div className="text-2xl font-bold text-yellow-600 flex items-center justify-center gap-1">
															{member.performance?.customerRating ?? 0}
															<Star className="h-5 w-5 fill-current" />
														</div>
														<p className="text-sm text-muted-foreground">Customer Rating</p>
													</div>
													<div className="text-center">
														<div className="text-2xl font-bold text-green-600">{member.performance?.tasksCompleted ?? 0}</div>
														<p className="text-sm text-muted-foreground">Tasks Completed</p>
													</div>
													<div className="text-center">
														<div className="text-2xl font-bold text-purple-600">{member.performance?.attendance ?? 0}%</div>
														<p className="text-sm text-muted-foreground">Attendance</p>
													</div>
												</div>

												<div className="mt-4 space-y-2">
													<div>
														<div className="flex justify-between text-sm mb-1">
															<span>Task Completion</span>
															<span>{member.performance?.tasksCompleted ?? 0}%</span>
														</div>
														<Progress value={member.performance?.tasksCompleted ?? 0} />
													</div>
													<div>
														<div className="flex justify-between text-sm mb-1">
															<span>Attendance</span>
															<span>{member.performance?.attendance ?? 0}%</span>
														</div>
														<Progress value={member.performance?.attendance ?? 0} />
													</div>
												</div>
											</div>
										))}
									</div>
								)}
							</CardContent>
						</Card>
					</TabsContent>
				</Tabs>
			</div>
		</div>
	)
}
