//an example of a class in dart
class Person{
  String firstName;
  String lastName;
  DateTime birthday;
  //constructor for person
  //takes 2 strings, first and last name
  //and the year of birth
  Person(String newFirstName, String newLastName,
         DateTime birthday){
    this.firstName = newFirstName;
    this.lastName = newLastName;
    this.birthday = birthday;
  }

  //the call method is a special method in dart
  //when this class, or any of its subclass objects are called directly
  //ie studentObject()
  //it will print this statement
  call(){
    print("This is a person");
  }

  get age{
    return DateTime.now().difference(birthday).inDays/365;
  }

  String get name{
    return firstName + " " + lastName;
  }
}