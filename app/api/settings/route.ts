import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

type SettingType = 'text' | 'number' | 'boolean';

function requireAdmin(req: Request): { id: number; role: string } | null {
  const role = req.headers.get('x-user-role');
  const userId = req.headers.get('x-user-id');
  if (role !== 'ADMIN' || !userId) return null;
  return { id: Number(userId), role };
}

// GET - fetch settings list
export async function GET(req: Request) {
  //const user = requireAdmin(req);
  //if (!user) {
  //  return new Response(JSON.stringify({ error: 'Forbidden: Admin only' }), { status: 403 });
  //}

  // Fetch all settings
  const settings = await prisma.system_setting.findMany({
    orderBy: { category: 'asc' },
  });

  // Map DB fields to frontend format
  const result = settings.map((s) => ({
    id: s.id.toString(),
    label: s.setting_key.replace(/_/g, ' '), // e.g. site_name → Site Name
    description: s.description || '',
    type: detectType(s.value),
    value: parseValue(s.value, detectType(s.value)),
  }));

  return new Response(JSON.stringify(result), { status: 200 });
}

// PUT - bulk update settings
export async function PUT(req: Request) {
  const user = requireAdmin(req);
  if (!user) {
    return new Response(JSON.stringify({ error: 'Forbidden: Admin only' }), { status: 403 });
  }

  const updates: { id: string; value: any }[] = await req.json();

  if (!Array.isArray(updates)) {
    return new Response(JSON.stringify({ error: 'Invalid payload' }), { status: 400 });
  }

  const updatedSettings = [];

  try {
    await prisma.$transaction(async (tx) => {
      for (const update of updates) {
        const settingId = Number(update.id);
        const current = await tx.system_setting.findUnique({ where: { id: settingId } });
        if (!current) continue;

        // Skip if value hasn't changed
        const newValueStr = String(update.value);
        if (current.value === newValueStr) continue;

        // Audit log
        await tx.system_setting_audit.create({
          data: {
            setting_id: current.id,
            old_value: current.value,
            new_value: newValueStr,
            changed_by: user.id,
          },
        });

        // Update setting
        const updated = await tx.system_setting.update({
          where: { id: settingId },
          data: {
            value: newValueStr,
            updated_by: user.id,
          },
        });

        updatedSettings.push(updated);
      }
    });

    return new Response(
      JSON.stringify({ message: 'Settings updated', updated: updatedSettings.length }),
      { status: 200 }
    );
  } catch (err) {
    console.error('Error updating settings:', err);
    return new Response(JSON.stringify({ error: 'Failed to update settings' }), { status: 500 });
  }
}

// POST - add a new setting
export async function POST(req: Request) {
  // const user = requireAdmin(req);
  // if (!user) return new Response(JSON.stringify({ error: 'Forbidden: Admin only' }), { status: 403 });

  const { setting_key, value, description, category, updated_by } = await req.json();

  if (!setting_key || value === undefined) {
    return new Response(JSON.stringify({ error: 'setting_key and value are required' }), { status: 400 });
  }

  try {
    const newSetting = await prisma.system_setting.create({
      data: {
        setting_key,
        value: String(value),
        description: description || '',
        category: category || 'general',
        updated_by: updated_by || 1,
      },
    });

    return new Response(JSON.stringify(newSetting), { status: 201 });
  } catch (err) {
    console.error('Error creating setting:', err);
    return new Response(JSON.stringify({ error: 'Failed to create setting' }), { status: 500 });
  }
}

// Helpers to detect type & parse value
function detectType(value: string): SettingType {
  if (value === 'true' || value === 'false') return 'boolean';
  if (!isNaN(Number(value)) && value.trim() !== '') return 'number';
  return 'text';
}

function parseValue(value: string, type: SettingType) {
  if (type === 'boolean') return value === 'true';
  if (type === 'number') return Number(value);
  return value;
}