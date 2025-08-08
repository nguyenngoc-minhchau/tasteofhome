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
  const audits = await prisma.system_setting_audit.findMany({
    where: { setting_id: id },
    orderBy: { changed_at: 'desc' },
  });

  return new Response(JSON.stringify(audits), { status: 200 });
}
