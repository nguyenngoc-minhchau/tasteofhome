'use client'

import { useState } from 'react'
import Link from 'next/link'
import { Input } from '@/components/ui/input'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Label } from '@/components/ui/label'
import { Switch } from '@/components/ui/switch'

type SettingType = 'text' | 'number' | 'boolean'

interface Setting {
  id: string
  label: string
  description?: string
  type: SettingType
  value: string | number | boolean
}

const initialSettings: Setting[] = [
  {
    id: 'siteTitle',
    label: 'Site Title',
    description: 'The name of your shop shown in browser tab',
    type: 'text',
    value: 'Taste of Home',
  },
  {
    id: 'timezone',
    label: 'Timezone',
    description: 'System-wide timezone setting',
    type: 'text',
    value: 'UTC',
  },
  {
    id: 'sessionTimeout',
    label: 'Session Timeout (minutes)',
    description: 'Auto logout after inactivity',
    type: 'number',
    value: 30,
  },
  {
    id: 'maintenanceMode',
    label: 'Maintenance Mode',
    description: 'Disable site for visitors during maintenance',
    type: 'boolean',
    value: false,
  },
]

export default function SystemSettingsPage() {
  const [settings, setSettings] = useState<Setting[]>(initialSettings)
  const [showSuccess, setShowSuccess] = useState(false)

  const handleChange = (id: string, value: any) => {
    setSettings(prev =>
      prev.map(setting =>
        setting.id === id ? { ...setting, value } : setting
      )
    )
  }

  const handleSave = () => {
    // Simulate async save
    setTimeout(() => {
      setShowSuccess(true)
      setTimeout(() => setShowSuccess(false), 3000)
    }, 500)
  }

  return (
    <div className="max-w-3xl mx-auto p-6">
      <Link href="/">
        <Button variant="outline" className="mb-4">
          ← Back to Home
        </Button>
      </Link>

      <h1 className="text-3xl font-bold mb-6">System Settings</h1>

      {showSuccess && (
        <div className="mb-6 rounded-md border border-green-300 bg-green-100 px-4 py-3 text-green-800 text-sm">
          ✅ Settings saved successfully!
        </div>
      )}

      <form
        onSubmit={e => {
          e.preventDefault()
          handleSave()
        }}
        className="space-y-6"
      >
        {settings.map(setting => (
          <Card key={setting.id}>
            <CardContent className="p-4 space-y-2">
              <Label htmlFor={setting.id} className="font-semibold">
                {setting.label}
              </Label>
              {setting.description && (
                <p className="text-sm text-muted-foreground">
                  {setting.description}
                </p>
              )}
              {setting.type === 'text' && (
                <Input
                  id={setting.id}
                  value={setting.value as string}
                  onChange={e => handleChange(setting.id, e.target.value)}
                />
              )}
              {setting.type === 'number' && (
                <Input
                  id={setting.id}
                  type="number"
                  value={setting.value as number}
                  onChange={e =>
                    handleChange(setting.id, Number(e.target.value))
                  }
                />
              )}
              {setting.type === 'boolean' && (
                <div className="pt-1">
                  <Switch
                    id={setting.id}
                    checked={setting.value as boolean}
                    onCheckedChange={val => handleChange(setting.id, val)}
                  />
                </div>
              )}
            </CardContent>
          </Card>
        ))}

        <Button type="submit" className="mt-4">
          Save Settings
        </Button>
      </form>
    </div>
  )
}
