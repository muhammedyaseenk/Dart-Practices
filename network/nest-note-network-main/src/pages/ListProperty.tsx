import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Navbar } from "@/components/Navbar";
import { Footer } from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { useToast } from "@/hooks/use-toast";
import { Upload, Home } from "lucide-react";

const ListProperty = () => {
  const navigate = useNavigate();
  const { toast } = useToast();
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);
    
    // Simulate API call
    setTimeout(() => {
      toast({
        title: "Success!",
        description: "Your property has been listed successfully. Our team will review it shortly.",
      });
      setLoading(false);
      navigate("/");
    }, 2000);
  };

  return (
    <div className="min-h-screen bg-background">
      <Navbar />
      
      <div className="relative bg-gradient-to-br from-primary/10 via-background to-secondary/10 py-12 mt-20">
        <div className="container mx-auto px-4">
          <div className="text-center max-w-2xl mx-auto mb-8">
            <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-primary/10 mb-4">
              <Home className="w-8 h-8 text-primary" />
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-4">List Your Property</h1>
            <p className="text-lg text-muted-foreground">
              Reach thousands of potential buyers and renters. Fill out the form below to get started.
            </p>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-12">
        <Card className="max-w-4xl mx-auto shadow-lg">
          <CardHeader className="space-y-1 pb-8">
            <CardTitle className="text-2xl">Property Details</CardTitle>
            <CardDescription>
              Please provide accurate information about your property
            </CardDescription>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-8">
              {/* Basic Information */}
              <div className="space-y-4">
                <h3 className="text-lg font-semibold border-b pb-2">Basic Information</h3>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="space-y-2">
                    <Label htmlFor="title">Property Title *</Label>
                    <Input
                      id="title"
                      placeholder="e.g., Modern Villa with Garden"
                      required
                      className="h-11"
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="type">Property Type *</Label>
                    <Select required>
                      <SelectTrigger className="h-11">
                        <SelectValue placeholder="Select type" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="house">House</SelectItem>
                        <SelectItem value="apartment">Apartment</SelectItem>
                        <SelectItem value="villa">Villa</SelectItem>
                        <SelectItem value="land">Land</SelectItem>
                        <SelectItem value="commercial">Commercial</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="listing-type">Listing Type *</Label>
                    <Select required>
                      <SelectTrigger className="h-11">
                        <SelectValue placeholder="For Sale or Rent" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="sale">For Sale</SelectItem>
                        <SelectItem value="rent">For Rent</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="price">Price *</Label>
                    <Input
                      id="price"
                      type="text"
                      placeholder="e.g., ₹85 Lakhs or ₹12,000/month"
                      required
                      className="h-11"
                    />
                  </div>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="location">Location *</Label>
                  <Input
                    id="location"
                    placeholder="e.g., Chakkaraparambu, Munnuperiya Road"
                    required
                    className="h-11"
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="description">Description *</Label>
                  <Textarea
                    id="description"
                    placeholder="Describe your property in detail..."
                    required
                    rows={5}
                    className="resize-none"
                  />
                </div>
              </div>

              {/* Property Specifications */}
              <div className="space-y-4">
                <h3 className="text-lg font-semibold border-b pb-2">Property Specifications</h3>
                
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  <div className="space-y-2">
                    <Label htmlFor="beds">Bedrooms</Label>
                    <Input
                      id="beds"
                      type="number"
                      min="0"
                      placeholder="0"
                      className="h-11"
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="baths">Bathrooms</Label>
                    <Input
                      id="baths"
                      type="number"
                      min="0"
                      placeholder="0"
                      className="h-11"
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="area">Area *</Label>
                    <Input
                      id="area"
                      placeholder="e.g., 2,400 sq ft or 13 Cents"
                      required
                      className="h-11"
                    />
                  </div>
                </div>
              </div>

              {/* Images */}
              <div className="space-y-4">
                <h3 className="text-lg font-semibold border-b pb-2">Property Images</h3>
                
                <div className="space-y-2">
                  <Label htmlFor="images">Upload Images *</Label>
                  <div className="border-2 border-dashed rounded-lg p-8 text-center hover:border-primary/50 transition-colors cursor-pointer">
                    <Upload className="w-12 h-12 mx-auto mb-4 text-muted-foreground" />
                    <Input
                      id="images"
                      type="file"
                      multiple
                      accept="image/*"
                      className="hidden"
                      required
                    />
                    <Label htmlFor="images" className="cursor-pointer">
                      <span className="text-primary font-medium">Click to upload</span>
                      <span className="text-muted-foreground"> or drag and drop</span>
                      <p className="text-sm text-muted-foreground mt-2">
                        PNG, JPG, JPEG up to 10MB each (Max 10 images)
                      </p>
                    </Label>
                  </div>
                </div>
              </div>

              {/* Media Links */}
              <div className="space-y-4">
                <h3 className="text-lg font-semibold border-b pb-2">Additional Media (Optional)</h3>
                
                <div className="space-y-2">
                  <Label htmlFor="video">Video URL</Label>
                  <Input
                    id="video"
                    type="url"
                    placeholder="YouTube or other video link"
                    className="h-11"
                  />
                  <p className="text-sm text-muted-foreground">
                    Add a virtual tour or property video
                  </p>
                </div>
              </div>

              {/* Contact Information */}
              <div className="space-y-4">
                <h3 className="text-lg font-semibold border-b pb-2">Contact Information</h3>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="space-y-2">
                    <Label htmlFor="name">Your Name *</Label>
                    <Input
                      id="name"
                      placeholder="Full name"
                      required
                      className="h-11"
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="phone">Phone Number *</Label>
                    <Input
                      id="phone"
                      type="tel"
                      placeholder="e.g., 94007 09646"
                      required
                      className="h-11"
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="email">Email</Label>
                    <Input
                      id="email"
                      type="email"
                      placeholder="your@email.com"
                      className="h-11"
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="whatsapp">WhatsApp Number</Label>
                    <Input
                      id="whatsapp"
                      type="tel"
                      placeholder="WhatsApp number with country code"
                      className="h-11"
                    />
                  </div>
                </div>
              </div>

              {/* Submit Buttons */}
              <div className="flex flex-col sm:flex-row gap-4 pt-6">
                <Button
                  type="submit"
                  size="lg"
                  className="flex-1 h-12"
                  disabled={loading}
                >
                  {loading ? "Submitting..." : "Submit Property Listing"}
                </Button>
                <Button
                  type="button"
                  variant="outline"
                  size="lg"
                  className="flex-1 h-12"
                  onClick={() => navigate("/")}
                  disabled={loading}
                >
                  Cancel
                </Button>
              </div>

              <p className="text-sm text-muted-foreground text-center">
                By submitting, you agree to our terms and conditions. Our team will review your listing within 24 hours.
              </p>
            </form>
          </CardContent>
        </Card>
      </div>

      <Footer />
    </div>
  );
};

export default ListProperty;
