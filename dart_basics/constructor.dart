// constructor.dart

// Animal class represents an entity with 'name' and 'age' properties
class Animal {
  String name;
  int age;

  // Constructor: initializes name and age when an Animal object is created
  Animal(this.name, this.age);

  // Method: prints a simple message to simulate the animal speaking
  void speak() {
    print('$name says hello!');
  }
}

// SimNumber class holds immutable data using 'final' and a constant constructor
class SimNumber {
  final String name;
  final int age;

  // Constant constructor allows compile-time constant instances
  // Useful for creating objects that won't change and are shared safely
  const SimNumber(this.name, this.age);
}

// Encapsulation example:
// Employee class uses private fields (prefixed with _) and public getter/setter methods
class Employee {
  int? _id;    // Private property - not accessible outside this class directly
  String? _name;

  // Getter to access _id safely (throws if null, but used here for simplicity)
  int getId() {
    return _id!;
  }

  // Getter to access _name safely
  String getName() {
    return _name!;
  }

  // Setter to update _id - controls how _id is modified
  void setId(int id) {
    this._id = id;
  }

  // Setter to update _name
  void setName(String name) {
    this._name = name;
  }
}

// Person class demonstrates:
// - Use of 'final' for immutable fields
// - Use of a const constructor to create compile-time constant instances
class Person {
  final String name;  // Readonly property after initialization
  final int age;

  // Const constructor - allows creating objects that are immutable and canonicalized
  const Person(this.name, this.age);

  // Simple method to print an introduction
  void introduce() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

// Renamed to avoid name clash with Car below
// Demonstrates readonly fields with 'final' and normal constructor
class CarFinal {
  final String model;
  final int year;

  // Constructor initializes final fields — can't be changed after creation
  CarFinal(this.model, this.year);
}

// Book class demonstrates:
// - Regular mutable properties
// - Getters and setters using Dart's special syntax
class Book {
  String title;
  String author;
  int pages;

  // Constructor to initialize all properties
  Book(this.title, this.author, this.pages);

  // Getter for title (accessed like a property, e.g., b.getTitle)
  String get getTitle => title;

  // Setter for title (used like a property, e.g., b.setTitle = "new title")
  set setTitle(String title) => this.title = title;

  // Method simulating reading the book
  void read() {
    print('Reading $title by $author');
  }
}

// Basic Car class without constructor to demonstrate inheritance
// Note: properties are nullable because they're not initialized here
class Car {
  String? color;
  int? year;

  // Method common to all cars
  void start() {
    print("Car started");
  }

  void showDetails() {
    print("Color: $color");
    print("Year: $year");
  }
}

// Toyota class extends Car
// Inherits color, year, and start(), and adds its own properties and methods
class Toyota extends Car {
  String? model;
  int? price;

