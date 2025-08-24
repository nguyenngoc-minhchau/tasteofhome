"use client"

import { useState, useEffect } from "react"
import { useRouter } from "next/navigation"
import { useAuth } from "@/hooks/use-auth"
import Link from "next/link"
import { ArrowLeft, Ticket, Search, CheckCircle, Clock, XCircle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { toast } from "sonner"


// Mock data cho cac ticket ho tro
const mockTickets = [
  {
    id: "TICKET-001",
    subject: "Order #12345 has not arrived",
    customer: "John Doe",
    status: "open",
    priority: "high",
    date: "2025-08-01",
    assignedTo: null,
  },
  {
    id: "TICKET-002",
    subject: "Problem with product quality",
    customer: "Jane Smith",
    status: "in-progress",
    priority: "medium",
    date: "2025-07-28",
    assignedTo: "Alice Johnson",
  },
  {
    id: "TICKET-003",
    subject: "Refund request for item #67890",
    customer: "Bob Williams",
    status: "closed",
    priority: "low",
    date: "2025-07-25",
    assignedTo: "Mike Chen",
  },
];

const statusColors = {
  open: "bg-red-500",
  "in-progress": "bg-blue-500",
  closed: "bg-green-500",
};

export default function ManagerSupportPage() {
  const { user, loading, isLoggedIn } = useAuth();
  const router = useRouter();

  const [tickets, setTickets] = useState(mockTickets);
  const [searchQuery, setSearchQuery] = useState("");
  const [filterStatus, setFilterStatus] = useState("all");

  // Kiem tra quyen truy cap
  useEffect(() => {
    if (!loading && (!isLoggedIn || (user?.role !== 'manager' && user?.role !== 'staff' && user?.role !== 'admin'))) {
      router.push('/');
    }
  }, [user, loading, isLoggedIn, router]);

  const filteredTickets = tickets.filter(ticket => {
    const matchesSearch =
      ticket.id.toLowerCase().includes(searchQuery.toLowerCase()) ||
      ticket.subject.toLowerCase().includes(searchQuery.toLowerCase()) ||
      ticket.customer.toLowerCase().includes(searchQuery.toLowerCase());

    const matchesStatus = filterStatus === "all" || ticket.status === filterStatus;

    return matchesSearch && matchesStatus;
  });
  
  // Ham xu ly thay doi trang thai ticket (mock)
  const handleChangeStatus = (ticketId: string, newStatus: string) => {
    setTickets(prevTickets =>
      prevTickets.map(ticket =>
        ticket.id === ticketId ? { ...ticket, status: newStatus } : ticket
      )
    );
    toast.success(`Ticket ${ticketId} updated to ${newStatus}.`);
  };

  if (loading || !isLoggedIn || (user?.role !== 'manager' && user?.role !== 'staff' && user?.role !== 'admin')) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <p>Loading or redirecting...</p>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background container mx-auto px-4 py-8">
      <header className="flex items-center justify-between border-b pb-4 mb-8">
        <Link href={`/${user?.role}/dashboard`} className="flex items-center gap-2 text-lg font-semibold hover:text-primary">
          <ArrowLeft className="h-5 w-5" />
          Back to Dashboard
        </Link>
        <h1 className="text-3xl font-bold flex items-center gap-2">
          <Ticket className="h-7 w-7" />
          Support Tickets
        </h1>
      </header>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>All Support Tickets</CardTitle>
            <div className="flex gap-4">
              <Input
                placeholder="Search by ID, subject, or customer..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-64"
              />
              <Select value={filterStatus} onValueChange={setFilterStatus}>
                <SelectTrigger className="w-40">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Statuses</SelectItem>
                  <SelectItem value="open">Open</SelectItem>
                  <SelectItem value="in-progress">In Progress</SelectItem>
                  <SelectItem value="closed">Closed</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {filteredTickets.length === 0 ? (
              <div className="text-center py-8 text-muted-foreground">No tickets found.</div>
            ) : (
              filteredTickets.map(ticket => (
                <Card key={ticket.id} className="hover:shadow-md transition-shadow">
                  <CardContent className="p-6 flex items-center justify-between">
                    <div className="flex-1 space-y-1">
                      <div className="flex items-center gap-2">
                        <span className="font-semibold">{ticket.id}</span>
                        <Badge className={statusColors[ticket.status as keyof typeof statusColors]}>
                          {ticket.status.charAt(0).toUpperCase() + ticket.status.slice(1)}
                        </Badge>
                        <Badge variant="outline" className={`border-2 ${ticket.priority === 'high' ? 'border-red-500' : 'border-blue-500'}`}>
                          {ticket.priority.charAt(0).toUpperCase() + ticket.priority.slice(1)}
                        </Badge>
                      </div>
                      <p className="font-medium text-lg mt-2">{ticket.subject}</p>
                      <p className="text-sm text-muted-foreground">
                        Customer: {ticket.customer} | Date: {new Date(ticket.date).toLocaleDateString()}
                      </p>
                      {ticket.assignedTo && (
                        <p className="text-sm text-muted-foreground">Assigned to: {ticket.assignedTo}</p>
                      )}
                    </div>
                    <div>
                      <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                          <Button variant="outline">
                            Actions
                          </Button>
                        </DropdownMenuTrigger>
                        <DropdownMenuContent align="end">
                          <DropdownMenuItem onClick={() => handleChangeStatus(ticket.id, 'in-progress')}>
                            <Clock className="h-4 w-4 mr-2" /> Mark In-Progress
                          </DropdownMenuItem>
                          <DropdownMenuItem onClick={() => handleChangeStatus(ticket.id, 'closed')}>
                            <CheckCircle className="h-4 w-4 mr-2" /> Mark Closed
                          </DropdownMenuItem>
                          <DropdownMenuItem>
                            <XCircle className="h-4 w-4 mr-2" /> Assign to Staff
                          </DropdownMenuItem>
                        </DropdownMenuContent>
                      </DropdownMenu>
                    </div>
                  </CardContent>
                </Card>
              ))
            )}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}