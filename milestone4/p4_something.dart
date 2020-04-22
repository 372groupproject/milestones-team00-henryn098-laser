import 'p4_classes2.dart';
import 'p4_interface.dart';
class StudentContainer implements Display{
  List<Student> studentList;

  StudentContainer(){
    studentList = [];
  }

  addStudent(Student student){
    studentList.add(student);
  }

  //this method must be implemented
  void displayGrades(){
    //sort by gpa
    studentList.sort((a,b) => a.gpa.compareTo(b.gpa)); //example of fat arrow
    print("GPA for students, highest to lowest:");
    for (Student student in studentList.reversed){
      //example of named parameter subroutine
      print("${student.firstName} ${student.lastName}: ${student.gpa}");
    }
  }

  //this method must be implemented
  void displayStudents(){
    //sort by firstname, then lastname
    studentList.sort((a,b) => a.firstName.compareTo(b.firstName));
    studentList.sort((a,b) => a.lastName.compareTo(b.lastName));
    print("names of students, A-Z (by last name)");
    for (Student student in studentList){
      print("${student.firstName} ${student.lastName}");
    }
  }

}

main(){
  StudentContainer students = populateContainer();
  print("calling a student object directly with dart's special \"call\" method");
  print("the call method is defined in the person class:");
  students.studentList[0]();
  print("");
  students.displayStudents();
  print("");
  students.displayGrades();
}


//this function populates a student container
//with data so it can be used to display how all
//the class examples come together
StudentContainer populateContainer(){
  StudentContainer students = new StudentContainer();
  students.addStudent(new Student("Rand", "Al'Thor", new DateTime.now(),
      {"Dance" : "A", "History" : "D", "Channeling": "B",
      "language" : "F"})  
  );
  students.addStudent(new Student("Mat", "Cauthon", new DateTime.now(),
    {"Dance" : "B", "History" : "F", "Channeling": "F",
    "language" : "C"})
  );
  students.addStudent(new Student("Egwene", "Al'Vere", new DateTime.now(),
    {"Dance" : "F", "History" : "A", "Channeling": "C",
    "language" : "D"})
  );
  students.addStudent(new Student("Nynaeve", "Al'Meara", new DateTime.now(),
    {"Dance" : "F", "History" : "A", "Channeling": "A",
    "language" : "A"})
  );
  students.addStudent(new Student("Elayne", "Trakand", new DateTime.now(),
    {"Dance" : "F", "History" : "B", "Channeling": "B",
    "language" : "B"})
  );
  return students;
}