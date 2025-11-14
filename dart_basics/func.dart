import 'dart:math';

// These are the topics covered in this file:
// - Function in Dart 
// - Types of Function in Dart
// - Function Parameters in Dart
// - Anonymous Function in Dart
// - Arrow Function in Dart   returnType functionName(parameters...) => expression;
// - Scope in Dart
// - Math in Dart


//You can access global variable from anywhere in the file.
 String global = "I am Global. Anyone can access me.";
void main() {
  print(global);
}
void main() {
  // Function in Dart
  print("Function in Dart");
  greet("Alice");

  // Types of Function in Dart
  print("\nTypes of Function in Dart");
  int sumResult = add(5, 10);
  print("Sum: $sumResult");

  // Function Parameters in Dart
  print("\nFunction Parameter in Dart");
  printMessage("Hello, World!", prefix: "Greeting:");

  // Anonymous Function in Dart example 1
  print("\nAnonymous Function in Dart");
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.forEach((number) {
    print("Number: $number");
  });

  // Anonymous function exmpale 2
  var cube = (int number) {
    return number * number * number;
  };

  print("The cube of 2 is ${cube(2)}");
  print("The cube of 3 is ${cube(3)}");
}

  // Arrow Function in Dart
  print("\nArrow Function in Dart");
  List<int> squaredNumbers = numbers.map((number) => number * number).toList();
  print("Squared Numbers: $squaredNumbers");

  // Scope in Dart
  print("\nScope in Dart");
  int outerVariable = 10;
  void innerFunction() {
    int innerVariable = 20;
    print("Inner Variable: $innerVariable");
    print("Outer Variable from Inner Function: $outerVariable");
  }
  innerFunction();

  // Math in Dart
  print("\nMath in Dart");
  double squareRoot = sqrt(16);
  print("Square Root of 16: $squareRoot");

  // More advanced functions
  moreAdvancedFunctions();
}

// Below are the more advanced function examples:

// Function in Dart
void greet(String name) {
  print("Hello, $name!");
}

// Types of Function in Dart
int add(int a, int b) {
  return a + b;
}

// Function Parameters in Dart
void printMessage(String message, {String prefix = ""}) {
  print("$prefix $message");
}

// More advanced function examples
void moreAdvancedFunctions() {
  print("\nMore Advanced Functions:");

  // Recursive function
  int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }
  print("Factorial of 5: ${factorial(5)}");

  // Higher-order function
  //  for example, a function that takes another function as a parameter
  // def operate(func, a, b): return func(a, b) ; def add(x, y):    return x + y ; print(operate(add, 4, 5))  # Output: 9
  // def greet(name):    return f"Hello, {name}";     def shout(func):    return func("Alice").upper() ;print(shout(greet))  # Output: HELLO, ALICE

  // Higher-order function are the functions that can take other functions as parameters or return a function.
  void applyFunction(int x, int Function(int) func) {
    print("Result after applying function: ${func(x)}");
  }
  applyFunction(10, (x) => x * 2);

  // Closure
  Function makeCounter() {
    int count = 0;
    return () {
      count++;
      print("Current count: $count");
    };
  }
  var counter = makeCounter();
  counter(); // 1
  counter(); // 2
}


void add(int num1, int num2, [int num3=0]){
   int sum;
  sum = num1 + num2 + num3;
   
   print("The sum is $sum");
}

void summation(){
  add(10, 20);
  add(10, 20, 30);
}