// Loops in Dart  
//  the loops are used to execute a block of code repeatedly until a certain condition is met.
// the three main types of loops in Dart are: for loop, while loop, and do-while loop.
//  the for loop is used when the number of iterations is known beforehand.
//  the while loop is used when the number of iterations is not known and depends on a
// Do while loop is similar to the while loop, but it guarantees that the block of code will be executed at least once before checking the condition. condition.
//  Here are examples of each type of loop in Dart:

// You only want the loop to run if the condition is true from the start.
// You want the loop to run at least once, even if the condition is false at first.

//            | Use case                      | Use this loop     |
//            | ----------------------------- | ----------------- |
//            | Run code *zero or more* times | `while` loop      |
//            | Run code *at least once*      | `do...while` loop |

import 'dart:async';

void main() {
  // for loop
  print("For Loop:");
  for (int i = 1; i <= 5; i++) {
    print(i);
  }

  // while loop
  print("\nWhile Loop:");
  int j = 1;
  while (j <= 5) {
    print(j);
    j++;
  }

  // do-while loop
  print("\nDo-While Loop:");
  int k = 1;
  do {
    print(k);
    k++;
  } while (k <= 5);

  exampleDoWhile();
  exampleRetryOperation();
  exampleLoopControl();
  exampleNestedLoops();
  exampleLoopThroughCollections();
  exampleAsynchronousLoop(); 
  // exampleInfiniteLoop();

}

//  example of the do while loop in dart that this example only can achieve in do while loop
void exampleDoWhile() {
  int number;
  do {
    number = 5; // Simulating user input
    print("You entered: $number");
  } while (number < 5);
}

//  DO while loop is used when you want to ensure that the block of code is executed at least once,
//  retrying an operation until success
void exampleRetryOperation() {
  bool operationSuccessful;
  int attempts = 0;
  do {
    attempts++;
    // Simulate an operation that has a 50% chance of succeeding
    operationSuccessful = (attempts % 2 == 0);
    print("Attempt $attempts: Operation " +
        (operationSuccessful ? "succeeded" : "failed"));
  } while (!operationSuccessful && attempts < 5);
}

// Loop control keywords (break, continue)
void exampleLoopControl() {
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      break; // Exit the loop when i is 5
    }
    if (i % 2 == 0) {
      continue; // Skip even numbers
    }
    print(i);
  }
}

// Nested loops
void exampleNestedLoops() {
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print("i: $i, j: $j");
    }
  }
}

// Looping through collections like lists or maps
void exampleLoopThroughCollections() {
  List<String> fruits = ["Apple", "Banana", "Cherry"];
  for (String fruit in fruits) {
    print(fruit);
  }

  Map<String, int> fruitPrices = {
    "Apple": 2,
    "Banana": 1,
    "Cherry": 3
  };
  fruitPrices.forEach((fruit, price) {
    print("$fruit: \$$price");
  });
}

// Asynchronous loops (like await for)
//  Asynchronous loops are used to handle asynchronous operations in Dart, allowing you to work with streams of data or perform tasks that may take time to complete without blocking the main thread.
void exampleAsynchronousLoop() async {
  Stream<int> numberStream = Stream<int>.periodic(
      Duration(seconds: 1), (count) => count).take(5);
  await for (int number in numberStream) {
    print("Received number: $number");
  }
}