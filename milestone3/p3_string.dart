/*an example of strings in dart, in dart, all
characters are strings, although single quotes
with a single character can be unicode translated
to an int, instead of an array containing one int
*/
main(){
  //types of string representation
  print('strings can use single quotes');
  print("or double quotes");
  print('''or triple single quotes''');
  
  //concatenation
  print("\n\nstrings can be added" +  " together with a +");
  print("or by having them consecutively" " in code");
  
  int x = 42;
  print('''\n\nyou can insert variable names into a string
  using the special escape character \$''');
  print('''for example, the string: \"\$x\"
  given a predefined value of x as 42, prints: $x''' );
  
  //what is a string really?
  String paragraph = '''in dart, strings are an array of
    characters, indexable, and convertable to their
    unicode representations''';
  print("\n\n" + paragraph);
  print("the previous paragraph at it's first index");
  String char = paragraph[0];
  print("paragraph[0] :: $char");
  print("and here is the unicode representation of");
  print("the first 10 characters");
  print(paragraph.substring(0,11).codeUnits);
  print("codeUnits, and length, are both fields contained");
  print("in the String object data type");

  
  //comparison and equality
  print(''' comparisons <,>,<=,>= are not defined for strings in dart
  this is a big failing, but it would be easy to write a function to compare
  them. equality, both value and reference are defined. == for value, 
  and identical(s1,s2) for object equality.''');
  String s1 = "hello";
  String s2 = "hello";
  print("hello == hello");
  print("hello" == "hello");
  print("when assigned to variables it still works");
  print(s1 == s2);
  print('''identical(x,y) is the object equality function
  interestingly, this still works for strings, because there is optimization
  that equal strings are the same object''');
  print(identical(s1,s2));
}