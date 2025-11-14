//  Dart Oops Concepts
//  1. Class and Object
//  2. Inheritance
//  3. Polymorphism
//  4. Abstraction
//  5. Encapsulation  . 
//  6. Constructors
//  7. Getters and Setters  
//  8. Static Members
//  9. Interfaces   
//  10. Mixins
//  11. Abstract Classes  
//  12. Method Overriding
//  13. Method Overloading (Not directly supported, but can be mimicked using
//      optional parameters or different named constructors)
//  14. Operator Overloading (Not directly supported, but can be mimicked using 
//      method overloading)
//  15. Object Comparison (Using '==' operator and 'identical()' function
//  16. Object Cloning (Using custom clone methods or copy constructors)
//  17. Object Destruction (Using 'dispose' method or similar patterns)
//  18. Object Serialization (Using 'dart:convert' library for JSON serialization)
//  19. Object Deserialization (Using 'dart:convert' library for JSON des
//  20. Object Lifetime Management (Using 'finalize' method or similar patterns)
//  21. Object Identity (Using 'identical()' function)
//  22. Object References (Understanding how references work in Dart)
//  23. Object Mutability (Understanding mutable and immutable objects in Dart)
//  24. Object State Management (Using state management libraries like Provider, Bloc, etc.)
//  25. Object-Oriented Design Principles (SOLID principles, DRY, KISS, etc.)
//  26. Design Patterns (Singleton, Factory, Observer, etc.)
//  27. Best Practices (Code organization, naming conventions, documentation, etc.)
//  28. Common Pitfalls (Avoiding common mistakes and anti-patterns in OOPs)
//  29. Advanced Topics (Reflection, Meta-programming, etc.)
//  30. Real-world Examples (Building real-world applications using OOPs concepts in Dart)
//  31. Testing OOPs Concepts (Unit testing, Mocking, etc.)
//  32. Performance Optimization (Optimizing OOPs code for better performance)
//  33. Code Readability (Writing clean and readable OOPs code)
//  34. Code Maintainability (Writing maintainable OOPs code)
//  35. Code Reusability (Writing reusable OOPs code)
//  36. Code Scalability (Writing scalable OOPs code)
//  37. Code Extensibility (Writing extensible OOPs code)
//  38. Code Flexibility (Writing flexible OOPs code)
//  39. Code Modularity (Writing modular OOPs code)
//  40. Code Coupling (Understanding coupling in OOPs code)
//  41. Code Cohesion (Understanding cohesion in OOPs code)
//  42. Code Complexity (Understanding complexity in OOPs code)
//  43. Code Refactoring (Refactoring OOPs code for better quality)
//  44. Code Documentation (Documenting OOPs code for better understanding)
//  45. Code Reviews (Reviewing OOPs code for better quality)
//  46. Code Collaboration (Collaborating on OOPs code with team members)
//  47. Code Versioning (Using version control systems like Git for OOPs code)
//  48. Code Deployment (Deploying OOPs code to production)
//  49. Code Monitoring (Monitoring OOPs code in production for better performance)
//  50. Code Debugging (Debugging OOPs code for better quality)
//  51. Code Profiling (Profiling OOPs code for better performance)
//  52. Code Optimization (Optimizing OOPs code for better performance)
//  53. Code Security (Securing OOPs code from vulnerabilities)
//  54. Code Compliance (Ensuring OOPs code complies with standards and regulations)
//  55. Code Ethics (Writing ethical OOPs code)
//  56. Code Sustainability (Writing sustainable OOPs code for long-term use)
//  57. Code Innovation (Innovating with OOPs concepts in Dart)
//  58. Code Creativity (Being creative with OOPs concepts in Dart)
//  59. Code Fun (Having fun with OOPs concepts in Dart)
//  60. Code Learning (Continuously learning and improving OOPs skills in Dart)


// Advantages
// It is easy to understand and use.
// It increases reusability and decreases complexity.
// The productivity of programmers increases.
// It makes the code easier to maintain, modify and debug.
// It promotes teamwork and collaboration.
// It reduces the repetition of code.
// Features Of OOP
// Class
// Object
// Encapsulation
// Inheritance
// Polymorphism
// Abstraction


// Key Points
// Object Oriented Programming (OOP) is a programming paradigm that uses objects and their interactions to design and program applications.
// OOP is based on objects, which are data structures containing data and methods.
// OOP is a way of thinking about programming that differs from traditional procedural programming.
// OOP can make code more modular, flexible, and extensible.
// OOP can help you to understand better and solve problems.


//  define a class   class ClassName { properties or fields, methods or functions}
class Animal {  
  // property
  String name;
  int age;

  // constructor
  Animal(this.name, this.age);

