import { getAllUsers, createUser } from '@/src/server/routes/user'

export async function GET() {
  return await getAllUsers()
}

export async function POST(req: Request) {
  return await createUser(req)
}
