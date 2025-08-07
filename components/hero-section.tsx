import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Search, MapPin } from "lucide-react"
import Link from "next/link"

export function HeroSection() {
  return (
    <section className="relative bg-gradient-to-r from-amber-600 to-orange-700 text-white">
      <div className="container mx-auto px-4 py-24">
        <div className="max-w-4xl">
          <h1 className="text-4xl md:text-6xl font-bold mb-6">Discover Authentic Flavors from Around the World</h1>
          <p className="text-xl mb-8 opacity-90">
            From Italian truffles to Japanese wagyu, explore specialty foods crafted by local artisans and shipped
            directly to your door. Taste the world's finest regional delicacies.
          </p>

          <div className="bg-white rounded-lg p-4 flex flex-col sm:flex-row gap-4 text-black max-w-2xl">
            <div className="flex items-center flex-1 border rounded-md px-3">
              <MapPin className="h-5 w-5 text-gray-400 mr-2" />
              <Input placeholder="Search by region or country" className="border-0 focus-visible:ring-0 p-0" />
            </div>
            <div className="flex items-center flex-1 border rounded-md px-3">
              <Search className="h-5 w-5 text-gray-400 mr-2" />
              <Input placeholder="Search specialty foods" className="border-0 focus-visible:ring-0 p-0" />
            </div>
            <Button size="lg" className="bg-amber-600 hover:bg-amber-700">
              Explore
            </Button>
          </div>

          <div className="flex flex-col sm:flex-row gap-4 mt-6">
            <Link href="/regions">
              <Button
                size="lg"
                variant="outline"
                className="border-white text-white hover:bg-white hover:text-amber-600 bg-transparent"
              >
                Browse by Region
              </Button>
            </Link>
            <Link href="/artisans">
              <Button
                size="lg"
                variant="outline"
                className="border-white text-white hover:bg-white hover:text-amber-600 bg-transparent"
              >
                Meet Our Artisans
              </Button>
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
