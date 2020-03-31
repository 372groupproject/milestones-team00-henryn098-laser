/*an example of while and do while in dart*/
import 'dart:io';
main(){
  //these will act the same
  whileExample(5);
  doWhileExample(5);

  //while wont enter the loop
  whileExample(0);
  //do while enters once reguardless
  doWhileExample(0);
}

//an example of a while loop
whileExample(int x){
  print("while x > 0: counting down from x = $x:");
  while(x > 0){
    print("x =  $x");
    x-=1;
  }
  print("\n");
}

//an example of dart's do while syntax
doWhileExample(int x){
    print("Do while x > 0: counting down from x = $x:");
    do {
      print("x =  $x");
      x-=1;
    } while (x > 0);
    print("\n");
}