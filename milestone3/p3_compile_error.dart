/*a compile time error*/
main(){
  int x = 0;
  x = x + "oops";
  //cannot assign a string to an int
}