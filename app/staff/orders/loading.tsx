import { Card, CardContent, CardHeader } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"

export default function StaffOrdersLoading() {
  return (
    <div className="min-h-screen bg-background p-6">
      <header className="border-b mb-6 pb-4">
        <Skeleton className="h-10 w-80 mb-2" />
        <Skeleton className="h-4 w-96" />
      </header>

      <div className="space-y-6">
        {[1, 2, 3].map((i) => (
          <Card key={i} className="overflow-hidden">
            <CardHeader className="bg-muted/50">
              <div className="flex items-center justify-between">
                <div className="space-y-2">
                  <Skeleton className="h-6 w-48" />
                  <Skeleton className="h-4 w-64" />
                </div>
                <div className="text-right space-y-2">
                  <Skeleton className="h-6 w-24 ml-auto" />
                  <Skeleton className="h-6 w-20 ml-auto" />
                </div>
              </div>
            </CardHeader>
            <CardContent className="p-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-3">
                  <Skeleton className="h-5 w-32" />
                  <div className="space-y-2">
                    {[1, 2].map((j) => (
                      <div key={j} className="flex items-center justify-between">
                        <Skeleton className="h-4 w-40" />
                        <Skeleton className="h-4 w-20" />
                      </div>
                    ))}
                  </div>
                </div>
                <div className="space-y-3">
                  <Skeleton className="h-5 w-32" />
                  <div className="space-y-2">
                    <div className="flex justify-between">
                      <Skeleton className="h-4 w-24" />
                      <Skeleton className="h-4 w-32" />
                    </div>
                    <div className="flex justify-between">
                      <Skeleton className="h-4 w-20" />
                      <Skeleton className="h-4 w-24" />
                    </div>
                  </div>
                  <div className="pt-2">
                    <Skeleton className="h-9 w-32" />
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}

