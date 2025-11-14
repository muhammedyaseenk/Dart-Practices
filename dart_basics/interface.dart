// interface in dart is implemented using abstract class
// abstract class can have method body  

// implements means "I will implement all methods myself" — no inherited method bodies.

// extends means "I inherit method bodies and can override if I want."

class InterfaceName {
  // code
}

class ClassName implements InterfaceName {
  // codedart 
}

abstract class Animal {
  void eat(); // abstract method
  void sleep() {
    print("Animal is sleeping"); // concrete method
  }
}

class Dog implements Animal {
  @override
  void eat() {
    print("Dog is eating");
  }   

  @override
  void sleep() {
    print("Animal is sleeping"); // must implement sleep() explicitly when using implements
  }
}

void main() {
  Dog dog = Dog();

  try {
    dog.eat();   // Dog is eating
    dog.sleep(); // Animal is sleeping
  } catch (e) {
    print('An error occurred: $e');
  }
}
