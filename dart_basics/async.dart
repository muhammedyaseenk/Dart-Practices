//  the async and await keywords in Dart.
//  They are used to handle asynchronous operations in a more readable and manageable way compared to traditional callback-based approaches.

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for jsonDecode

// Simulating a network call with a delay
Future<String> fetchData() async {
  // Simulate a 2-second delay
  await Future.delayed(Duration(seconds: 2));
  return "Data fetched from server";
}

// Another async function simulating fetching a user's name
Future<String> getUserName() async {
  // Simulate a 2-second delay then return a string
  return await Future.delayed(Duration(seconds: 2), () => 'Mark');
}

// A middle function that returns a delayed future
Future<String> middleFunction() {
  // Simulate a 5-second delay then return a string
  return Future.delayed(Duration(seconds: 5), () => "Hello from middleFunction");
}

// Function demonstrating awaiting another async function
Future<void> getData() async {
  // Await result from middleFunction and print it
  String data = await middleFunction();
  print(data);
}

// example api call in dart with async and await
Future<void> fetchApiData() async {
  // Send a GET request to the fake API
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  // If successful, decode JSON and print the title
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    print("Title: ${jsonResponse['title']}");
  } else {
    // Handle error
    print("Request failed with status: ${response.statusCode}.");
  }
}

// Main function using async/await
Future<void> main() async {
  print("Start");

  // Await simulated fetchData() call
  String result1 = await fetchData();
  print(result1);

  // This will run asynchronously without blocking
  getData();

  print("Fetching data...");

  // Await second simulated fetchData() call
  String result2 = await fetchData();
  print(result2);

  // Await getUserName() function
  String userName = await getUserName();
  print("User Name: $userName");

  // Make actual API call
  await fetchApiData();

  print("End");
}

// Future is a core class in Dart's asynchronous programming model. 
// It represents a computation that will complete at some point in the future, 
// either with a value or with an error. 
// Futures are used to handle operations that take time to complete, 
// such as network requests, file I/O, or any other asynchronous tasks.
// A Future can be in one of three states:
