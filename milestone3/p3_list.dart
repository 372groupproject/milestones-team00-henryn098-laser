/*arrays in dart are also used only by their class methods
the data type (class) is List*/
main(){
  //because list is a class of objects,
  //they have several properties, including
  //first, last, length, reversed
  List<int> list = [];
  for (int i = 0; i < 10; i++){
    list.add(i);
  }
  print(list);
  print(list.reversed);//returns an iterable, not a list

  //as well as dozens of useful built in methods
  list.removeRange(3,5);
  print(list);

  //one thing to note (a failing?)
  //some lists are fixed size and some are not
  //and you have to check the constructor documentation
  ///for example
  List<int> a = new List(5);
  //is an fixed size, and will throw errors when you
  //try to add to it

  List<int> b = [];
  //is a variable size list
}