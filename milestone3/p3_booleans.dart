main(){
  //the only instances of booleans, denoted by
  // the "bool" keyword, are true and false
  //any non literal will yeild a false value
  //and raise a compilation error
  print(true == true);
  //lt,gt, comparators are not defined for bool
  print(1 == true);
  print(1 == false);
  /* not even a try,catch can save you from trying to ask if 1 is true
  try {
    if (1){
      print("1 was evaluated to true");
    }
  } catch (e) {
    print("unlike C only booleans are true or false");
  }
  */
}