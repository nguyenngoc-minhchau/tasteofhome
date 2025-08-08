import { PrismaClient } from '@prisma/client';
import { NextResponse } from 'next/server';

const prisma = new PrismaClient();

// GET: list all roles and permissions
export async function GET() {
  const roles = await prisma.role.findMany({
    include: { permissions: true }
  });
  return NextResponse.json(roles);
}

// POST: create a new role
export async function POST(req: Request) {
  const { name, description } = await req.json();
  const role = await prisma.role.create({
    data: { name, description }
  });
  return NextResponse.json(role);
}

// PUT: update a role's permissions
export async function PUT(req: Request) {
  const { roleId, permissionIds } = await req.json();

  // Disconnect old permissions and connect new ones
  await prisma.role.update({
    where: { id: roleId },
    data: {
      permissions: {
        set: [], // remove all
        connect: permissionIds.map((id: number) => ({ id }))
      }
    }
  });

  return NextResponse.json({ message: 'Role permissions updated' });
}
