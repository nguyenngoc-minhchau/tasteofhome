import { prisma } from '@/src/server/lib/prisma';

// Token is valid for 15 minutes
const TOKEN_EXPIRY_MINUTES = 15;

export async function validatePasswordResetToken(email: string, token: string) {
  // Check for missing email or token
  if (!email || !token) {
    return { success: false, message: 'Missing email or token.' };
  }

  // Find the token record in the database
  const tokenRecord = await prisma.password_reset_tokens.findFirst({
    where: {
      email,
      token,
    },
  });

  // If no token record is found, it's an invalid token
  if (!tokenRecord) {
    return { success: false, message: 'Invalid token.' };
  }

  // Check if the token has expired
  const now = new Date();
  const tokenCreatedAt = new Date(tokenRecord.created_at);
  const expiryTime = new Date(tokenCreatedAt.getTime() + TOKEN_EXPIRY_MINUTES * 60 * 1000);

  if (now > expiryTime) {
    // The token has expired
    // You might want to delete the expired token from the database here
    return { success: false, message: 'Token has expired.' };
  }

  // Token is valid
  return { success: true, tokenRecord };
}
