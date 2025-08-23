import { handleLogout } from '@/src/server/routes/logout'

export async function POST() {
  return await handleLogout()
}
