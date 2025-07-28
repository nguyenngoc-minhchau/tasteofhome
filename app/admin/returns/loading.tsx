import { Card, CardContent, CardHeader } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"

export default function AdminReturnsLoading() {
  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Skeleton className="h-6 w-32" />
            <Skeleton className="h-8 w-48" />
            <div className="w-24"></div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center justify-between mb-8">
            <div>
              <Skeleton className="h-9 w-64 mb-2" />
              <Skeleton className="h-5 w-80" />
            </div>
            <div className="flex gap-2">
              <Skeleton className="h-10 w-24" />
              <Skeleton className="h-10 w-40" />
            </div>
          </div>

          {/* Search and Filters */}
          <Card className="mb-6">
            <CardContent className="p-4">
              <div className="flex flex-col lg:flex-row gap-4">
                <Skeleton className="h-10 flex-1" />
                <div className="flex gap-2">
                  <Skeleton className="h-10 w-40" />
                  <Skeleton className="h-10 w-40" />
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Tabs */}
          <div className="mb-6">
            <div className="flex space-x-1 mb-6">
              {Array.from({ length: 6 }).map((_, i) => (
                <Skeleton key={i} className="h-10 w-24" />
              ))}
            </div>

            {/* Select All */}
            <div className="flex items-center gap-2 p-4 bg-gray-50 rounded-lg mb-4">
              <Skeleton className="h-4 w-4" />
              <Skeleton className="h-4 w-32" />
            </div>

            {/* Return Cards */}
            <div className="space-y-4">
              {Array.from({ length: 4 }).map((_, i) => (
                <Card key={i}>
                  <CardHeader>
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-3">
                        <Skeleton className="h-4 w-4" />
                        <div>
                          <Skeleton className="h-6 w-48 mb-2" />
                          <Skeleton className="h-4 w-80" />
                        </div>
                      </div>
                      <div className="text-right flex items-center gap-2">
                        <Skeleton className="h-6 w-16" />
                        <Skeleton className="h-6 w-20" />
                        <Skeleton className="h-6 w-16" />
                      </div>
                    </div>
                  </CardHeader>
                  <CardContent>
                    <div className="space-y-4">
                      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                        {Array.from({ length: 3 }).map((_, j) => (
                          <div key={j}>
                            <Skeleton className="h-5 w-20 mb-1" />
                            <Skeleton className="h-4 w-32" />
                            <Skeleton className="h-4 w-40" />
                          </div>
                        ))}
                      </div>
                      <div>
                        <Skeleton className="h-5 w-32 mb-2" />
                        <Skeleton className="h-4 w-full" />
                      </div>
                      <div>
                        <Skeleton className="h-5 w-16 mb-1" />
                        <Skeleton className="h-4 w-full" />
                      </div>
                      <div className="flex gap-2 pt-2">
                        <Skeleton className="h-8 w-24" />
                        <Skeleton className="h-8 w-20" />
                        <Skeleton className="h-8 w-16" />
                        <Skeleton className="h-8 w-32" />
                        <Skeleton className="h-8 w-8" />
                      </div>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
