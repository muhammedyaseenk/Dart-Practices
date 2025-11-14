import { useParams, useNavigate } from "react-router-dom";
import { Phone, MessageCircle, MapPin, Bed, Bath, Maximize, ArrowLeft } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Navbar } from "@/components/Navbar";
import { Footer } from "@/components/Footer";
import { AspectRatio } from "@/components/ui/aspect-ratio";

// Sample properties data (in a real app, this would come from a database)
const properties = [
  {
    id: 1,
    title: "Luxury Villa in Prime Location",
    price: "$850,000",
    location: "Beverly Hills, CA",
    beds: 4,
    baths: 3,
    area: "3,200 sq ft",
    image: "/src/assets/property-1.jpg",
    description: "Stunning luxury villa featuring modern architecture, spacious living areas, and premium finishes throughout. This property offers an exceptional lifestyle with high-end amenities and breathtaking views.",
    features: ["Swimming Pool", "Garden", "Garage", "Smart Home", "Security System", "Central AC"],
    videoUrl: "https://www.youtube.com/embed/dQw4w9WgXcQ",
    coordinates: { lat: 34.0736, lng: -118.4004 },
    agent: {
      name: "Asseston Real Estate",
      phone: "+268 7602 3807",
      whatsapp: "+2687602380",
    }
  },
  {
    id: 2,
    title: "Modern Downtown Apartment",
    price: "$425,000",
    location: "Downtown, Miami",
    beds: 2,
    baths: 2,
    area: "1,450 sq ft",
    image: "/src/assets/property-2.jpg",
    description: "Contemporary apartment in the heart of downtown featuring floor-to-ceiling windows, modern kitchen, and stunning city views. Perfect for urban professionals.",
    features: ["Gym", "Rooftop Terrace", "Concierge", "Pet Friendly", "Parking"],
    coordinates: { lat: 25.7617, lng: -80.1918 },
    agent: {
      name: "Asseton Real Estate",
      phone: "+268 7602 3807",
      whatsapp: "+2687602380",
    }
  },
  {
    id: 3,
    title: "Spacious Family Home",
    price: "$675,000",
    location: "Suburb Heights",
    beds: 5,
    baths: 4,
    area: "4,100 sq ft",
    image: "/src/assets/property-3.jpg",
    description: "Perfect family home with generous living spaces, large backyard, and located in a quiet neighborhood with excellent schools nearby.",
    features: ["Large Backyard", "Fireplace", "Home Office", "Updated Kitchen", "Deck"],
    videoUrl: "https://www.youtube.com/embed/dQw4w9WgXcQ",
    coordinates: { lat: 34.0522, lng: -118.2437 },
    agent: {
      name: "Asseton Real Estate",
      phone: "+268 7602 3807",
      whatsapp: "+2687602380",
    }
  },
];

