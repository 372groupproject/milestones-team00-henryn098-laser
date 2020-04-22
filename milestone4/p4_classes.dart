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

  get age{
    return DateTime.now().difference(birthday).inDays/365;
  }

  String get name{
    return firstName + " " + lastName;
  }
}