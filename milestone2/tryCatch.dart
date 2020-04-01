/*an example of basic error handling in dart*/
main(){
  print("about to call a function which divides by zero");
  catchError();
}

//why is this not printing e? 
catchError(){
  try {
    42/0;
  }on IntegerDivisionByZeroException catch(e) {
    print(e);
  }finally{
    print("and the program keeps running");
  }
}