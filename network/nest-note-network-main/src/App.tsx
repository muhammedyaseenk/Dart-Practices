import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route, ScrollRestoration } from "react-router-dom";
import { useEffect } from "react";
import Index from "./pages/Index";
import PropertyDetails from "./pages/PropertyDetails";
import ListProperty from "./pages/ListProperty";
import NotFound from "./pages/NotFound";

const queryClient = new QueryClient();

// Scroll restoration component
const ScrollToTop = () => {
  const { pathname } = window.location;
  
  useEffect(() => {
    // Save scroll position before navigating away
    const handleScroll = () => {
      sessionStorage.setItem(`scroll-${pathname}`, window.scrollY.toString());
    };
    
    window.addEventListener('scroll', handleScroll);
    
    // Restore scroll position
    const savedPosition = sessionStorage.getItem(`scroll-${pathname}`);
    if (savedPosition && pathname === window.location.pathname) {
      window.scrollTo(0, parseInt(savedPosition));
    } else {
      window.scrollTo(0, 0);
    }
    
    return () => window.removeEventListener('scroll', handleScroll);
  }, [pathname]);

  return null;
};

const App = () => (
  <QueryClientProvider client={queryClient}>
    <TooltipProvider>
      <Toaster />
      <Sonner />
      <BrowserRouter>
        <ScrollToTop />
        <Routes>
          <Route path="/" element={<Index />} />
          <Route path="/property/:id" element={<PropertyDetails />} />
          <Route path="/list-property" element={<ListProperty />} />
          {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
          <Route path="*" element={<NotFound />} />
        </Routes>
      </BrowserRouter>
    </TooltipProvider>
  </QueryClientProvider>
);

export default App;
