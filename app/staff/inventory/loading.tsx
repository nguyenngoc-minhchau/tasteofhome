import { Card, CardContent } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"

export default function StaffInventoryLoading() {
  return (
    <div className="min-h-screen bg-background p-6">
      <header className="border-b mb-6 pb-4">
        <div className="flex items-center space-x-4 mb-4">
          <Skeleton className="h-9 w-32" />
        </div>
        <Skeleton className="h-10 w-80 mb-2" />
        <Skeleton className="h-4 w-96" />
      </header>

      {/* Statistics */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        {[1, 2, 3, 4].map((i) => (
          <Card key={i}>
            <CardContent className="p-6">
              <div className="flex items-center space-x-4">
                <Skeleton className="h-14 w-14 rounded-lg" />
                <div className="space-y-2">
                  <Skeleton className="h-4 w-24" />
                  <Skeleton className="h-8 w-16" />
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Filters */}
      <Card className="mb-6">
        <CardContent className="p-6">
          <div className="flex flex-col md:flex-row gap-4">
            <div className="flex-1">
              <Skeleton className="h-10 w-full" />
            </div>
            <div className="flex gap-4">
              <div className="space-y-2">
                <Skeleton className="h-4 w-20" />
                <Skeleton className="h-9 w-32" />
              </div>
              <div className="space-y-2">
                <Skeleton className="h-4 w-16" />
                <Skeleton className="h-9 w-32" />
              </div>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Inventory List */}
      <div className="space-y-4">
        {[1, 2, 3].map((i) => (
          <Card key={i} className="hover:shadow-md transition-shadow">
            <CardContent className="p-6">
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  <div className="flex items-center space-x-3 mb-2">
                    <Skeleton className="h-6 w-32" />
                    <Skeleton className="h-6 w-24" />
                  </div>
                  <Skeleton className="h-5 w-48 mb-1" />
                  <Skeleton className="h-4 w-40 mb-3" />
                  
                  <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
                    {[1, 2, 3, 4].map((j) => (
                      <div key={j}>
                        <Skeleton className="h-4 w-20 mb-1" />
                        <Skeleton className="h-4 w-16" />
                      </div>
                    ))}
                  </div>

                  <div className="mt-3">
                    <div className="flex justify-between text-xs mb-1">
                      <Skeleton className="h-3 w-24" />
                      <Skeleton className="h-3 w-8" />
                    </div>
                    <Skeleton className="h-2 w-full rounded-full" />
                  </div>
                </div>
                
                <div className="flex flex-col space-y-2 ml-4">
                  <Skeleton className="h-9 w-24" />
                  <Skeleton className="h-9 w-28" />
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}