const PropertyDetails = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const property = properties.find(p => p.id === Number(id));

  if (!property) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-4xl font-bold mb-4">Property Not Found</h1>
          <Button onClick={() => navigate("/")}>Back to Home</Button>
        </div>
      </div>
    );
  }

  const handleWhatsApp = () => {
    window.open(`https://wa.me/${property.agent.whatsapp}?text=Hi, I'm interested in ${property.title}`, '_blank');
  };

  const handleCall = () => {
    window.location.href = `tel:${property.agent.phone}`;
  };

  const handleMessage = () => {
    window.location.href = `sms:${property.agent.phone}?body=Hi, I'm interested in ${property.title}`;
  };

  return (
    <div className="min-h-screen bg-background">
      <Navbar />
      
      <main className="container mx-auto px-4 py-8">
        <Button
          variant="ghost"
          onClick={() => navigate(-1)}
          className="mb-6 hover:bg-primary/10 hover:text-primary transition-all"
        >
          <ArrowLeft className="mr-2 h-4 w-4" />
          Back to Properties
        </Button>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Main Content */}
          <div className="lg:col-span-2 space-y-6">
            {/* Image Gallery */}
            <Card>
              <CardContent className="p-0">
                <AspectRatio ratio={16 / 9}>
                  <img
                    src={property.image}
                    alt={property.title}
                    className="w-full h-full object-cover rounded-t-lg"
                  />
                </AspectRatio>
              </CardContent>
            </Card>

            {/* Property Info */}
            <Card>
              <CardContent className="p-6">
                <h1 className="text-3xl font-bold mb-2">{property.title}</h1>
                <p className="text-2xl text-primary font-semibold mb-4">{property.price}</p>
                
                <div className="flex items-center gap-2 text-muted-foreground mb-6">
                  <MapPin className="h-4 w-4" />
                  <span>{property.location}</span>
                </div>

                <div className="flex gap-6 mb-6 pb-6 border-b">
                  <div className="flex items-center gap-2">
                    <Bed className="h-5 w-5 text-primary" />
                    <span className="font-medium">{property.beds} Beds</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <Bath className="h-5 w-5 text-primary" />
                    <span className="font-medium">{property.baths} Baths</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <Maximize className="h-5 w-5 text-primary" />
                    <span className="font-medium">{property.area}</span>
                  </div>
                </div>

                <div className="mb-6">
                  <h2 className="text-xl font-semibold mb-3">Description</h2>
                  <p className="text-muted-foreground leading-relaxed">
                    {property.description}
                  </p>
                </div>

                <div>
                  <h2 className="text-xl font-semibold mb-3">Features & Amenities</h2>
                  <div className="grid grid-cols-2 gap-3">
                    {property.features.map((feature, index) => (
                      <div key={index} className="flex items-center gap-2">
                        <div className="w-2 h-2 rounded-full bg-primary" />
                        <span>{feature}</span>
                      </div>
                    ))}
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Video Tour (if available) */}
            {property.videoUrl && (
              <Card>
                <CardContent className="p-6">
                  <h2 className="text-xl font-semibold mb-4">Video Tour</h2>
                  <AspectRatio ratio={16 / 9}>
                    <iframe
                      src={property.videoUrl}
                      className="w-full h-full rounded-lg"
                      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                      allowFullScreen
                    />
                  </AspectRatio>
                </CardContent>
              </Card>
            )}

            {/* Map */}
            <Card>
              <CardContent className="p-6">
                <h2 className="text-xl font-semibold mb-4">Location</h2>
                <AspectRatio ratio={16 / 9}>
                  <iframe
                    src={`https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3305.${property.id}!2d${property.coordinates.lng}!3d${property.coordinates.lat}!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zM!5e0!3m2!1sen!2sus!4v1234567890`}
                    className="w-full h-full rounded-lg border-0"
                    loading="lazy"
                  />
                </AspectRatio>
              </CardContent>
            </Card>
          </div>

          {/* Sidebar - Contact */}
          <div className="lg:col-span-1">
            <Card className="sticky top-24">
              <CardContent className="p-6">
                <h2 className="text-xl font-semibold mb-4">Contact Agent</h2>
                
                <div className="mb-6">
                  <p className="font-medium mb-1">{property.agent.name}</p>
                  <p className="text-sm text-muted-foreground">{property.agent.phone}</p>
                </div>

                <div className="space-y-3">
                  <Button
                    onClick={handleWhatsApp}
                    className="w-full bg-[#25D366] hover:bg-[#20BD5A] text-white"
                    size="lg"
                  >
                    <MessageCircle className="mr-2 h-5 w-5" />
                    WhatsApp
                  </Button>

                  <Button
                    onClick={handleCall}
                    variant="outline"
                    className="w-full"
                    size="lg"
                  >
                    <Phone className="mr-2 h-5 w-5" />
                    Call Now
                  </Button>

                  <Button
                    onClick={handleMessage}
                    variant="outline"
                    className="w-full"
                    size="lg"
                  >
                    <MessageCircle className="mr-2 h-5 w-5" />
                    Send Message
                  </Button>
                </div>

                <div className="mt-6 pt-6 border-t">
                  <p className="text-sm text-muted-foreground text-center">
                    Available Monday - Sunday
                    <br />
                    8:00 AM - 8:00 PM
                  </p>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default PropertyDetails;
