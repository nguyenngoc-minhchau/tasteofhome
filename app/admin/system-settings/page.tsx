"use client"

import { useEffect, useState } from "react"
import Link from "next/link"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Label } from "@/components/ui/label"
import { Switch } from "@/components/ui/switch"

type SettingType = "text" | "number" | "boolean"

interface Setting {
  id: string
  label: string
  description?: string
  type: SettingType
  value: string | number | boolean
}

export default function SystemSettingsPage() {
  const [settings, setSettings] = useState<Setting[]>([])
  const [loading, setLoading] = useState(true)
  const [showSuccess, setShowSuccess] = useState(false)

  // For adding a new setting
  const [newLabel, setNewLabel] = useState("")
  const [newType, setNewType] = useState<SettingType>("text")
  const [newValue, setNewValue] = useState("")

  // Load settings from backend
  useEffect(() => {
    fetch("/api/settings")
      .then((res) => res.json())
      .then((data: Setting[]) => {
        setSettings(data)
        setLoading(false)
      })
      .catch((err) => {
        console.error("Failed to load settings:", err)
        setLoading(false)
      })
  }, [])

  const handleChange = (id: string, value: any) => {
    setSettings((prev) =>
      prev.map((setting) =>
        setting.id === id ? { ...setting, value } : setting
      )
    )
  }

  const handleSave = async () => {
    try {
      const response = await fetch("/api/settings", {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(
          settings.map((s) => ({ id: s.id, value: s.value }))
        ),
      })

      if (!response.ok) throw new Error("Failed to save settings")

      setShowSuccess(true)
      setTimeout(() => setShowSuccess(false), 3000)
    } catch (err) {
      console.error("Save failed:", err)
      alert("Failed to save settings. See console for details.")
    }
  }

  const handleAddSetting = async () => {
    try {
      const response = await fetch("/api/settings", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          label: newLabel,
          type: newType,
          value: newValue,
        }),
      })

      if (!response.ok) throw new Error("Failed to add setting")

      const created = await response.json()
      setSettings((prev) => [...prev, created])

      setNewLabel("")
      setNewType("text")
      setNewValue("")
    } catch (err) {
      console.error("Add failed:", err)
      alert("Failed to add setting. See console for details.")
    }
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

      {/* Add New Setting Form */}
      <Card className="mb-6">
        <CardContent className="p-4 space-y-2">
          <h2 className="font-semibold">Add New Setting</h2>
          <Label>Label</Label>
          <Input
            value={newLabel}
            onChange={(e) => setNewLabel(e.target.value)}
          />
          <Label>Type</Label>
          <select
            className="border rounded px-2 py-1"
            value={newType}
            onChange={(e) => setNewType(e.target.value as SettingType)}
          >
            <option value="text">Text</option>
            <option value="number">Number</option>
            <option value="boolean">Boolean</option>
          </select>
          <Label>Value</Label>
          {newType === "boolean" ? (
            <Switch
              checked={newValue === "true"}
              onCheckedChange={(val) => setNewValue(val.toString())}
            />
          ) : (
            <Input
              value={newValue}
              onChange={(e) => setNewValue(e.target.value)}
              type={newType === "number" ? "number" : "text"}
            />
          )}
          <Button onClick={handleAddSetting}>Add Setting</Button>
        </CardContent>
      </Card>

      {loading ? (
        <p className="text-muted-foreground">Loading settings...</p>
      ) : (
        <form
          onSubmit={(e) => {
            e.preventDefault()
            handleSave()
          }}
          className="space-y-6"
        >
          {settings.map((setting) => (
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
                {setting.type === "text" && (
                  <Input
                    id={setting.id}
                    value={setting.value as string}
                    onChange={(e) =>
                      handleChange(setting.id, e.target.value)
                    }
                  />
                )}
                {setting.type === "number" && (
                  <Input
                    id={setting.id}
                    type="number"
                    value={setting.value as number}
                    onChange={(e) =>
                      handleChange(setting.id, Number(e.target.value))
                    }
                  />
                )}
                {setting.type === "boolean" && (
                  <div className="pt-1">
                    <Switch
                      id={setting.id}
                      checked={setting.value as boolean}
                      onCheckedChange={(val) =>
                        handleChange(setting.id, val)
                      }
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
      )}
    </div>
  )
}
