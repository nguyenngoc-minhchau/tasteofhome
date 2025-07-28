import { Card, CardContent, CardHeader } from "@/components/ui/card"
import { Skeleton } from "@/components/ui/skeleton"

export default function ReturnSuccessLoading() {
  return (
    <div className="min-h-screen bg-background flex items-center justify-center">
      <div className="container mx-auto px-4 py-8">
        <div className="max-w-2xl mx-auto">
          <Card>
            <CardHeader className="text-center pb-4">
              <div className="mx-auto w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mb-4">
                <Skeleton className="h-8 w-8 rounded-full" />
              </div>
              <Skeleton className="h-8 w-80 mx-auto mb-2" />
              <Skeleton className="h-5 w-64 mx-auto" />
            </CardHeader>
            <CardContent className="space-y-6">
              {/* Return Summary */}
              <div className="bg-gray-50 p-4 rounded-lg space-y-3">
                {Array.from({ length: 5 }).map((_, i) => (
                  <div key={i} className="flex justify-between items-center">
                    <Skeleton className="h-4 w-32" />
                    <Skeleton className="h-4 w-24" />
                  </div>
                ))}
              </div>

              {/* Status Badge */}
              <div className="flex justify-center">
                <Skeleton className="h-8 w-32 rounded-full" />
              </div>

              {/* Next Steps */}
              <div className="space-y-4">
                <Skeleton className="h-6 w-48" />
                <div className="space-y-3">
                  {Array.from({ length: 5 }).map((_, i) => (
                    <div key={i} className="flex items-start gap-3">
                      <Skeleton className="w-6 h-6 rounded-full flex-shrink-0" />
                      <Skeleton className="h-4 w-full" />
                    </div>
                  ))}
                </div>
              </div>

              {/* Information Boxes */}
              <div className="space-y-4">
                <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                  <Skeleton className="h-5 w-48 mb-2" />
                  <div className="space-y-1">
                    {Array.from({ length: 5 }).map((_, i) => (
                      <Skeleton key={i} className="h-4 w-full" />
                    ))}
                  </div>
                </div>

                <div className="bg-green-50 border border-green-200 rounded-lg p-4">
                  <div className="flex items-start gap-3">
                    <Skeleton className="h-5 w-5 rounded-full flex-shrink-0" />
                    <div className="flex-1">
                      <Skeleton className="h-5 w-48 mb-1" />
                      <Skeleton className="h-4 w-full" />
                    </div>
                  </div>
                </div>
              </div>

              {/* Action Buttons */}
              <div className="space-y-3">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <Skeleton className="h-10 w-full" />
                  <Skeleton className="h-10 w-full" />
                </div>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <Skeleton className="h-10 w-full" />
                  <Skeleton className="h-10 w-full" />
                </div>
              </div>

              {/* Support Information */}
              <div className="text-center pt-4 border-t">
                <Skeleton className="h-4 w-48 mx-auto mb-2" />
                <Skeleton className="h-6 w-32 mx-auto" />
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
