import 'p4_classes.dart';

//in dart, a mixin is a class of functions which can be
//implemented in multiple classes using the "with" keyword
//it allows for orthogonal, backwards, and multiple inheritance
mixin ConvertGrade {
  num letterToGpa(String grade){
    switch (grade) {
        case "A":
          return 4;
          break;
        case "B":
          return 3;
          break;
        case "C":
          return 2;
          break;
        case "D":
          return 1;
          break;
        default:
          return 0;
    }
  }

  //some other function, there can be many
  void someFunc(){;}
}

//an example of a class which inherits from the person class
class Student extends Person with ConvertGrade{
  Map<String,String> gradeMap;
  //constructor is of the form constructor() : fields, super();

  Student(String newFirstName, String newLastName, 
    DateTime birthday, Map<String,String> newGrades) :
    gradeMap = newGrades,
    super(newFirstName, newLastName, birthday);

  Map<String,String> get grades{
    return gradeMap;
  }

  num get gpa {
    int count = 0;
    num sum = 0;
    for (String subject in grades.keys){
      sum += letterToGpa(grades[subject]);
      count++;
    }
    return sum/count;
  }
}