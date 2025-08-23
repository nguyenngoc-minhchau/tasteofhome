import { NextRequest } from 'next/server'
import { handleLogin } from '@/src/server/routes/login'

export async function POST(req: NextRequest) {
  return await handleLogin(req)
}