  // method
  void speak() {
    print('$name says hello!');
  }
}

class Book {
  String ? title;
  String ? author;
  int ? pages;

  // Constructor
  Book(this.title, this.author, this.pages);

  // Method
  void read() {
    print('Reading $title by $author');
  }
}

class Car {
  String ? make;
  String ? model;
  int ? year;
  double ? mileage;
}

void carDetails() {
  Car car1 = Car();
  car1.make = 'Toyota';
  car1.model = 'Camry';
  car1.year = 2020;
  car1.mileage = 15000.5;

  print('Car Make: ${car1.make}');
  print('Car Model: ${car1.model}');
  print('Car Year: ${car1.year}');
  print('Car Mileage: ${car1.mileage} miles');
}


void main() {
  // create an object of the class ClassName objectName = ClassName();
  Animal dog = Animal('Dog', 5);
  dog.speak(); // Output: Dog says hello!
  carDetails();
  Book book = Book('1984', 'George Orwell', 328);
  book.read(); // Output: Reading 1984 by George Orwell
  
  //object of simple interest created
  SimpleInterest simpleInterest = SimpleInterest();
  
  //setting properties for simple interest
  simpleInterest.principal=1000;
  simpleInterest.rate=10;
  simpleInterest.time=2;
  
  //functions of simple interest called
  print("Simple Interest is ${simpleInterest.interest()}.");
  displayHome();

}

class SimpleInterest{
  //properties of simple interest
  double? principal;
  double? rate;
  double? time;
  
  //functions of simple interest
  double interest(){
    return (principal! * rate! * time!)/100;
  }
}


class home{
  String? address;
  int? rooms;
  double? area;
  
  void details(){
    print("Address: $address");
    print("Rooms: $rooms");
    print("Area: $area");
  }
}
void displayHome(){
  home myHome = home();
  myHome.address="123 Main St";
  myHome.rooms=4;
  myHome.area=2500.5;
  
  myHome.details();
}

//  contructor in dart where the name of the constructor is same as the class name
//  class ClassName { ClassName() { // constructor body } }
//  class Person { String name; int age; Person(this.name, this.age); void introduce() { print('Hello, my name is $name and I am $age years old.'); } } void main() { Person person = Person('Alice', 30); person.introduce(); // Output: Hello, my name is Alice and I am 30 years old. }
//  Named Constructors
//  class ClassName { ClassName.namedConstructor() { // constructor body } }  
//  class Rectangle { double width; double height; Rectangle(this.width, this.height); Rectangle.square(double size) : width = size, height = size; double area() { return width * height; } } void main() { Rectangle rect = Rectangle(5, 10); print('Area of rectangle: ${rect.area()}'); // Output: Area of rectangle: 50 Rectangle square = Rectangle.square(5); print('Area of square: ${square.area()}'); // Output: Area of square: 25 }
//  Factory Constructors
//  class ClassName { factory ClassName() { // constructor body } }
//  class Logger { static final Map<String, Logger> _cache = <String, Logger
//  {}; final String name; factory Logger(String name) { return _cache.putIfAbsent(name, () => Logger._internal(name)); } Logger._internal(this.name); void log(String msg) { print('$name: $msg'); } } void main() { var logger1 = Logger('UI'); var logger2 = Logger('UI'); print(logger1 == logger2); // Output: true logger1.log('Button clicked'); // Output: UI: Button clicked }
//  Redirecting Constructors
//  class ClassName { ClassName() : this.namedConstructor(); ClassName.namedConstructor() { // constructor body } }
//  class Point { double x; double y; Point(this.x, this.y); Point
// Dart example: Constant Constructor and Named Constructor

class Point {
  final double x;
  final double y;

  // Const Constructor
  const Point(this.x, this.y);

  // Named Constructor: origin
  const Point.origin() : this(0, 0);
}

void main() {
  Point p1 = Point(3, 4);
  print('Point p1: (${p1.x}, ${p1.y})'); // Output: Point p1: (3.0, 4.0)

  Point p2 = Point.origin();
  print('Point p2: (${p2.x}, ${p2.y})'); // Output: Point p2: (0.0, 0.0)

  // Creating const instances
  const Point p3 = Point(1, 2);
  const Point p4 = Point.origin();

  print('Point p3: (${p3.x}, ${p3.y})');
  print('Point p4: (${p4.x}, ${p4.y})');
}

//  Dart example: Inheritance and Method Overriding
class Vehicle {
  void start() {
    print('Vehicle started');
  }

  void stop() {
    print('Vehicle stopped');
  }
}


class Car extends Vehicle {
  @override
  void start() {
    print('Car started');
  }

  @override
  void stop() {
    print('Car stopped');
  }
}