"use client"

import { useState } from "react"
import Link from "next/link"
import { ArrowLeft, Users, Plus, Calendar, Phone, Save } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Badge } from "@/components/ui/badge"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Textarea } from "@/components/ui/textarea"
import { Checkbox } from "@/components/ui/checkbox"
import { useRouter } from "next/navigation"

const departments = ["Management", "Sales", "Operations", "Customer Service", "Marketing", "IT Support", "Accounting"]

const positions = {
  Management: ["Store Manager", "Assistant Manager", "Department Head"],
  Sales: ["Sales Associate", "Senior Sales Associate", "Sales Lead"],
  Operations: ["Inventory Specialist", "Warehouse Associate", "Operations Coordinator"],
  "Customer Service": ["Customer Support Representative", "Customer Success Manager"],
  Marketing: ["Marketing Specialist", "Social Media Manager", "Content Creator"],
  "IT Support": ["IT Technician", "System Administrator", "Help Desk Specialist"],
  Accounting: ["Accountant", "Bookkeeper", "Financial Analyst"],
}

const commonSkills = [
  "Customer Service",
  "Leadership",
  "Communication",
  "Problem Solving",
  "Time Management",
  "Team Collaboration",
  "Data Entry",
  "Inventory Management",
  "POS Systems",
  "Microsoft Office",
  "Product Knowledge",
  "Sales Techniques",
  "Quality Control",
  "Project Management",
  "Social Media",
  "Marketing",
  "Accounting Software",
  "Technical Support",
]

const timeSlots = [
  "6:00 AM",
  "7:00 AM",
  "8:00 AM",
  "9:00 AM",
  "10:00 AM",
  "11:00 AM",
  "12:00 PM",
  "1:00 PM",
  "2:00 PM",
  "3:00 PM",
  "4:00 PM",
  "5:00 PM",
  "6:00 PM",
  "7:00 PM",
  "8:00 PM",
  "9:00 PM",
  "10:00 PM",
]

