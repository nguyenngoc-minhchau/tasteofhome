import { PrismaAdapter } from '@next-auth/prisma-adapter'
import CredentialsProvider from 'next-auth/providers/credentials'
import { prisma } from '@/src/server/lib/prisma'
import bcrypt from 'bcrypt'
import { SessionStrategy } from 'next-auth'
import { AdapterUser } from 'next-auth/adapters'

export const authOptions = {
  adapter: PrismaAdapter(prisma),
  providers: [
    CredentialsProvider({
      name: 'Credentials',
      credentials: {
        email: { label: 'Email', type: 'text' },
        password: { label: 'Password', type: 'password' },
      },
      async authorize(credentials) {
        if (!credentials?.email || !credentials?.password) return null

        // Find the user by email
        const user = await prisma.users.findFirst({
          where: { email: credentials.email },
        })

        if (!user || !user.password) return null
        const isValid = await bcrypt.compare(credentials.password, user.password)
        if (!isValid) return null

        // Get the user's role directly from the 'role' column.
        // Default to 'customer' if the role is not defined.
        const userRole = user.role ?? 'customer'

        return {
          id: user.id.toString(),
          email: user.email,
          role: userRole,
          emailVerified: user.email_verified_at,
        } as AdapterUser
      },
    }),
  ],
  session: {
    strategy: 'jwt' as SessionStrategy,
  },
  callbacks: {
    async jwt({ token, user }) {
      if (user) {
        token.id = user.id
        token.role = (user as AdapterUser).role
      }
      return token
    },
    async session({ session, token }) {
      if (token) {
        session.user.id = token.id as string
        session.user.role = token.role as string
      }
      return session
    },
  },
  secret: process.env.NEXTAUTH_SECRET,
}
