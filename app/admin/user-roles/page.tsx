"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Checkbox } from "@/components/ui/checkbox";
import Link from "next/link";

type Role = {
  id: number;
  name: string;
  permissions: string[];
  isSystem?: boolean;
};

type User = {
  id: number;
  name: string;
  roleId: number | null;
};

const defaultPermissions = [
  "view_products",
  "edit_products",
  "manage_orders",
  "access_reports",
  "manage_roles",
];

// 🟡 This mock data simulates shared roles (can be replaced with import or API)
const initialRoles: Role[] = [
  { id: 1, name: "Admin", permissions: defaultPermissions, isSystem: true },
  { id: 2, name: "Manager", permissions: ["view_products", "manage_orders"] },
  { id: 3, name: "Viewer", permissions: ["view_products"] },
];

// 🧍 Initial mock users
const initialUsers: User[] = [
  { id: 1, name: "Alice", roleId: 2 },
  { id: 2, name: "Bob", roleId: 3 },
  { id: 3, name: "Charlie", roleId: null },
];

export default function UserRoleAssignments() {
  const [roles, setRoles] = useState<Role[]>(initialRoles);
  const [users, setUsers] = useState<User[]>(initialUsers);

  const [selectedUserId, setSelectedUserId] = useState<number | null>(null);
  const [selectedRoleId, setSelectedRoleId] = useState<number | null>(null);

  const assignRoleToUser = () => {
    if (selectedUserId == null || selectedRoleId == null) return;
    setUsers((prev) =>
      prev.map((user) =>
        user.id === selectedUserId ? { ...user, roleId: selectedRoleId } : user
      )
    );
  };

  const togglePermissionForRole = (roleId: number, permission: string) => {
    setRoles((prev) =>
      prev.map((role) => {
        if (role.id !== roleId || role.isSystem) return role;
        const has = role.permissions.includes(permission);
        const updated = has
          ? role.permissions.filter((p) => p !== permission)
          : [...role.permissions, permission];
        return { ...role, permissions: updated };
      })
    );
  };

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

      {/* Optional: Edit Permissions for Custom Roles */}
      <Card>
        <CardHeader>
          <CardTitle>Edit Role Permissions (Custom Roles Only)</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {roles.filter((r) => !r.isSystem).map((role) => (
            <div key={role.id} className="border rounded p-4 space-y-2">
              <h3 className="font-semibold">{role.name}</h3>
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-2">
                {defaultPermissions.map((perm) => (
                  <label key={perm} className="flex items-center gap-2">
                    <Checkbox
                      checked={role.permissions.includes(perm)}
                      onCheckedChange={() => togglePermissionForRole(role.id, perm)}
                    />
                    <span className="text-sm capitalize">{perm.replaceAll("_", " ")}</span>
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
