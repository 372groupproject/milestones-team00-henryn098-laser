/*since dart has as many types as you need, and lets
you create new ones on a whim, This program will 
demonstrate that you can create a new data type
and use it with all the more basic types covered*/

import 'dart:io';
class Counter{
  num totalCount = 0;
  Map countMap = new Map();

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
  Counter wordCounter = new Counter();
  Counter letterCounter = new Counter();

  updateCounters(String input){
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
  print('''TYPE SENTENCES, AND I WILL KEEP TRACK OF THE WORDS,
  TYPE A SINGLE WORD TO SEE MORE DETAILED STATS
  TYPE /QUIT TO QUIT!!!''');
  TypingTracker tt = new TypingTracker();
  String s = "";
  while(s!="/quit"){
    s = stdin.readLineSync();
    if(!s.contains(' ') || s == ' '){
      tt.printWordStats(s);
    }
    else{
      tt.updateCounters(s);
      tt.printStats();
    }
  }
  print("THANK YOU FOR YOUR KIND WORDS");
  
}