import { prisma } from '@/src/server/lib/prisma';
import { NextResponse } from 'next/server';
import { hashPassword } from '@/src/server/utils/hash';

export async function getAllUsers() {
  try {
    const users = await prisma.users.findMany();
    return NextResponse.json(users);
  } catch (error) {
    console.error('Fetch users error:', error);
    return NextResponse.json({ error: 'Failed to fetch users.' }, { status: 500 });
  }
}

export async function createUser(req: Request) {
  const {
    name,
    username,
    email,
    password,
    image,
    phone,
    address,
    email_verified_at,
    remember_token,
  } = await req.json();

  // Ensure all required fields are provided
  if (!name || !username || !email || !password) {
    return NextResponse.json({ error: 'Missing required fields: name, username, email, password.' }, { status: 400 });
  }

  try {

    const existingUser = await prisma.users.findFirst({
      where: { email },
    });

    if (existingUser) {
      return NextResponse.json({error: 'User with this email already exists.'}, { status: 409 });
    }

    const hashedPassword = await hashPassword(password);

    const newUser = await prisma.users.create({
      data: {
        name,
        username,
        email,
        password: hashedPassword,
        image: image ?? null, // If image is not provided, assign null
        phone: phone ?? null, // If phone is not provided, assign null
        address: address ?? null, // If address is not provided, assign null
        isadmin: 0, // Default to not being an admin
        role: 'customer', // Assign 'customer' role directly
        email_verified_at: email_verified_at ?? null,
        remember_token: remember_token ?? null,
        created_at: new Date(),
        updated_at: new Date(),
      },
    });

    return NextResponse.json(newUser, { status: 201 });
  } catch (error) {
    console.error('Create user error:', error);
    // Handle unique constraint error for email/username
    if (error.code === 'P2002') { 
      return NextResponse.json({ error: 'User with this email or username already exists.' }, { status: 409 });
    }
    return NextResponse.json({ error: 'Failed to create user.' }, { status: 500 });
  }
}
