//  Data collection in Dart 
//  they are List, Set, Map, 
//  and Runes (for Unicode characters).
//  List is a collection of ordered elements. List <variable_type> variable_name = [];
//  Set is a collection of unique elements. Set <variable_type> variable_name = {};
//  Map is a collection of key-value pairs. Map <key_type, value_type> variable_name = {};
//  Runes is a collection of Unicode characters.
// where <variable_type> can be int, double, String, bool, dynamic, etc.

// Iterable<E> where(
// bool test(
// E element
// )
// ) // the function returns an iterable containing all elements that satisfy the given predicate. 
// where E is the type of elements in the collection.

// Integer List
List<int> ages = [10, 30, 23];

// String List
List<String> names = ["Raj", "John", "Rocky"];

// Mixed List
var mixed = [10, "John", 18.8];


filterEvenNumbers(List<int> numbers) {
  return numbers.where((number) => number % 2 == 0);
}


void main() {
  filterEvenNumbers(ages).forEach((age) => print(age));
  filterEvenNumbers([1, 2, 3, 4, 5, 6]).forEach((age) => print(age));

   // String List
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  // Using `where` to filter days that start with 'S'
  List<String> startWithS =
      days.where((element) => element.startsWith("S")).toList();

  print("Days starting with 'S': $startWithS");
  // List
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);

  // Set
  Set<String> fruits = {'apple', 'banana', 'orange'};
  print(fruits);

  // Map
  Map<String, int> personages = {'Alice': 25, 'Bob': 30, 'Charlie': 35};
  print(personages);

  // Runes (for Unicode characters like emojis)
  Runes runes = Runes(
    '\u{1F600}\u{1F611}\u{1F601}\u{1F612}\u{1F613}'
    '\u{1F614}\u{1F615}\u{1F616}\u{1F617}\u{1F618}'
    '\u{1F619}'
  );

  print(String.fromCharCodes(runes));
}

