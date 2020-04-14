/*dynamic types are types that are set at runtime
like python, not everything in dart has to have
a type declaration*/
main(){
  //to declare something with a dynamic type,
  //use the var keyword
  //the variable's type will be inferred at compile time
  var x;
  x = "hello";
  print(x);

  /*however it fails when you try to assign
  a value of a different type to it
  x = 1;
  print(x);
  */
  //dynamic is a different keyword, all types in
  //dart inherit from the dynamic type
  //dynamic type variables can be reassigned during runtime
  dynamic y = 1;
  y = "hello";
  print(y);
}