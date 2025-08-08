import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

function requireAdmin(req: Request): { id: number; role: string } | null {
  const role = req.headers.get('x-user-role');
  const userId = req.headers.get('x-user-id');
  if (role !== 'ADMIN' || !userId) {
    return null;
  }
  return { id: Number(userId), role };
}

export async function GET(req: Request, { params }: { params: { id: string } }) {
  const user = requireAdmin(req);
  if (!user) {
    return new Response(JSON.stringify({ error: 'Forbidden: Admin only' }), { status: 403 });
  }

  const id = Number(params.id);
  const setting = await prisma.system_setting.findUnique({ where: { id } });

  if (!setting) {
    return new Response(JSON.stringify({ error: 'Setting not found' }), { status: 404 });
  }

  return new Response(JSON.stringify(setting), { status: 200 });
}

export async function PUT(req: Request, { params }: { params: { id: string } }) {
  const user = requireAdmin(req);
  if (!user) {
    return new Response(JSON.stringify({ error: 'Forbidden: Admin only' }), { status: 403 });
  }

  const id = Number(params.id);
  const body = await req.json();
  const { value } = body;

  if (value === undefined || value === null) {
    return new Response(JSON.stringify({ error: 'Value is required' }), { status: 400 });
  }

  try {
    const updated = await prisma.$transaction(async (tx) => {
      const existing = await tx.system_setting.findUnique({ where: { id } });
      if (!existing) throw { code: 'NOT_FOUND' };

      await tx.system_setting_audit.create({
        data: {
          setting_id: existing.id,
          old_value: existing.value,
          new_value: String(value),
          changed_by: user.id,
        },
      });

      return await tx.system_setting.update({
        where: { id },
        data: { value: String(value), updated_by: user.id },
      });
    });

    const resp: any = { message: 'Setting updated successfully', setting: updated };
    if (updated.requires_restart) {
      resp.warning = 'This setting requires a system restart to take effect';
    }

    return new Response(JSON.stringify(resp), { status: 200 });
  } catch (err: any) {
    if (err.code === 'NOT_FOUND') {
      return new Response(JSON.stringify({ error: 'Setting not found' }), { status: 404 });
    }
    return new Response(JSON.stringify({ error: 'Error updating setting' }), { status: 500 });
  }
}