import { Phone, Mail, MapPin } from "lucide-react";
import { Button } from "@/components/ui/button";

export const Footer = () => {
  return (
    <footer className="bg-primary text-primary-foreground">
      <div className="container mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div>
            <div className="text-2xl font-bold mb-4">
              <span className="text-secondary">asseton</span>
              <span className="text-white text-sm block leading-none">Real estate partner</span>
            </div>
            <p className="text-white/80 mb-4">
              Your trusted partner in finding the perfect property. Professional service with local expertise.
            </p>
          </div>

          <div>
            <h3 className="text-lg font-semibold mb-4">Quick Links</h3>
            <ul className="space-y-2">
              <li>
                <a href="#properties" className="text-white/80 hover:text-white transition-colors">
                  Browse Properties
                </a>
              </li>
              <li>
                <a href="#about" className="text-white/80 hover:text-white transition-colors">
                  About Us
                </a>
              </li>
              <li>
                <a href="#contact" className="text-white/80 hover:text-white transition-colors">
                  Contact
                </a>
              </li>
            </ul>
          </div>

          <div>
            <h3 className="text-lg font-semibold mb-4">Contact Us</h3>
            <div className="space-y-3">
              <a href="tel:9400709646" className="flex items-center gap-2 text-white/80 hover:text-white transition-colors">
                <Phone className="w-4 h-4" />
                <span>94007 09646</span>
              </a>
              <a href="tel:9526661555" className="flex items-center gap-2 text-white/80 hover:text-white transition-colors">
                <Phone className="w-4 h-4" />
                <span>95266 61555</span>
              </a>
              <a href="https://www.asseton.in" target="_blank" rel="noopener noreferrer" className="flex items-center gap-2 text-white/80 hover:text-white transition-colors">
                <Mail className="w-4 h-4" />
                <span>www.asseton.in</span>
              </a>
            </div>
          </div>
        </div>

        <div className="border-t border-white/20 mt-8 pt-8 text-center text-white/60">
          <p>&copy; {new Date().getFullYear()} Asseton Real Estate Partner. All rights reserved.</p>
        </div>
      </div>
    </footer>
  );
};
