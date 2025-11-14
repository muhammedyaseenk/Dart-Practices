// operators in Dart
void main() {
  int a = 10;
  int b = 20;

  // Arithmetic Operators
  print('a + b = ${a + b}'); // Addition
  print('a - b = ${a - b}'); // Subtraction
  print('a * b = ${a * b}'); // Multiplication
  print('b / a = ${b / a}'); // Division
  print('b % a = ${b % a}'); // Modulus

  // Relational Operators
  print('a > b: ${a > b}'); // Greater than
  print('a < b: ${a < b}'); // Less than
  print('a >= b: ${a >= b}'); // Greater than or equal to
  print('a <= b: ${a <= b}'); // Less than or equal to
  print('a == b: ${a == b}'); // Equal to
  print('a != b: ${a != b}'); // Not equal to

  // Logical Operators
  bool x = true;
  bool y = false;
  print('x && y: ${x && y}'); // Logical AND
  print('x || y: ${x || y}'); // Logical OR
  print('!x: ${!x}'); // Logical NOT

  // Assignment Operators
  int c = a; // Simple assignment
  c += b; // c = c + b
  print('c after += : $c');
  c -= a; // c = c - a
  print('c after -= : $c');
  c *= 2; // c = c * 2
  print('c after *= : $c');
  c ~/= 3; // c = c ~/ 3 (integer division)
  print('c after ~/= : $c');
}