/*numbers are literals in dart which come in two types
integer, and double*/
main(){
  /*integers are not actually primitive in dart*/
  //they have methods
  double x = 5.toDouble();
  print(x);
  //and fields
  print(5.isEven);
  //and adding them to a double yeilds a double
  print(5+0.0);
  
  //similarly, doubles are not primitive
  //they have methods and fields
  print(5.5.truncate());
  print(5.5.isInfinite);
  //you still can't just add them to a string
  //(failing)
  /*
  print(5 + "string");
  */
}
/*it should be becoming clear that dart is
entirely object oriented. Even the most primitive values
are actually classes*/
