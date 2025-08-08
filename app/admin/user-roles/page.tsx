"use client";

import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Checkbox } from "@/components/ui/checkbox";
import Link from "next/link";

type Permission = { id: number; name: string };
type Role = { id: number; name: string; permissions: Permission[]; isSystem?: boolean };
type User = { id: number; name: string; roleId: number | null };

const defaultPermissions = [
  "view_products",
  "edit_products",
  "manage_orders",
  "access_reports",
  "manage_roles",
];

export default function UserRoleAssignments() {
  const [roles, setRoles] = useState<Role[]>([]);
  const [users, setUsers] = useState<User[]>([]);
  const [selectedUserId, setSelectedUserId] = useState<number | null>(null);
  const [selectedRoleId, setSelectedRoleId] = useState<number | null>(null);
  const [loading, setLoading] = useState(true);

  // Load roles & users from backend
  useEffect(() => {
    async function loadData() {
      try {
        const [rolesRes, usersRes] = await Promise.all([
          fetch("/api/roles"),
          fetch("/api/users"),
        ]);
        const rolesData = await rolesRes.json();
        const usersData = await usersRes.json();
        setRoles(rolesData);
        setUsers(usersData);
      } catch (err) {
        console.error("Failed to load data:", err);
      } finally {
        setLoading(false);
      }
    }
    loadData();
  }, []);

  // Assign role to a user
  const assignRoleToUser = async () => {
    if (!selectedUserId || !selectedRoleId) return;
    try {
      const res = await fetch("/api/users", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId: selectedUserId, roleId: selectedRoleId }),
      });
      if (!res.ok) throw new Error("Failed to assign role");
      // Update UI without reload
      setUsers((prev) =>
        prev.map((u) => (u.id === selectedUserId ? { ...u, roleId: selectedRoleId } : u))
      );
    } catch (err) {
      console.error(err);
    }
  };

  // Toggle permission for a role
  const togglePermissionForRole = async (roleId: number, permissionId: number) => {
    const role = roles.find((r) => r.id === roleId);
    if (!role || role.isSystem) return;

    let updatedPermissions: number[];
    if (role.permissions.some((p) => p.id === permissionId)) {
      updatedPermissions = role.permissions.filter((p) => p.id !== permissionId).map((p) => p.id);
    } else {
      updatedPermissions = [...role.permissions.map((p) => p.id), permissionId];
    }

    try {
      const res = await fetch("/api/roles", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ roleId, permissionIds: updatedPermissions }),
      });
      if (!res.ok) throw new Error("Failed to update role permissions");
      // Update UI without reload
      setRoles((prev) =>
        prev.map((r) =>
          r.id === roleId
            ? {
                ...r,
                permissions: r.permissions.some((p) => p.id === permissionId)
                  ? r.permissions.filter((p) => p.id !== permissionId)
                  : [...r.permissions, { id: permissionId, name: defaultPermissions.find((p) => p === permissionId.toString()) || "" }],
              }
            : r
        )
      );
    } catch (err) {
      console.error(err);
    }
  };

  if (loading) {
    return <p className="p-6">Loading...</p>;
  }

  return (
    <div className="container mx-auto px-4 py-8 space-y-8">
      <div className="flex justify-between items-center">
        <h1 className="text-2xl font-bold">User Role Assignments</h1>
        <Link href="/">
          <Button variant="outline">← Back to Home</Button>
        </Link>
      </div>

      {/* Assign Role */}
      <Card>
        <CardHeader>
          <CardTitle>Assign Role to User</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium mb-1">User</label>
              <select
                value={selectedUserId ?? ""}
                onChange={(e) => setSelectedUserId(Number(e.target.value))}
                className="w-full border rounded p-2 bg-background text-foreground focus:outline-none focus:ring-2 focus:ring-primary"
              >
                <option value="">-- Select a user --</option>
                {users.map((u) => (
                  <option key={u.id} value={u.id}>
                    {u.name}
                  </option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium mb-1">Role</label>
              <select
                value={selectedRoleId ?? ""}
                onChange={(e) => setSelectedRoleId(Number(e.target.value))}
                className="w-full border rounded p-2 bg-background text-foreground focus:outline-none focus:ring-2 focus:ring-primary"
              >
                <option value="">-- Select a role --</option>
                {roles.map((r) => (
                  <option key={r.id} value={r.id}>
                    {r.name}
                  </option>
                ))}
              </select>
            </div>
          </div>
          <Button onClick={assignRoleToUser}>Assign Role</Button>
        </CardContent>
      </Card>

      {/* Current Assignments */}
      <Card>
        <CardHeader>
          <CardTitle>Current User Assignments</CardTitle>
        </CardHeader>
        <CardContent className="space-y-2 text-sm text-muted-foreground">
          <ul className="list-disc ml-6 space-y-1">
            {users.map((user) => {
              const role = roles.find((r) => r.id === user.roleId);
              return (
                <li key={user.id}>
                  {user.name} — {role ? role.name : "No role assigned"}
                </li>
              );
            })}
          </ul>
        </CardContent>
      </Card>

      {/* Edit Permissions */}
      <Card>
        <CardHeader>
          <CardTitle>Edit Role Permissions (Custom Roles Only)</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {roles.filter((r) => !r.isSystem).map((role) => (
            <div key={role.id} className="border rounded p-4 space-y-2">
              <h3 className="font-semibold">{role.name}</h3>
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-2">
                {role.permissions.map((perm) => (
                  <label key={perm.id} className="flex items-center gap-2">
                    <Checkbox
                      checked={role.permissions.some((p) => p.id === perm.id)}
                      onCheckedChange={() => togglePermissionForRole(role.id, perm.id)}
                    />
                    <span className="text-sm capitalize">{perm.name.replaceAll("_", " ")}</span>
                  </label>
                ))}
              </div>
            </div>
          ))}
        </CardContent>
      </Card>
    </div>
  );
}