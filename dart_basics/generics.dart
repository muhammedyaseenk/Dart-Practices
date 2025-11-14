// generic are the way to create reusable code that can work with different data types

// Without Generics
// Creating a class for int
class IntData {
  int data;
  IntData(this.data);
}
// Creating a class for double
class DoubleData {
  double data;
  DoubleData(this.data);
}

// Generic class example
class Data<T> {
  T data;
  Data(this.data);
}

// Generic method example
T genericMethod<T>(T value) {
  return value;
}

// Generic class with type restriction
class NumberData<T extends num> {
  T data;
  NumberData(this.data);
}

// Abstract class for Shape example
abstract class Shape {
  double get area;
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);

  @override
  double get area => 3.14 * radius * radius;
}

class Rectangle implements Shape {
  final double width, height;
  Rectangle(this.width, this.height);

  @override
  double get area => width * height;
}

// Generic class working with Shape and subclasses
class Region<T extends Shape> {
  List<T> shapes;
  Region({required this.shapes});

  double get totalArea => shapes.fold(0, (sum, shape) => sum + shape.area);
}

void main() {
  // Non-generic classes
  IntData intData = IntData(10);
  DoubleData doubleData = DoubleData(10.5);
  print("Without Generics:");
  print("IntData: ${intData.data}");
  print("DoubleData: ${doubleData.data}");

  // Using generic class Data<T>
  Data<int> genericIntData = Data<int>(10);
  Data<String> genericStringData = Data<String>("Hello");
  print("\nGeneric class:");
  print(genericIntData.data);    // 10
  print(genericStringData.data); // Hello

  // Using generic method
  print("\nGeneric method:");
  print(genericMethod<int>(123));       // 123
  print(genericMethod<String>("World")); // World

  // Using generic class with restriction
  NumberData<int> numInt = NumberData<int>(100);
  NumberData<double> numDouble = NumberData<double>(99.9);
  print("\nGeneric class with type restriction:");
  print(numInt.data);     // 100
  print(numDouble.data);  // 99.9

  // Using generic class with Shape subclasses
  var circle = Circle(10);
  var rectangle = Rectangle(10, 20);
  var region = Region(shapes: [circle, rectangle]);
  print("\nTotal area of region:");
  print(region.totalArea); // ~514
}
