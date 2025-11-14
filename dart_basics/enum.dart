//  enum is the special class that represents a group of constants (unchangeable variables).
//  Enums are used when we have a fixed set of related constants. 
//  Enums improve code readability and maintainability by providing meaningful names to these constants.
//  In Dart, enums are defined using the `enum` keyword followed by the name of the enum and a list of constant values enclosed in curly braces.
//  Each constant in an enum is implicitly assigned an index starting from 0.
enum Day {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}
void main() {
  // Accessing enum values
  Day today = Day.Wednesday;

  // Printing the enum value and its index
  print('Today is: $today'); // Output: Today is: Day.Wednesday
  print('Index of today: ${today.index}'); // Output: Index of today: 2

  // Using enum in a switch statement
  switch (today) {
    case Day.Monday:
      print('Start of the work week!');
      break;
    case Day.Wednesday:
      print('Midweek day!');
      break;
    case Day.Friday:
      print('Last workday of the week!');
      break;
    case Day.Saturday:
    case Day.Sunday:
      print('It\'s the weekend!');
      break;
    default:
      print('Just another day.');
  }
  // Days.values: It returns all the values of the enum.
  for (Days day in Days.values) {
    print(day);
  }
  CompanyType soleProprietorship = CompanyType.soleProprietorship;
  print(soleProprietorship.text);
}

enum Days { Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday }

enum CompanyType {
  soleProprietorship("Sole Proprietorship"),
  partnership("Partnership"),
  corporation("Corporation"),
  limitedLiabilityCompany("Limited Liability Company");

  // Members
  final String text;
  const CompanyType(this.text);
}

// this is in python likly from enum import Enum;  class Day(Enum):.