export default function AddStaffPage() {
  const [currentStep, setCurrentStep] = useState("basic")
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [errors, setErrors] = useState<Record<string, string>>({})
  const router = useRouter()
  const [success, setSuccess] = useState(false)

  const [formData, setFormData] = useState({
    // Basic Information
    name: "",
    email: "",
    phone: "",
    address: "",
    dateOfBirth: "",

    // Employment Details
    department: "",
    position: "",
    hireDate: "",
    employmentType: "full-time", // full-time, part-time, contract
    salary: "",

    // Skills and Qualifications
    skills: [] as string[],
    education: "",
    experience: "",
    certifications: "",

    // Schedule
    schedule: {
      monday: { start: "", end: "", isOff: false },
      tuesday: { start: "", end: "", isOff: false },
      wednesday: { start: "", end: "", isOff: false },
      thursday: { start: "", end: "", isOff: false },
      friday: { start: "", end: "", isOff: false },
      saturday: { start: "", end: "", isOff: true },
      sunday: { start: "", end: "", isOff: true },
    },

    // Emergency Contact
    emergencyContact: {
      name: "",
      relationship: "",
      phone: "",
      email: "",
    },

    // Additional Information
    notes: "",
  })

  const validateStep = (step: string) => {
    const newErrors: Record<string, string> = {}

    if (step === "basic") {
      if (!formData.name.trim()) newErrors.name = "Name is required"
      if (!formData.email.trim()) newErrors.email = "Email is required"
      if (!formData.phone.trim()) newErrors.phone = "Phone is required"
      if (!formData.dateOfBirth) newErrors.dateOfBirth = "Date of birth is required"
    }

    if (step === "employment") {
      if (!formData.department) newErrors.department = "Department is required"
      if (!formData.position) newErrors.position = "Position is required"
      if (!formData.hireDate) newErrors.hireDate = "Hire date is required"
      if (!formData.salary) newErrors.salary = "Salary is required"
    }

    if (step === "emergency") {
      if (!formData.emergencyContact.name.trim()) newErrors.emergencyContactName = "Emergency contact name is required"
      if (!formData.emergencyContact.phone.trim())
        newErrors.emergencyContactPhone = "Emergency contact phone is required"
      if (!formData.emergencyContact.relationship.trim())
        newErrors.emergencyContactRelationship = "Relationship is required"
    }

    setErrors(newErrors)
    return Object.keys(newErrors).length === 0
  }

  const handleNext = () => {
    if (validateStep(currentStep)) {
      const steps = ["basic", "employment", "skills", "schedule", "emergency"]
      const currentIndex = steps.indexOf(currentStep)
      if (currentIndex < steps.length - 1) {
        setCurrentStep(steps[currentIndex + 1])
      }
    }
  }

  const handlePrevious = () => {
    const steps = ["basic", "employment", "skills", "schedule", "emergency"]
    const currentIndex = steps.indexOf(currentStep)
    if (currentIndex > 0) {
      setCurrentStep(steps[currentIndex - 1])
    }
  }

  const handleSkillToggle = (skill: string) => {
    setFormData((prev) => ({
      ...prev,
      skills: prev.skills.includes(skill) ? prev.skills.filter((s) => s !== skill) : [...prev.skills, skill],
    }))
  }

  const handleScheduleChange = (day: string, field: string, value: string | boolean) => {
    setFormData((prev) => ({
      ...prev,
      schedule: {
        ...prev.schedule,
        [day]: {
          ...prev.schedule[day as keyof typeof prev.schedule],
          [field]: value,
        },
      },
    }))
  }

  const handleSubmit = async () => {
    if (!validateStep("emergency")) return

    setIsSubmitting(true)

    // Tạo staff mới
    const newStaff = { ...formData, id: Date.now() }
    // Lưu vào localStorage (giả lập backend)
    const staffList = JSON.parse(localStorage.getItem("staffList") || "[]")
    staffList.push(newStaff)
    localStorage.setItem("staffList", JSON.stringify(staffList))

    // Hiển thị thông báo thành công
    setSuccess(true)
    setIsSubmitting(false)

    // Chuyển hướng sau 1.5s
    setTimeout(() => {
      router.push("/admin/staff")
    }, 1500)
  }

  const getAvailablePositions = () => {
    return formData.department ? positions[formData.department as keyof typeof positions] || [] : []
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div>
              <Link
                href="/manager/staff"
                className="flex items-center gap-2 text-lg font-semibold hover:text-primary mb-2"
              >
                <ArrowLeft className="h-5 w-5" />
                Back to Staff Management
              </Link>
              <h1 className="text-2xl font-bold">Add New Staff Member</h1>
              <p className="text-muted-foreground">Create a new staff profile and set up their account</p>
            </div>
            <div className="flex items-center gap-2">
              <Badge variant="outline">
                Step {["basic", "employment", "skills", "schedule", "emergency"].indexOf(currentStep) + 1} of 5
              </Badge>
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto">
          {/* Progress Steps */}
          <div className="flex items-center justify-between mb-8">
            {[
              { key: "basic", label: "Basic Info", icon: Users },
              { key: "employment", label: "Employment", icon: Badge },
              { key: "skills", label: "Skills", icon: Plus },
              { key: "schedule", label: "Schedule", icon: Calendar },
              { key: "emergency", label: "Emergency", icon: Phone },
            ].map((step, index) => {
              const Icon = step.icon
              const isActive = currentStep === step.key
              const isCompleted =
                ["basic", "employment", "skills", "schedule", "emergency"].indexOf(currentStep) > index

              return (
                <div key={step.key} className="flex items-center">
                  <div
                    className={`flex items-center justify-center w-10 h-10 rounded-full border-2 ${
                      isActive
                        ? "border-primary bg-primary text-primary-foreground"
                        : isCompleted
                          ? "border-green-500 bg-green-500 text-white"
                          : "border-muted-foreground text-muted-foreground"
                    }`}
                  >
                    <Icon className="h-5 w-5" />
                  </div>
                  <span
                    className={`ml-2 text-sm font-medium ${
                      isActive ? "text-primary" : isCompleted ? "text-green-600" : "text-muted-foreground"
                    }`}
                  >
                    {step.label}
                  </span>
                  {index < 4 && <div className={`w-12 h-0.5 mx-4 ${isCompleted ? "bg-green-500" : "bg-muted"}`} />}
                </div>
              )
            })}
          </div>

          <Card>
            <CardContent className="p-8">
              {/* Basic Information */}
              {currentStep === "basic" && (
                <div className="space-y-6">
                  <div>
                    <h3 className="text-lg font-semibold mb-4">Basic Information</h3>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                      <div>
                        <Label htmlFor="name">Full Name *</Label>
                        <Input
                          id="name"
                          value={formData.name}
                          onChange={(e) => setFormData((prev) => ({ ...prev, name: e.target.value }))}
                          className={errors.name ? "border-red-500" : ""}
                        />
                        {errors.name && <p className="text-red-500 text-sm mt-1">{errors.name}</p>}
                      </div>

                      <div>
                        <Label htmlFor="email">Email Address *</Label>
                        <Input
                          id="email"
                          type="email"
                          value={formData.email}
                          onChange={(e) => setFormData((prev) => ({ ...prev, email: e.target.value }))}
                          className={errors.email ? "border-red-500" : ""}
                        />
                        {errors.email && <p className="text-red-500 text-sm mt-1">{errors.email}</p>}
                      </div>

                      <div>
                        <Label htmlFor="phone">Phone Number *</Label>
                        <Input
                          id="phone"
                          value={formData.phone}
                          onChange={(e) => setFormData((prev) => ({ ...prev, phone: e.target.value }))}
                          className={errors.phone ? "border-red-500" : ""}
                        />
                        {errors.phone && <p className="text-red-500 text-sm mt-1">{errors.phone}</p>}
                      </div>

                      <div>
                        <Label htmlFor="dateOfBirth">Date of Birth *</Label>
                        <Input
                          id="dateOfBirth"
                          type="date"
                          value={formData.dateOfBirth}
                          onChange={(e) => setFormData((prev) => ({ ...prev, dateOfBirth: e.target.value }))}
                          className={errors.dateOfBirth ? "border-red-500" : ""}
                        />
                        {errors.dateOfBirth && <p className="text-red-500 text-sm mt-1">{errors.dateOfBirth}</p>}
                      </div>
                    </div>

                    <div className="mt-6">
                      <Label htmlFor="address">Address</Label>
                      <Textarea
                        id="address"
                        value={formData.address}
                        onChange={(e) => setFormData((prev) => ({ ...prev, address: e.target.value }))}
                        rows={3}
                      />
                    </div>
                  </div>
                </div>
              )}

              {/* Employment Details */}
              {currentStep === "employment" && (
                <div className="space-y-6">
                  <div>
                    <h3 className="text-lg font-semibold mb-4">Employment Details</h3>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                      <div>
                        <Label htmlFor="department">Department *</Label>
                        <Select
                          value={formData.department}
                          onValueChange={(value) =>
                            setFormData((prev) => ({ ...prev, department: value, position: "" }))
                          }
                        >
                          <SelectTrigger className={errors.department ? "border-red-500" : ""}>
                            <SelectValue placeholder="Select department" />
                          </SelectTrigger>
                          <SelectContent>
                            {departments.map((dept) => (
                              <SelectItem key={dept} value={dept}>
                                {dept}
                              </SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                        {errors.department && <p className="text-red-500 text-sm mt-1">{errors.department}</p>}
                      </div>

                      <div>
                        <Label htmlFor="position">Position *</Label>
                        <Select
                          value={formData.position}
                          onValueChange={(value) => setFormData((prev) => ({ ...prev, position: value }))}
                          disabled={!formData.department}
                        >
                          <SelectTrigger className={errors.position ? "border-red-500" : ""}>
                            <SelectValue placeholder="Select position" />
                          </SelectTrigger>
                          <SelectContent>
                            {getAvailablePositions().map((pos) => (
                              <SelectItem key={pos} value={pos}>
                                {pos}
                              </SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                        {errors.position && <p className="text-red-500 text-sm mt-1">{errors.position}</p>}
                      </div>

                      <div>
                        <Label htmlFor="hireDate">Hire Date *</Label>
                        <Input
                          id="hireDate"
                          type="date"
                          value={formData.hireDate}
                          onChange={(e) => setFormData((prev) => ({ ...prev, hireDate: e.target.value }))}
                          className={errors.hireDate ? "border-red-500" : ""}
                        />
                        {errors.hireDate && <p className="text-red-500 text-sm mt-1">{errors.hireDate}</p>}
                      </div>

                      <div>
                        <Label htmlFor="employmentType">Employment Type</Label>
                        <Select
                          value={formData.employmentType}
                          onValueChange={(value) => setFormData((prev) => ({ ...prev, employmentType: value }))}
                        >
                          <SelectTrigger>
                            <SelectValue />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="full-time">Full-time</SelectItem>
                            <SelectItem value="part-time">Part-time</SelectItem>
                            <SelectItem value="contract">Contract</SelectItem>
                            <SelectItem value="intern">Intern</SelectItem>
                          </SelectContent>
                        </Select>
                      </div>

                      <div className="md:col-span-2">
                        <Label htmlFor="salary">Annual Salary *</Label>
                        <Input
                          id="salary"
                          type="number"
                          value={formData.salary}
                          onChange={(e) => setFormData((prev) => ({ ...prev, salary: e.target.value }))}
                          className={errors.salary ? "border-red-500" : ""}
                          placeholder="Enter annual salary"
                        />
                        {errors.salary && <p className="text-red-500 text-sm mt-1">{errors.salary}</p>}
                      </div>
                    </div>
                  </div>
                </div>
              )}

              {/* Skills and Qualifications */}
              {currentStep === "skills" && (
                <div className="space-y-6">
                  <div>
                    <h3 className="text-lg font-semibold mb-4">Skills and Qualifications</h3>

                    <div className="space-y-6">
                      <div>
                        <Label>Skills</Label>
                        <p className="text-sm text-muted-foreground mb-3">Select relevant skills for this position</p>
                        <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                          {commonSkills.map((skill) => (
                            <div key={skill} className="flex items-center space-x-2">
                              <Checkbox
                                id={skill}
                                checked={formData.skills.includes(skill)}
                                onCheckedChange={() => handleSkillToggle(skill)}
                              />
                              <Label htmlFor={skill} className="text-sm">
                                {skill}
                              </Label>
                            </div>
                          ))}
                        </div>
                      </div>

                      <div>
                        <Label htmlFor="education">Education</Label>
                        <Textarea
                          id="education"
                          value={formData.education}
                          onChange={(e) => setFormData((prev) => ({ ...prev, education: e.target.value }))}
                          placeholder="Degree, institution, graduation year..."
                          rows={3}
                        />
                      </div>

                      <div>
                        <Label htmlFor="experience">Previous Experience</Label>
                        <Textarea
                          id="experience"
                          value={formData.experience}
                          onChange={(e) => setFormData((prev) => ({ ...prev, experience: e.target.value }))}
                          placeholder="Previous work experience, achievements..."
                          rows={3}
                        />
                      </div>

                      <div>
                        <Label htmlFor="certifications">Certifications</Label>
                        <Textarea
                          id="certifications"
                          value={formData.certifications}
                          onChange={(e) => setFormData((prev) => ({ ...prev, certifications: e.target.value }))}
                          placeholder="Professional certifications, licenses..."
                          rows={2}
                        />
                      </div>
                    </div>
                  </div>
                </div>
              )}

              {/* Schedule */}
              {currentStep === "schedule" && (
                <div className="space-y-6">
                  <div>
                    <h3 className="text-lg font-semibold mb-4">Work Schedule</h3>
                    <p className="text-sm text-muted-foreground mb-6">
                      Set the weekly work schedule for this staff member
                    </p>

                    <div className="space-y-4">
                      {Object.entries(formData.schedule).map(([day, schedule]) => (
                        <div key={day} className="flex items-center gap-4 p-4 border rounded-lg">
                          <div className="w-24">
                            <Label className="capitalize font-medium">{day}</Label>
                          </div>

                          <div className="flex items-center space-x-2">
                            <Checkbox
                              id={`${day}-off`}
                              checked={schedule.isOff}
                              onCheckedChange={(checked) => handleScheduleChange(day, "isOff", checked as boolean)}
                            />
                            <Label htmlFor={`${day}-off`} className="text-sm">
                              Day Off
                            </Label>
                          </div>

                          {!schedule.isOff && (
                            <div className="flex items-center gap-2">
                              <Select
                                value={schedule.start}
                                onValueChange={(value) => handleScheduleChange(day, "start", value)}
                              >
                                <SelectTrigger className="w-32">
                                  <SelectValue placeholder="Start" />
                                </SelectTrigger>
                                <SelectContent>
                                  {timeSlots.map((time) => (
                                    <SelectItem key={time} value={time}>
                                      {time}
                                    </SelectItem>
                                  ))}
                                </SelectContent>
                              </Select>

                              <span className="text-muted-foreground">to</span>

                              <Select
                                value={schedule.end}
                                onValueChange={(value) => handleScheduleChange(day, "end", value)}
                              >
                                <SelectTrigger className="w-32">
                                  <SelectValue placeholder="End" />
                                </SelectTrigger>
                                <SelectContent>
                                  {timeSlots.map((time) => (
                                    <SelectItem key={time} value={time}>
                                      {time}
                                    </SelectItem>
                                  ))}
                                </SelectContent>
                              </Select>
                            </div>
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              )}

              {/* Emergency Contact */}
              {currentStep === "emergency" && (
                <div className="space-y-6">
                  <div>
                    <h3 className="text-lg font-semibold mb-4">Emergency Contact & Additional Information</h3>

                    <div className="space-y-6">
                      <div>
                        <h4 className="font-medium mb-3">Emergency Contact</h4>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                          <div>
                            <Label htmlFor="emergencyName">Contact Name *</Label>
                            <Input
                              id="emergencyName"
                              value={formData.emergencyContact.name}
                              onChange={(e) =>
                                setFormData((prev) => ({
                                  ...prev,
                                  emergencyContact: { ...prev.emergencyContact, name: e.target.value },
                                }))
                              }
                              className={errors.emergencyContactName ? "border-red-500" : ""}
                            />
                            {errors.emergencyContactName && (
                              <p className="text-red-500 text-sm mt-1">{errors.emergencyContactName}</p>
                            )}
                          </div>

                          <div>
                            <Label htmlFor="emergencyRelationship">Relationship *</Label>
                            <Input
                              id="emergencyRelationship"
                              value={formData.emergencyContact.relationship}
                              onChange={(e) =>
                                setFormData((prev) => ({
                                  ...prev,
                                  emergencyContact: { ...prev.emergencyContact, relationship: e.target.value },
                                }))
                              }
                              className={errors.emergencyContactRelationship ? "border-red-500" : ""}
                              placeholder="e.g., Spouse, Parent, Sibling"
                            />
                            {errors.emergencyContactRelationship && (
                              <p className="text-red-500 text-sm mt-1">{errors.emergencyContactRelationship}</p>
                            )}
                          </div>

                          <div>
                            <Label htmlFor="emergencyPhone">Phone Number *</Label>
                            <Input
                              id="emergencyPhone"
                              value={formData.emergencyContact.phone}
                              onChange={(e) =>
                                setFormData((prev) => ({
                                  ...prev,
                                  emergencyContact: { ...prev.emergencyContact, phone: e.target.value },
                                }))
                              }
                              className={errors.emergencyContactPhone ? "border-red-500" : ""}
                            />
                            {errors.emergencyContactPhone && (
                              <p className="text-red-500 text-sm mt-1">{errors.emergencyContactPhone}</p>
                            )}
                          </div>

                          <div>
                            <Label htmlFor="emergencyEmail">Email Address</Label>
                            <Input
                              id="emergencyEmail"
                              type="email"
                              value={formData.emergencyContact.email}
                              onChange={(e) =>
                                setFormData((prev) => ({
                                  ...prev,
                                  emergencyContact: { ...prev.emergencyContact, email: e.target.value },
                                }))
                              }
                            />
                          </div>
                        </div>
                      </div>

                      <div>
                        <Label htmlFor="notes">Additional Notes</Label>
                        <Textarea
                          id="notes"
                          value={formData.notes}
                          onChange={(e) => setFormData((prev) => ({ ...prev, notes: e.target.value }))}
                          placeholder="Any additional information about the staff member..."
                          rows={4}
                        />
                      </div>
                    </div>
                  </div>
                </div>
              )}

              {/* Navigation Buttons */}
              <div className="flex justify-between pt-8 border-t">
                <Button variant="outline" onClick={handlePrevious} disabled={currentStep === "basic"}>
                  Previous
                </Button>

                <div className="flex gap-2">
                  {currentStep !== "emergency" ? (
                    <Button onClick={handleNext}>Next</Button>
                  ) : (
                    <Button onClick={handleSubmit} disabled={isSubmitting}>
                      {isSubmitting ? (
                        <>
                          <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
                          Creating Staff Member...
                        </>
                      ) : (
                        <>
                          <Save className="h-4 w-4 mr-2" />
                          Create Staff Member
                        </>
                      )}
                    </Button>
                  )}
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Summary Card */}
          {currentStep !== "basic" && (
            <Card className="mt-6">
              <CardHeader>
                <CardTitle className="text-lg">Summary</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                  <div>
                    <span className="font-medium">Name:</span>
                    <span className="ml-2">{formData.name || "Not set"}</span>
                  </div>
                  <div>
                    <span className="font-medium">Department:</span>
                    <span className="ml-2">{formData.department || "Not set"}</span>
                  </div>
                  <div>
                    <span className="font-medium">Position:</span>
                    <span className="ml-2">{formData.position || "Not set"}</span>
                  </div>
                  <div>
                    <span className="font-medium">Email:</span>
                    <span className="ml-2">{formData.email || "Not set"}</span>
                  </div>
                  <div>
                    <span className="font-medium">Hire Date:</span>
                    <span className="ml-2">{formData.hireDate || "Not set"}</span>
                  </div>
                  <div>
                    <span className="font-medium">Skills:</span>
                    <span className="ml-2">{formData.skills.length} selected</span>
                  </div>
                </div>
              </CardContent>
            </Card>
          )}
        </div>
      </div>

      {success && (
        <div className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-40 z-50">
          <div className="bg-white rounded-lg shadow-lg p-8 text-center">
            <h2 className="text-2xl font-bold mb-2 text-green-600">Staff Created Successfully!</h2>
            <p className="mb-4">Redirecting to staff list...</p>
          </div>
        </div>
      )}
    </div>
  )
}