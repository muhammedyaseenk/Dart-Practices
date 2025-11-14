// Null Safety in Dart,
// Type Promotion in Dart,
// Late Keyword in Dart, and
// Null Safety Exercise.


class Person {
  // late variable
  late String name;

  void greet() {
    print("Hello $name");
  }
}


// null safety is a feature in Dart that helps prevent null reference errors by distinguishing between nullable and non-nullable types. This means that variables cannot contain null unless explicitly declared as nullable using the '?' operator.
void main() {
  // Non-nullable variable
  int a = 5;
  // a = null; // This will cause a compile-time error

  // Nullable variable
  int? b = null;
  b = 10; // This is allowed

  // Type promotion example
  String? name;
  if (name != null) {
    // Inside this block, 'name' is promoted to non-nullable
    print(name.length); // Safe to access length
  }

  // Late keyword example
  late String description;
  description = "This is a late initialized variable.";
  print(description); // Safe to access after initialization

  // Null safety exercise
  String? nullableString = "Hello, Dart!";
  print(nullableString?.toUpperCase()); // Safe access using '?'

   Person person = Person();
  // late variable is initialized here
  person.name = "John";
  person.greet();
}