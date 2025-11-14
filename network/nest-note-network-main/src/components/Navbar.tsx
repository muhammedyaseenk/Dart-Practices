import { Button } from "@/components/ui/button";
import { Phone } from "lucide-react";
import { Link } from "react-router-dom";

export const Navbar = () => {
  return (
    <nav className="border-b bg-card/80 sticky top-0 z-50 backdrop-blur-md bg-background/95 shadow-sm">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-between h-20">
          <Link to="/" className="flex items-center gap-2 hover:opacity-80 transition-opacity">
            <div className="text-2xl font-bold">
              <span className="text-secondary">asseton</span>
              <span className="text-primary text-sm block leading-none">Real estate partner</span>
            </div>
          </Link>
          
          <div className="hidden md:flex items-center gap-8">
            <a href="/#properties" className="text-foreground hover:text-primary transition-colors font-medium relative group">
              Properties
              <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-primary transition-all group-hover:w-full"></span>
            </a>
            <a href="/#about" className="text-foreground hover:text-primary transition-colors font-medium relative group">
              About
              <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-primary transition-all group-hover:w-full"></span>
            </a>
            <a href="/#contact" className="text-foreground hover:text-primary transition-colors font-medium relative group">
              Contact
              <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-primary transition-all group-hover:w-full"></span>
            </a>
          </div>

          <div className="flex items-center gap-3">
            <a href="tel:9400709646">
              <Button variant="outline" size="sm" className="hidden sm:flex items-center gap-2 hover:bg-primary hover:text-primary-foreground transition-all">
                <Phone className="w-4 h-4" />
                <span>94007 09646</span>
              </Button>
            </a>
            <Link to="/list-property">
              <Button variant="default" size="sm" className="shadow-md hover:shadow-lg transition-all">
                List Property
              </Button>
            </Link>
          </div>
        </div>
      </div>
    </nav>
  );
};
