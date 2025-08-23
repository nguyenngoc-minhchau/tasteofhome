import { NextResponse } from 'next/server';
import { validatePasswordResetToken } from '@/src/server/utils/validateToken';

export async function POST(req: Request) {
  try {
    const { email, token } = await req.json();
    const result = await validatePasswordResetToken(email, token);

    if (result.success) {
      return NextResponse.json({ message: 'Token is valid.', tokenRecord: result.tokenRecord }, { status: 200 });
    } else {
      // For a 404 response on invalid tokens, check the message
      const status = result.message === 'Invalid token.' ? 404 : 400;
      return NextResponse.json({ message: result.message }, { status });
    }

  } catch (error) {
    console.error('Token validation API error:', error);
    return NextResponse.json({ message: 'An unexpected error occurred.' }, { status: 500 });
  }
}
