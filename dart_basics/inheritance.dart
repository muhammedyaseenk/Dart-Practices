// Inheritance in dart is the process where one class (child class or subclass) can inherit properties and methods from another class (parent class or superclass).
// Inheritance promotes code reusability and establishes a hierarchical relationship between classes.
// In Dart, inheritance is implemented using the `extends` keyword.
// Single Inheritance: A class inherits from one superclass.
// Multi-level Inheritance: A class inherits from a subclass, which in turn inherits from another
// superclass.
// Hierarchical Inheritance: Multiple classes inherit from a single superclass.
// Dart does not support multiple inheritance (a class inheriting from more than one class) directly to avoid complexity and ambiguity.
// Instead, Dart uses mixins to achieve similar functionality.
// Example of Single Inheritance

// A static variable is a variable that is shared by all instances of a class. It is declared using the static keyword. It is initialized only once when the class is loaded. It is used to store the class-level data.
//   static dataType variableName = value;

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
// Dog class inherits from Animal class
class Dog extends Animal {
  String breed;

  // Constructor for Dog class, calling the superclass constructor
   // question: why super keyword is used here?
   // asswer: The `super` keyword is used to call the constructor of the superclass (Animal) to initialize the inherited properties (name and age).

   // question:  is it named constructor?
   // answer: No, it is not a named constructor. It is a regular constructor that initializes the properties of the Dog class and calls the superclass constructor.
  Dog(String name, int age, this.breed) : super(name, age);

  // question: why this keyword is used here?
  // answer: The `this` keyword is used to refer to the current instance of the Dog class. It is used to initialize the breed property of the Dog class.

  // question:  is it positional parameter?
  // answer: Yes, the parameters in the Dog constructor are positional parameters. The order of the parameters matters when creating an instance of the Dog class.
  // Method specific to Dog class
  void bark() {
    print('$name barks!');
  }
} 
void main() {
  // Creating an instance of Dog class
  Dog dog = Dog('Buddy', 3, 'Golden Retriever');
  dog.speak(); // Inherited method from Animal class
  dog.bark();  // Method from Dog class
  Rectangle rectangle = Rectangle(10, 20);
  rectangle.area();

  Triangle triangle = Triangle(10, 20);
  triangle.area();
}

abstract class Shape {
  int dim1, dim2;
  // Constructor
  Shape(this.dim1, this.dim2);
  // Abstract method
  void area();
}

class Rectangle extends Shape {
  // Constructor
  Rectangle(int dim1, int dim2) : super(dim1, dim2);

  // Implementation of area()
  @override
  void area() {
    print('The area of the rectangle is ${dim1 * dim2}');
  }
}

class Triangle extends Shape {
  // Constructor
  Triangle(int dim1, int dim2) : super(dim1, dim2);

  // Implementation of area()
  @override
  void area() {
    print('The area of the triangle is ${0.5 * dim1 * dim2}');
  }
}

