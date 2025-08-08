import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// GET /api/users → fetch all users with their current role
export async function GET() {
  try {
    const users = await prisma.user.findMany({
      select: {
        id: true,
        name: true,
        roleId: true,
        role: {
          select: {
            id: true,
            name: true,
          },
        },
      },
    });

    const formatted = users.map((u) => ({
      id: u.id,
      name: u.name,
      roleId: u.roleId,
      roleName: u.role ? u.role.name : null,
    }));

    return NextResponse.json(formatted, { status: 200 });
  } catch (error) {
    console.error("Error fetching users:", error);
    return NextResponse.json({ error: "Failed to fetch users" }, { status: 500 });
  }
}

// PUT /api/users → assign a role to a user
export async function PUT(req: Request) {
  try {
    const { userId, roleId } = await req.json();

    if (!userId || !roleId) {
      return NextResponse.json({ error: "Missing userId or roleId" }, { status: 400 });
    }

    const updatedUser = await prisma.user.update({
      where: { id: Number(userId) },
      data: { roleId: Number(roleId) },
    });

    return NextResponse.json(updatedUser, { status: 200 });
  } catch (error) {
    console.error("Error updating user role:", error);
    return NextResponse.json({ error: "Failed to update user role" }, { status: 500 });
  }
}