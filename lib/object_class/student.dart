import 'package:FireBaseForm/object_class/person.dart';

class Student extends Person {
  int classNo;

  Student(
      String tip,
      String name,
      String surname,
      int telephoneNumber,
      int identificationNumber,
      String gender,
      String birthDate,
      String email,
      this.classNo)
      : super(tip, name, surname, telephoneNumber, identificationNumber, gender,
            birthDate, email);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> studentMap = new Map<String, dynamic>();

    studentMap["tip"] = tip;
    studentMap["name"] = name;
    studentMap["surname"] = surname;
    studentMap["telephoneNumber"] = telephoneNumber;
    studentMap["identificationNumber"] = identificationNumber;
    studentMap["gender"] = gender;
    studentMap["birthDate"] = birthDate;
    studentMap["email"] = email;
    studentMap["classNo"] = classNo;

    return studentMap;
  }

  @override
  String toString() {
    
    return "$tip $name $surname $telephoneNumber $identificationNumber $gender $birthDate $email $classNo";
  }
}
