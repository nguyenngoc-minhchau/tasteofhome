// File: app/api/auth/validate-session/route.ts
import { NextResponse } from 'next/server';
import { validateSessionToken } from '@/src/server/utils/validate'; // Import the core function

export async function POST(req: Request) {
  const { token } = await req.json();
  const result = validateSessionToken(token);

  if (result.success) {
    return NextResponse.json({ message: 'Session is valid.', user: result.user }, { status: 200 });
  } else {
    return NextResponse.json({ message: result.error }, { status: 401 });
  }
}
