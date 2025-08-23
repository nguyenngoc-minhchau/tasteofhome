import { handleRegister } from '@/src/server/routes/register'

export async function POST(req: Request) {
  return await handleRegister(req)
}
