import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Search } from "lucide-react";
import heroImage from "@/assets/hero-property.jpg";

export const Hero = () => {
  return (
    <div className="relative h-[650px] w-full overflow-hidden">
      <div
        className="absolute inset-0 bg-cover bg-center transform scale-105 transition-transform duration-[20s] hover:scale-100"
        style={{ backgroundImage: `url(${heroImage})` }}
      >
        <div className="absolute inset-0 bg-gradient-to-r from-primary/95 via-primary/85 to-primary/70" />
        <div className="absolute inset-0 bg-gradient-to-b from-transparent via-transparent to-background/30" />
      </div>
      <div className="relative container mx-auto px-4 h-full flex items-center">
        <div className="max-w-3xl text-white">
          <div className="inline-block mb-4 animate-in fade-in slide-in-from-bottom-4 duration-500">
            <span className="px-4 py-2 rounded-full bg-secondary/20 backdrop-blur-sm text-secondary font-semibold text-sm border border-secondary/30">
              ✨ Your Trusted Real Estate Partner
            </span>
          </div>
          <h1 className="text-5xl md:text-7xl font-bold mb-6 animate-in fade-in slide-in-from-bottom-4 duration-700 leading-tight">
            Find Your Dream Property
          </h1>
          <p className="text-xl md:text-2xl mb-10 text-white/95 animate-in fade-in slide-in-from-bottom-4 duration-700 delay-100 leading-relaxed">
            Discover the perfect home, land, or investment opportunity with expert guidance
          </p>
          <div className="flex flex-col sm:flex-row gap-4 animate-in fade-in slide-in-from-bottom-4 duration-700 delay-200">
            <div className="flex-1 relative group">
              <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 text-muted-foreground group-hover:text-primary transition-colors" />
              <Input
                placeholder="Search by location, property type..."
                className="pl-12 h-16 text-base bg-white/98 backdrop-blur-md shadow-lg border-2 border-transparent hover:border-primary/20 focus:border-primary transition-all"
              />
            </div>
            <Button variant="hero" size="lg" className="h-16 px-10 bg-secondary hover:bg-secondary/90 shadow-xl hover:shadow-2xl hover:scale-105 transition-all text-base font-semibold">
              Search Properties
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
};
