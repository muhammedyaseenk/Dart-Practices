import { Navbar } from "@/components/Navbar";
import { Hero } from "@/components/Hero";
import { PropertyCard } from "@/components/PropertyCard";
import { Footer } from "@/components/Footer";
import { Button } from "@/components/ui/button";
import property1 from "@/assets/property-1.jpg";
import property2 from "@/assets/property-2.jpg";
import property3 from "@/assets/property-3.jpg";

const Index = () => {
  const featuredProperties = [
    {
      id: 1,
      image: property1,
      title: "Modern Villa with Garden",
      location: "Chakkaraparambu, Munnuperiya Road",
      price: "₹85 Lakhs",
      beds: 4,
      baths: 3,
      area: "2,400 sq ft",
      type: "Sale" as const,
    },
    {
      id: 2,
      image: property2,
      title: "Luxury Apartment",
      location: "City Center Location",
      price: "₹12,000/month",
      beds: 3,
      baths: 2,
      area: "1,800 sq ft",
      type: "Rent" as const,
    },
    {
      id: 3,
      image: property3,
      title: "13 Cent Premium Land",
      location: "Chakkaraparambu - Munnuperiya Road",
      price: "₹42 Lakhs",
      area: "13 Cents",
      type: "Sale" as const,
    },
  ];

  return (
    <div className="min-h-screen bg-background">
      <Navbar />
      <Hero />
      
      {/* Featured Properties Section */}
      <section id="properties" className="py-24 bg-gradient-to-b from-background via-muted/20 to-background">
        <div className="container mx-auto px-4">
          <div className="text-center mb-16 animate-in fade-in duration-500">
            <span className="inline-block px-4 py-2 rounded-full bg-primary/10 text-primary font-semibold text-sm mb-4">
              Featured Listings
            </span>
            <h2 className="text-4xl md:text-5xl font-bold mb-6 bg-gradient-to-r from-primary to-secondary bg-clip-text text-transparent">
              Featured Properties
            </h2>
            <p className="text-xl text-muted-foreground max-w-2xl mx-auto leading-relaxed">
              Discover our handpicked selection of premium properties available for sale and rent
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            {featuredProperties.map((property, index) => (
              <div 
                key={index} 
                className="animate-in fade-in slide-in-from-bottom-4 duration-700"
                style={{ animationDelay: `${index * 100}ms` }}
              >
                <PropertyCard {...property} />
              </div>
            ))}
          </div>

          <div className="text-center animate-in fade-in duration-700 delay-300">
            <Button variant="default" size="lg" className="shadow-lg hover:shadow-xl transition-all hover:scale-105">
              View All Properties
            </Button>
          </div>
        </div>
      </section>

      {/* About Section */}
      <section id="about" className="py-24 relative overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-br from-primary/5 via-transparent to-secondary/5" />
        <div className="container mx-auto px-4 relative">
          <div className="max-w-4xl mx-auto text-center">
            <span className="inline-block px-4 py-2 rounded-full bg-secondary/10 text-secondary font-semibold text-sm mb-4">
              Why Choose Us
            </span>
            <h2 className="text-4xl md:text-5xl font-bold mb-6">About Asseton</h2>
            <p className="text-lg md:text-xl text-muted-foreground mb-8 leading-relaxed">
              We are your trusted real estate partner, dedicated to helping you find the perfect property. 
              With years of experience in the local market and a commitment to excellence, we provide 
              professional service and expert guidance throughout your property journey.
            </p>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mt-16">
              <div className="group p-8 rounded-xl bg-card border-2 border-border hover:border-primary transition-all duration-300 hover:shadow-xl hover:-translate-y-2">
                <div className="text-5xl font-bold text-primary mb-3 group-hover:scale-110 transition-transform">500+</div>
                <p className="text-muted-foreground font-medium">Properties Listed</p>
              </div>
              <div className="group p-8 rounded-xl bg-card border-2 border-border hover:border-secondary transition-all duration-300 hover:shadow-xl hover:-translate-y-2">
                <div className="text-5xl font-bold text-secondary mb-3 group-hover:scale-110 transition-transform">300+</div>
                <p className="text-muted-foreground font-medium">Happy Clients</p>
              </div>
              <div className="group p-8 rounded-xl bg-card border-2 border-border hover:border-primary transition-all duration-300 hover:shadow-xl hover:-translate-y-2">
                <div className="text-5xl font-bold text-primary mb-3 group-hover:scale-110 transition-transform">10+</div>
                <p className="text-muted-foreground font-medium">Years Experience</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Contact CTA Section */}
      <section id="contact" className="py-24 bg-gradient-to-br from-primary via-primary to-primary/90 text-primary-foreground relative overflow-hidden">
        <div className="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNjAiIGhlaWdodD0iNjAiIHZpZXdCb3g9IjAgMCA2MCA2MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPjxnIGZpbGw9IiNmZmZmZmYiIGZpbGwtb3BhY2l0eT0iMC4wNSI+PHBhdGggZD0iTTM2IDE2YzAtNi42MjcgNS4zNzMtMTIgMTItMTJzMTIgNS4zNzMgMTIgMTItNS4zNzMgMTItMTIgMTItMTItNS4zNzMtMTItMTJ6bS0yNCAwYzAtNi42MjcgNS4zNzMtMTIgMTItMTJzMTIgNS4zNzMgMTIgMTItNS4zNzMgMTItMTIgMTItMTItNS4zNzMtMTItMTJ6Ii8+PC9nPjwvZz48L3N2Zz4=')] opacity-30" />
        <div className="container mx-auto px-4 text-center relative">
          <div className="max-w-3xl mx-auto">
            <div className="inline-block mb-6 animate-in fade-in duration-500">
              <span className="px-5 py-2 rounded-full bg-white/10 backdrop-blur-sm text-white font-semibold text-sm border border-white/20">
                Get In Touch
              </span>
            </div>
            <h2 className="text-4xl md:text-5xl font-bold mb-6 animate-in fade-in slide-in-from-bottom-4 duration-700">
              Ready to Find Your Dream Property?
            </h2>
            <p className="text-xl md:text-2xl mb-10 text-white/95 leading-relaxed animate-in fade-in slide-in-from-bottom-4 duration-700 delay-100">
              Contact us today and let our experts help you find the perfect home or investment
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center animate-in fade-in slide-in-from-bottom-4 duration-700 delay-200">
              <a href="tel:9400709646">
                <Button variant="secondary" size="lg" className="w-full sm:w-auto shadow-xl hover:shadow-2xl hover:scale-105 transition-all h-14 px-8 text-base font-semibold">
                  📞 Call: 94007 09646
                </Button>
              </a>
              <Button variant="outline" size="lg" className="w-full sm:w-auto bg-white/10 backdrop-blur-sm text-white border-2 border-white/30 hover:bg-white hover:text-primary transition-all h-14 px-8 text-base font-semibold shadow-xl hover:shadow-2xl hover:scale-105">
                Schedule a Visit
              </Button>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
};

export default Index;
