// conditions in dart, if, else if, else, switch case
void main() {
  int number = 10;
  exampleLoopControl();
  exampleTryCatch();
  // if-else statement
  if (number > 0) {
    print('$number is a positive number.');
  } else if (number < 0) {
    print('$number is a negative number.');
  } else {
    print('The number is zero.');
  }

  // switch-case statement
  String day = 'Monday';
  switch (day) {
    case 'Monday':
      print('Start of the work week.');
      break;
    case 'Wednesday':
      print('Midweek day.');
      break;
    case 'Friday':
      print('End of the work week.');
      break;
    default:
      print('Just another day.');
  }
}

// break and continue statements in loops
void exampleLoopControl() {
  print("\nLoop Control Example:");
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print("Skipping number 5");
      continue; // Skip the rest of the loop when i is 5
    }
    if (i == 8) {
      print("Stopping the loop at number 8");
      break; // Exit the loop when i is 8
    }
    print(i);
  }}

void exampleTryCatch() {   
   int a = 18;   
   int b = 0;   
   int res;    
     
   try {    
    //  ~ the symbol is bitwise NOT operator only works with int values. 
    // print(~d); // ❌ Error: The operator '~' isn't defined for type 'double'.

    //  ~/ the symbol is integer division operator 
      res = a ~/ b;
      print("Result is $res");   
   }    
    // It returns the built-in exception related to the occurring exception  
   catch(ex) {   
      print(ex);   
    }   
}  