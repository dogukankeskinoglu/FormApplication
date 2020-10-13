import 'package:FireBaseForm/object_class/person.dart';

class Ogretmen extends Person {
  String lessonName;
  double salary;

  Ogretmen(
      String tip,
      String name,
      String surname,
      String birthDate,
      String email,
      int identificationNumber,
      int telephoneNumber,
      this.lessonName,
      String gender,
      this.salary)
      : super(tip, name, surname, telephoneNumber, identificationNumber, gender,
            birthDate, email);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> teacherMap = new Map<String, dynamic>();

    teacherMap["tip"] = tip;
    teacherMap["name"] = name;
    teacherMap["surname"] = surname;
    teacherMap["telephoneNumber"] = telephoneNumber;
    teacherMap["identificationNumber"] = identificationNumber;
    teacherMap["gender"] = gender;
    teacherMap["birthDate"] = birthDate;
    teacherMap["email"] = email;
    teacherMap["lessonName"] = lessonName;
    teacherMap["salary"] = salary;

    return teacherMap;
  }

  @override
  String toString() {
    
    return "$name $surname $telephoneNumber $identificationNumber $gender $birthDate $email $lessonName $salary";
  }
}
