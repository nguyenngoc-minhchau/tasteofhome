import { PrismaClient } from '@prisma/client'
import { hash } from 'bcryptjs'

const prisma = new PrismaClient()

async function main() {
  console.log('Start seeding')

  const timestamp = Date.now()
  const randomEmail = `demo_admin_${timestamp}@example.com`
  const randomUsername = `admin_demo_${timestamp}`

  const hashedPassword = await hash('password123', 10)

  await prisma.users.create({
    data: {
      name: 'Demo Admin',
      username: randomUsername,
      email: randomEmail,
      password: hashedPassword,
      role: 'admin',
      created_at: new Date(),
      updated_at: new Date()
    }
  })

  console.log('Demo admin created with email ' + randomEmail)
}

main()
  .catch((e) => {
    console.error('Seed failed ' + e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
