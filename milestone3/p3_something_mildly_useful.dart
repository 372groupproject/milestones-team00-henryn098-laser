/*since dart has as many types as you need, and lets
you create new ones on a whim, This program will 
demonstrate that you can create a new data type
and use it with all the more basic types covered

dart has dozens of types, not even including libraries not included in the core*/

import 'dart:io';

//a new object type, counter
class Counter{
  //has fields
  num totalCount = 0;
  Map countMap = new Map();

  //and methods

  //updates the count of items recieved in lists
  updateCount(String s){
    totalCount++;//add nums
    //update maps
    if (countMap[s] == null){
      countMap[s] = 1;
    }else{
      countMap[s] = countMap[s]+1;
    }
  }

  //getter for the fields
  num getTotalCount(){
    return totalCount;
  }
  //returns the count val associated with string s
  num getCount(String s){
    return countMap[s];
  }
}

class TypingTracker{
  //uses two counters to keep track of different string types
  Counter wordCounter = new Counter();
  Counter letterCounter = new Counter();

  updateCounters(String input){
    //counts the string types
    List inputList = input.split(' ');
    for (String word in inputList){
      wordCounter.updateCount(word);

      var curr; //use dynamic var
      //iterate over lists
      for (int i = 0; i < word.length; i++){
        letterCounter.updateCount(word[i]); //index into string
      }
    }
  }

  printStats(){
    //prints total words and total letters,
    // calls methods from the counter class
    print("total words typed so far:");
    print(wordCounter.getTotalCount());
    print("total letters typed so far:");
    print(letterCounter.getTotalCount());
  }

  //returns zero if arg is null, else returns arg
  int nullToZero(var x){
    if(x == null){
      return 0;
    }
    else{
      return x;
    }
  }

  printWordStats(String word){
    //prints stats about how many times a word has appeared,
    //and how many of each of the letters in that word have appeared
    var count;
    count = nullToZero(wordCounter.getCount(word));
    print("$word has appeared $count times");
    print("its letters have appeared these many times: ");
    for(int i = 0; i < word.length; i++){
      String letter = word[i];
      count = nullToZero(letterCounter.getCount(letter));
      print("$letter : $count");
    }
  }
}

main(){
  //user instructions
  print('''TYPE SENTENCES, AND I WILL KEEP TRACK OF THE WORDS,
  TYPE A SINGLE WORD TO SEE MORE DETAILED STATS
  TYPE /QUIT TO QUIT!!!''');

  //tick type game engine
  TypingTracker tt = new TypingTracker();
  String s = "";
  while(s!="/quit"){
    s = stdin.readLineSync();
    //check for single word, for stat display
    if(!s.contains(' ') || s == ' '){
      tt.printWordStats(s);
    }
    else{
      //updates counters
      //displays current stats
      tt.updateCounters(s);
      tt.printStats();
    }
  }
  //quit
  print("THANK YOU FOR YOUR KIND WORDS");
  
}