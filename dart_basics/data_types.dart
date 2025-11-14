// Data Types in Dart
// String: Represents a sequence of characters. E.g. "Hello, World!"
// int: Represents integer values. E.g. 42, -7
// double: Represents floating-point values. E.g. 3.14, -0.
// bool: Represents boolean values. E.g. true, false
// List: Represents an ordered collection of items. E.g. [1, 2,
// Map: Represents a collection of key-value pairs. E.g. {'name': 'Alice', 'age': 30}
// Set: Represents an unordered collection of unique items. E.g. {1, 2
// var: Used for type inference. E.g. var name = "Bob";
// dynamic: Represents a variable that can hold any type of value. E.g. dynamic value = 10; value = "Now I'm a string";
// const: Represents a compile-time constant. E.g. const pi = 3.14
// final: Represents a variable that can be assigned only once. E.g. final String name = "Charlie";
// Dart is a statically typed language, but it also supports type inference with the var keyword.
void main() {
  String greeting = "Hello, World!"; // String
  int age = 25; // int
  double height = 5.9; // double
  bool isStudent = true; // bool
  List<int> numbers = [1, 2, 3, 4, 5]; // List
  Map<String, dynamic> person = {'name': 'Alice', 'age': 30}; // Map
  Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'}; // Set
  var inferredType = "I am a string"; // var with type inference
  dynamic flexibleType = 10; // dynamic
  const double pi = 3.14; // const
  final String finalName = "Charlie"; // final

  print(greeting);
  print("Age: $age, Height: $height, Student: $isStudent");
  print("Numbers: $numbers");
  print("Person: $person");
  print("Unique Names: $uniqueNames");
  print("Inferred Type: $inferredType");
  print("Flexible Type: $flexibleType");
  print("Pi: $pi");
  print("Final Name: $finalName");
}