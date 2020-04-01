/*an example of switch case in Dart
*/
main(){
  print("calling a switch example with 1,2,blue");

  switchExample(1);
  switchExample(2);
  switchExample("blue");
}

//switch case throws an error if you do not break
//after the case. This can be caught allowing the case
//to fall through to the next one
switchExample(var x){//notice that x is a dynamically typed variable!
  switch (x) {
    case 1:
      print("one");
      break;
    case 1:
      print("uno");
      break;
    case 2:
      print("two");
      break;
    default:
      print("NaN");
  }
}