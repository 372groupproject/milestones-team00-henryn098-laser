/*an example of a runtime error in dart,
dart calls them "unhandled exceptions"*/
main(){
  List<num> x = [0,1,2,3];
  for(int i = 0; i < 5; i++){
    print(x[i]);
  }
}