// Dart Variables Example
// String: For storing text value. E.g. “John” [Must be in quotes]
// int: For storing integer value. E.g. 10, -10, 8555 [Decimal is not included]
// double: For storing floating point values. E.g. 10.0, -10.2, 85.698 [Decimal is included]
// num: For storing any type of number. E.g. 10, 20.2, -20 [both int and double]
// bool: For storing true or false. E.g. true, false [Only stores true or false values]
// var: For storing any value. E.g. ‘Bimal’, 12, ‘z’, true
// const: For storing constant values. E.g. pi = 3.14 [Value cannot be changed]
// final: For storing single-assignment values. E.g. final String name = ‘John’ [Value can be assigned only once]

//  lowerCamelCase. Example: firstName, lastName, fullName, age, isStudent


void main() {
  String name = "Alice"; // Variable declaration
  int age = 30; // Integer variable
  double height = 5.7; // Double variable
  bool isStudent = false; // Boolean variable
  var city = "New York"; // Inferred type variable
  const String country = "USA"; // Constant variable
  final String profession; // Final variable
  profession = "Engineer"; // Assigning value to final variable

  print("Name: $name, Age: $age, Height: $height, Student: $isStudent, City: $city, Country: $country, Profession: $profession");
}
