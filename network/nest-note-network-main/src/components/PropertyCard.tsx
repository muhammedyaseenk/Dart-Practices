import { Card, CardContent, CardFooter } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { MapPin, Bed, Bath, Square } from "lucide-react";
import { Link } from "react-router-dom";

interface PropertyCardProps {
  id: number;
  image: string;
  title: string;
  location: string;
  price: string;
  beds?: number;
  baths?: number;
  area: string;
  type: "Sale" | "Rent";
}

export const PropertyCard = ({
  id,
  image,
  title,
  location,
  price,
  beds,
  baths,
  area,
  type,
}: PropertyCardProps) => {
  return (
    <Card className="overflow-hidden hover:shadow-2xl transition-all duration-500 group border-2 hover:border-primary/50 bg-card">
      <div className="relative overflow-hidden">
        <img
          src={image}
          alt={title}
          className="w-full h-64 object-cover group-hover:scale-110 transition-transform duration-700"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
        <Badge className="absolute top-4 right-4 bg-secondary text-secondary-foreground shadow-lg font-semibold px-3 py-1">
          For {type}
        </Badge>
      </div>
      <CardContent className="p-6">
        <h3 className="text-xl font-bold mb-3 group-hover:text-primary transition-colors line-clamp-1">
          {title}
        </h3>
        <div className="flex items-center text-muted-foreground mb-4">
          <MapPin className="w-4 h-4 mr-2 text-primary" />
          <span className="text-sm line-clamp-1">{location}</span>
        </div>
        <div className="flex items-center gap-4 text-sm text-muted-foreground mb-5 flex-wrap">
          {beds && (
            <div className="flex items-center gap-1.5 bg-muted/50 px-2 py-1 rounded">
              <Bed className="w-4 h-4 text-primary" />
              <span className="font-medium">{beds} Beds</span>
            </div>
          )}
          {baths && (
            <div className="flex items-center gap-1.5 bg-muted/50 px-2 py-1 rounded">
              <Bath className="w-4 h-4 text-primary" />
              <span className="font-medium">{baths} Baths</span>
            </div>
          )}
          <div className="flex items-center gap-1.5 bg-muted/50 px-2 py-1 rounded">
            <Square className="w-4 h-4 text-primary" />
            <span className="font-medium">{area}</span>
          </div>
        </div>
        <div className="text-2xl font-bold text-primary mb-4">{price}</div>
      </CardContent>
      <CardFooter className="p-6 pt-0">
        <Link to={`/property/${id}`} className="w-full">
          <Button variant="outline" className="w-full group-hover:bg-primary group-hover:text-primary-foreground transition-all hover:scale-105 font-semibold">
            View Details
          </Button>
        </Link>
      </CardFooter>
    </Card>
  );
};
