import { NextRequest, NextResponse } from 'next/server'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export async function POST(req: NextRequest) {
  try {
    const body = await req.json()

    const { name, email, subject, message, order_id, screenshot_url } = body

    // Basic validation
    if (!name || !email || !subject || !message) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      )
    }

    const record = await prisma.supportrequest.create({  
      data: {
        name,
        email,
        subject,
        message,
        order_id,
        screenshot_url,
      },
    })

    // Simulate email confirmation or logging here
    console.log(`Created support ticket ID: ${record.id}`)

return NextResponse.json(
  {
    message: 'Support request submitted',
    record: {
      ...record,
      id: record.id.toString(), // Convert BigInt to string
    },
  },
  { status: 201 }
)
  } catch (err) {
    console.error('[SupportRequestError]', err)
    return NextResponse.json(
      { error: 'Failed to create support request' },
      { status: 500 }
    )
  }
}