
// String? name = stdin.readLineSync(); // this line is used to take input from the user wait until user input
// print("Hello $name"); // this line is used to print the input from the user

import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  print("Enter your name (you have 5 seconds):");

  // Create a timer for the countdown
  int secondsLeft = 5;
  Timer? exitTimer;

  // Show countdown every second
  Timer countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (secondsLeft > 0) {
      print("${secondsLeft--}...");
    } else {
      print("\nTime's up! Exiting...");
      timer.cancel();
      exit(0);
    }
  });

  // Listen for user input asynchronously
  stdin.transform(utf8.decoder).transform(LineSplitter()).listen((line) {
    // Cancel timers once input is received
    countdownTimer.cancel();
    exitTimer?.cancel();

    if (line.trim().isEmpty) {
      print("No name entered.");
    } else {
      print("Hello, ${line.trim()}!");
    }

    exit(0); // Exit the program after processing input
  });
}
