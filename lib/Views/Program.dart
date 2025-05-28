// import 'dart:io';

// int main() {
//   print("hello world");

//   // int a = 15;
//   // int b = 5;
//   // var c = 10;

//   // var div = a / b;

//   // print(div);

//   // print("fizz");

// PRINT FIZZBUZZ

//   // stdout.write("Enter Number : ");
//   // int number = int.parse(stdin.readLineSync()!);

//   // if (number % 3 == 0 && number % 5 == 0) {
//   //   print("FizzBuzz");
//   // } else if (number % 3 == 0) {
//   //   print("fizz");
//   // } else if (number % 5 == 0) {
//   //   print("Buzz");
//   // } else {
//   //   print("FizzBuzz");
//   // }

// DRAW PATTERN

//    int rows = 5;

//     for (int i = 1; i <= rows; i++) {
//         for (int j = 1; j <= i; j++) {
//             print("*");
//         }
//         print("\n");
//     }

//     return 0;
// }

// SORTING DATA IN LIST

import 'dart:io';

void bubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        // Swap elements
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  // Take input from the user
  stdout.write("Enter numbers separated by spaces: ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    List<int> numbers = input.split(' ').map(int.parse).toList();

    print("Original List: $numbers");
    bubbleSort(numbers);
    print("Sorted List: $numbers");
  } else {
    print("Invalid input! Please enter numbers.");
  }
}
