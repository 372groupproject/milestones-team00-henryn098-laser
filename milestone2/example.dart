/*this is a small example program which
uses a combination of dart control structures
to show the basic flow of the logic in the language

If you are familiar with java and c style control
then this will look extremely familliar

it is based on an introductory first year
programming assignment called "guess the number"
*/

import 'dart:io';
import 'dart:math';//for random

//max and min guesses, inclusive
int MAX = 10;
int MIN = 1;
main(){
    print("In this game you will guess " +
          "a number between" +
          "\n$MIN and $MAX inclusive");
    Random rng = new Random();
    int guess;
    int target;
    bool gameIsOver;

    do{
      gameIsOver = false;
      print("I'm thinking of a number... time to guess!");
      target = rng.nextInt(MAX) + 1;
      while (!gameIsOver){
        guess = getInput();
        gameIsOver = gameOver(target, guess);
      }
    }while(!quitGame());
    print("goodbye!");
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
    //check if num in range
    /*the following code is equivalent to
    if (numInput >= MIN && numInput <= MAX){
      valid = true;
      else {
        print(error);
      }
      */
    //for loop example of above:
    for (int i = MIN; i < Max+1; i++){
      if (numInput == i){
        valid = true;
      }
    }
    if (valid == false){
      print(error);
    }
    //end obfuscated code example
  }
  return numInput;
}

///takes int target and int guess,
///the target number and the user's guess
///lets the user know if the target is higher or lower
///returns true if the number has been guessed, else false*/
bool gameOver(int target, int guess){
  if (guess < target){
    print("the number is higher");
  }else if (guess > target){
    print("the number is lower");
  }else{
    print("you got it, you're so clever!");
    return true;
  }
  return false;
}

//quitGame
//takes no inputs, and returns a boolean
//uses stdin to ask the user if they would like to quit
//returns true if they want to quit
//else false
//calls itself on invalid input
bool quitGame(){
  print("do you want to play again? y/n");
  String input = stdin.readLineSync();
  switch (input) {
    case "y":
      return false;
    case "n":
      return true;
    default:
      return quitGame();
  }
}
