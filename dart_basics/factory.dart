// ===============================
// Logger class with simple factory constructor
class Logger {
  final String name;
  bool mute = false;

  // Private constructor
  Logger._internal(this.name);

  // Factory constructor
  factory Logger(String name) {
    return Logger._internal(name);
  }

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

// ===============================
// Person class with factory constructor from a Map
class Person {
  String firstName;
  String lastName;

  // Normal constructor
  Person(this.firstName, this.lastName);

  // Factory constructor that creates Person from a Map
  factory Person.fromMap(Map<String, Object> map) {
    final firstName = map['firstName'] as String;
    final lastName = map['lastName'] as String;
    return Person(firstName, lastName);
  }
}

// ===============================
// Singleton pattern using factory constructor
class Singleton {
  static final Singleton _instance = Singleton._internal();

  // Factory constructor returns the same instance every time
  factory Singleton() {
    return _instance;
  }

  // Private constructor
  Singleton._internal();
}

// ===============================
// Person class with caching (multiton) using factory constructor
class CachedPerson {
  final String name;

  // Private constructor
  CachedPerson._internal(this.name);

  // Cache to hold created instances
  static final Map<String, CachedPerson> _cache = <String, CachedPerson>{};

  // Factory constructor checks cache before creating new instance
  factory CachedPerson(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final person = CachedPerson._internal(name);
      _cache[name] = person;
      return person;
    }
  }
}
//The exclamation mark (!) after _cache[name] is called the null assertion operator in Dart. It tells the compiler:"I am sure this value is not null, so treat it as non-nullable."

// ===============================
// Main entry point to test all examples
void main() {
  // --- Testing Person with factory constructor from map ---
  final person1 = Person('John', 'Doe');
  final person2 = Person.fromMap({'firstName': 'Harry', 'lastName': 'Potter'});

  print("From normal constructor: ${person1.firstName} ${person1.lastName}");
  print("From factory constructor: ${person2.firstName} ${person2.lastName}");

  // --- Testing Logger ---
  var logger = Logger('UI');
  logger.log('Button clicked'); // prints

  var logger2 = Logger('UI');
  logger2.mute = true;
  logger2.log('Button clicked'); // won't print

  // --- Testing Singleton ---
  Singleton obj1 = Singleton();
  Singleton obj2 = Singleton();
  print("Singleton obj1 hashCode: ${obj1.hashCode}");
  print("Singleton obj2 hashCode: ${obj2.hashCode}"); // same as obj1

  // --- Testing CachedPerson (multiton) ---
  final cachedPerson1 = CachedPerson('John');
  final cachedPerson2 = CachedPerson('Harry');
  final cachedPerson3 = CachedPerson('John');

  print("CachedPerson1 name: ${cachedPerson1.name}, hashCode: ${cachedPerson1.hashCode}");
  print("CachedPerson2 name: ${cachedPerson2.name}, hashCode: ${cachedPerson2.hashCode}");
  print("CachedPerson3 name: ${cachedPerson3.name}, hashCode: ${cachedPerson3.hashCode}"); // same as cachedPerson1
}
// ===============================