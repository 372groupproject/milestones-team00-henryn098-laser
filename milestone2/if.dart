/*This is an example program of if statements
in Dart.
*/
main(){
  print("passing x into the same function twice \n"
   +    " as true, then false");
   bool x = true;
   ifElseExample(x);
   x = false;
   ifElseExample(x);
   print("passing x into the version without an else");   
   ifExample(x==false);//notice expressions can be passed in
}

//if else example
ifElseExample(bool x){
  if(x){
    print("x is true");
  }else{
    print("x is false");
  }
}

//the else is not necessary for syntax
ifExample(bool x){
  if(x){
    print("x is true");
  }
}