  // Overrides showDetails to include Toyota-specific info
  @override
  void showDetails() {
    super.showDetails();  // Prints color and year
    print("Model: $model");
    print("Price: $price");
  }
}

void main() {
  // Create a const Person object (immutable and canonicalized)
  const Person person = Person('Alice', 30);
  person.introduce();  // Output: Hello, my name is Alice and I am 30 years old.

  // Demonstrate Book class usage with getters and setters
  Book b = Book("Dart Essentials", "Jane Doe", 200);
  b.setTitle = "Flutter with Dart";   // Using setter to change title
  print(b.getTitle);                  // Using getter to access updated title
  b.read();                          // Output: Reading Flutter with Dart by Jane Doe

  // Create and use an Animal instance
  Animal a = Animal("Dog", 5);
  a.speak();  // Output: Dog says hello!

  // Create a constant SimNumber instance - immutable data holder
  const SimNumber sim = SimNumber("John", 25);
  print("SimNumber: ${sim.name}, Age: ${sim.age}");  // Output: SimNumber: John, Age: 25

  // Employee demonstrating encapsulation with private properties and getters/setters
  Employee emp = Employee();
  emp.setId(101);
  emp.setName("Alice");
  print("Employee ID: ${emp.getId()}, Name: ${emp.getName()}"); // Output: Employee ID: 101, Name: Alice

  // CarFinal example with readonly (final) fields
  CarFinal car = CarFinal("Toyota", 2020);
  print("Car Model: ${car.model}, Year: ${car.year}");  // Output: Car Model: Toyota, Year: 2020

  // Demonstrating inheritance: Toyota extends Car
  var toyota = Toyota();
  toyota.color = "Red";
  toyota.year = 2020;
  toyota.model = "Camry";
  toyota.price = 20000;
  toyota.start();        // Inherited method from Car class, Output: Car started
  toyota.showDetails();  // Output:
                         // Color: Red
                         // Year: 2020
                         // Model: Camry
                         // Price: 20000
}


// // constructor.dart

// // Animal class represents an entity with 'name' and 'age' properties
// class Animal {
//   String name;
//   int age;

//   // Constructor: initializes name and age when an Animal object is created
//   Animal(this.name, this.age);

//   // Method: prints a simple message to simulate the animal speaking
//   void speak() {
//     print('$name says hello!');
//   }
// }

// // SimNumber class holds immutable data using 'final' and a constant constructor
// class SimNumber {
//   final String name;
//   final int age;

//   // Constant constructor allows compile-time constant instances
//   // Useful for creating objects that won't change and are shared safely
//   const SimNumber(this.name, this.age);
// }

// // Encapsulation example:
// // Employee class uses private fields (prefixed with _) and public getter/setter methods
// class Employee {
//   int? _id;    // Private property - not accessible outside this class directly
//   String? _name;

//   // Getter to access _id safely (throws if null, but used here for simplicity)
//   int getId() {
//     return _id!;
//   }

//   // Getter to access _name safely
//   String getName() {
//     return _name!;
//   }

//   // Setter to update _id - controls how _id is modified
//   void setId(int id) {
//     this._id = id;
//   }

//   // Setter to update _name
//   void setName(String name) {
//     this._name = name;
//   }
// }

// // Person class demonstrates:
// // - Use of 'final' for immutable fields
// // - Use of a const constructor to create compile-time constant instances
// class Person {
//   final String name;  // Readonly property after initialization
//   final int age;

//   // Const constructor - allows creating objects that are immutable and canonicalized
//   const Person(this.name, this.age);

//   // Simple method to print an introduction
//   void introduce() {
//     print('Hello, my name is $name and I am $age years old.');
//   }
// }

// // Renamed to avoid name clash with Car below
// // Demonstrates readonly fields with 'final' and normal constructor
// class CarFinal {
//   final String model;
//   final int year;

//   // Constructor initializes final fields — can't be changed after creation
//   CarFinal(this.model, this.year);
// }

// // Book class demonstrates:
// // - Regular mutable properties
// // - Getters and setters using Dart's special syntax
// class Book {
//   String title;
//   String author;
//   int pages;

//   // Constructor to initialize all properties
//   Book(this.title, this.author, this.pages);

//   // Getter for title (accessed like a property, e.g., b.getTitle)
//   String get getTitle => title;

//   // Setter for title (used like a property, e.g., b.setTitle = "new title")
//   set setTitle(String title) => this.title = title;

//   // Method simulating reading the book
//   void read() {
//     print('Reading $title by $author');
//   }
// }

// // Basic Car class without constructor to demonstrate inheritance
// // Note: properties are nullable because they're not initialized here
// class Car {
//   String? color;
//   int? year;

//   // Method common to all cars
//   void start() {
//     print("Car started");
//   }
// }

// class Car {
//   String? color;
//   int? year;

//   void start() {
//     print("Car started");
//   }

//   void showDetails() {
//     print("Color: $color");
//     print("Year: $year");
//   }
// }

// class Toyota extends Car {
//   String? model;
//   int? price;

//   @override
//   void showDetails() {
//     super.showDetails();  // Prints color and year
//     print("Model: $model");
//     print("Price: $price");
//   }
// }


// // Toyota class extends Car
// // Inherits color, year, and start(), and adds its own properties and methods
// class Toyota extends Car {
//   String? model;
//   int? price;

//   // Method specific to Toyota, showing additional details
//   void showDetails() {
//     print("Model: $model");
//     print("Price: $price");
//   }
// }

// void main() {
//   // Create a const Person object (immutable and canonicalized)
//   const Person person = Person('Alice', 30);
//   person.introduce();  // Output: Hello, my name is Alice and I am 30 years old.

//   // Demonstrate Book class usage with getters and setters
//   Book b = Book("Dart Essentials", "Jane Doe", 200);
//   b.setTitle = "Flutter with Dart";   // Using setter to change title
//   print(b.getTitle);                  // Using getter to access updated title
//   b.read();                          // Output: Reading Flutter with Dart by Jane Doe

//   // Create and use an Animal instance
//   Animal a = Animal("Dog", 5);
//   a.speak();  // Output: Dog says hello!

//   // Create a constant SimNumber instance - immutable data holder
//   const SimNumber sim = SimNumber("John", 25);
//   print("SimNumber: ${sim.name}, Age: ${sim.age}");  // Output: SimNumber: John, Age: 25

//   // Employee demonstrating encapsulation with private properties and getters/setters
//   Employee emp = Employee();
//   emp.setId(101);
//   emp.setName("Alice");
//   print("Employee ID: ${emp.getId()}, Name: ${emp.getName()}"); // Output: Employee ID: 101, Name: Alice

//   // CarFinal example with readonly (final) fields
//   CarFinal car = CarFinal("Toyota", 2020);
//   print("Car Model: ${car.model}, Year: ${car.year}");  // Output: Car Model: Toyota, Year: 2020

//   // Demonstrating inheritance: Toyota extends Car
//   var toyota = Toyota();
//   toyota.color = "Red";
//   toyota.year = 2020;
//   toyota.model = "Camry";
//   toyota.price = 20000;
//   toyota.start();        // Inherited method from Car class, Output: Car started
//   toyota.showDetails();  // Output: Model: Camry \n Price: 20000
// }








// // // constructor.dart

// // // Class representing an Animal with name and age properties
// // class Animal {
// //   String name;
// //   int age;

// //   // Constructor to initialize the properties
// //   Animal(this.name, this.age);

// //   // Method to simulate speaking behavior
// //   void speak() {
// //     print('$name says hello!');
// //   }
// // }

// // // Class representing a simple constant data holder for a person's info
// // class SimNumber {
// //   final String name;
// //   final int age;

// //   // Constant constructor allows creating compile-time constant instances
// //   const SimNumber(this.name, this.age);
// // }

// // // Encapsulation example: Employee class with private fields and public getter/setter methods
// // class Employee {
// //   // Private properties using underscore (_) prefix
// //   int? _id;
// //   String? _name;

// //   // Getter to access private _id property
// //   int getId() {
// //     return _id!;
// //   }

// //   // Getter to access private _name property
// //   String getName() {
// //     return _name!;
// //   }

// //   // Setter to update private _id property
// //   void setId(int id) {
// //     this._id = id;
// //   }

// //   // Setter to update private _name property
// //   void setName(String name) {
// //     this._name = name;
// //   }
// // }

// // // Person class demonstrating constant constructor and immutable properties
// // class Person {
// //   // final keyword makes these properties read-only after initialization
// //   final String name;
// //   final int age;

// //   // Const constructor to create compile-time constant objects
// //   const Person(this.name, this.age);

// //   // Method to introduce the person
// //   void introduce() {
// //     print('Hello, my name is $name and I am $age years old.');
// //   }
// // }

// // // Renamed to avoid conflict with the other Car class
// // class CarFinal {
// //   final String model;
// //   final int year;

// //   // Constructor to initialize the final properties
// //   CarFinal(this.model, this.year);
// // }

// // // Book class demonstrating getters and setters for accessing and updating properties
// // class Book {
// //   String title;
// //   String author;
// //   int pages;

// //   // Constructor to initialize book properties
// //   Book(this.title, this.author, this.pages);

// //   // Getter for title using the `get` keyword
// //   String get getTitle => title;

// //   // Setter for title using the `set` keyword
// //   set setTitle(String title) => this.title = title;

// //   // Method to simulate reading the book
// //   void read() {
// //     print('Reading $title by $author');
// //   }
// // }

// // // Basic Car class without constructor, to be inherited by Toyota
// // class Car {
// //   String? color;
// //   int? year;

// //   void start() {
// //     print("Car started");
// //   }
// // }

// // // Toyota class extends Car and adds more properties & method
// // class Toyota extends Car {
// //   String? model;
// //   int? price;

// //   void showDetails() {
// //     print("Model: $model");
// //     print("Price: $price");
// //   }
// // }

// // void main() {
// //   // Create a const instance of Person using const constructor
// //   const Person person = Person('Alice', 30);
// //   person.introduce();

// //   // Create and demonstrate usage of Book class with getter/setter
// //   Book b = Book("Dart Essentials", "Jane Doe", 200);
// //   b.setTitle = "Flutter with Dart";   // Using setter to update title
// //   print(b.getTitle);                  // Using getter to get title
// //   b.read();                          // Call method to print reading message

// //   // Create and demonstrate Animal class usage
// //   Animal a = Animal("Dog", 5);
// //   a.speak();

// //   // Create a const instance of SimNumber
// //   const SimNumber sim = SimNumber("John", 25);
// //   print("SimNumber: ${sim.name}, Age: ${sim.age}");

// //   // Demonstrate Employee class with encapsulated private fields accessed via getter/setter methods
// //   Employee emp = Employee();
// //   emp.setId(101);
// //   emp.setName("Alice");
// //   print("Employee ID: ${emp.getId()}, Name: ${emp.getName()}");

// //   // Demonstrate CarFinal class with readonly final properties
// //   CarFinal car = CarFinal("Toyota", 2020);
// //   print("Car Model: ${car.model}, Year: ${car.year}");

// //   // Demonstrate inheritance: Toyota extends Car
// //   var toyota = Toyota();
// //   toyota.color = "Red";
// //   toyota.year = 2020;
// //   toyota.model = "Camry";
// //   toyota.price = 20000;
// //   toyota.start();
// //   toyota.showDetails();
// // }
