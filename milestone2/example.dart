/*this is a small example program which
uses a combination of dart specific control structures
to show the basic flow of the logic in the language

it is based on an introductory first year
programming assignment called "guess the number"
*/

import 'dart:io';
import 'dart:math';//for random

int MAX = 10;
int MIN = 1;
main(){
    print("In this game you will guess " +
      "a number between $MAX and $MIN inclusive");
    Random rng = new Random();

    print("I'm thinking of a number... time to guess!");
    int randNum = rng.nextInt(MAX+1);
    print(getInput());
}

/*getInput
takes a min and a max
returns an integer from stdin
prompts the user for an integer, and
provides an error message until a valid guess
is made. A valid guess is an int between
min and max inclusive
*/
int getInput(){
  String input;
  int numInput = MIN-1;
  String error = "please enter a number bewteen "+
            "$MIN and $MAX";

  bool valid = false;
  while (!valid){
    print("guess?:");
    input = stdin.readLineSync();
    try {//try to convert to an integer
      numInput = int.parse(input);
    } on FormatException{
      print(error);
      continue;
    }
    if (numInput >= MIN && numInput <= MAX){
      valid = true;
    }
    else{
      print(error);
    }
  }
  return numInput;
}

bool gameOver(int target, int guess){
  if (guess < target){
    print("the number is higher")
  }
}

