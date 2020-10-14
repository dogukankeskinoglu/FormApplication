import 'package:FireBaseForm/object_class/student.dart';
import 'package:FireBaseForm/object_class/teacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DbSingleton {
  static final DbSingleton _dbsingleton = DbSingleton._internal();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  List<String> hintListTeacher = [];
  List<String> hintListStudent = [];
  List<String> iconListTeacher = [];
  List<String> iconListStudent = [];
  List<bool> keyboardListTeacher = [];
  List<bool> keyboardListStudent = [];
  List<int> validatorNumberListTeacher = [];
  List<int> validatorNumberListStudent = [];

  factory DbSingleton() {
    return _dbsingleton;
  }

  DbSingleton._internal();

 

  void getHintTextInfo() async {
    DocumentSnapshot hintSnapShotTeacher =
        await _firestore.doc("database/hintTextFormFieldTeacherList").get();

    DocumentSnapshot hintSnapShotStudent =
        await _firestore.doc("database/hintTextFormFieldStudentList").get();

    Map<String, dynamic> mapDataTeacher = hintSnapShotTeacher.data();
    Map<String, dynamic> mapDataStudent = hintSnapShotStudent.data();
    print(mapDataTeacher["Liste"].length.toString());
    print(mapDataStudent["Liste"].length.toString());
    for (String hintText in mapDataTeacher["Liste"]) {
      hintListTeacher.add(hintText);
    }
    for (String hintText in mapDataStudent["Liste"]) {
      hintListStudent.add(hintText);
      //print(hintText);
    }
  }

  void getIconTextInfo() async {
    DocumentSnapshot iconSnapShotTeacher =
        await _firestore.doc("database/iconTextFormFieldTeacherList").get();

    DocumentSnapshot iconSnapShotStudent =
        await _firestore.doc("database/iconTextFormFieldStudentList").get();
    Map<String, dynamic> mapDataTeacher = iconSnapShotTeacher.data();
    Map<String, dynamic> mapDataStudent = iconSnapShotStudent.data();
    print(mapDataTeacher["Liste"].length.toString());
    print(mapDataStudent["Liste"].length.toString());

    for (String iconText in mapDataTeacher["Liste"]) {
      iconListTeacher.add(iconText);
    }

    for (String iconText in mapDataStudent["Liste"]) {
      iconListStudent.add(iconText);
      //print(iconText);
    }
  }

  void getisKeyboardTextInfo() async {
    DocumentSnapshot keyboardSnapShotTeacher = await _firestore
        .doc("database/isKeyboardTextFormFieldTeacherList")
        .get();
    DocumentSnapshot keyboardSnapShotStudent = await _firestore
        .doc("database/isKeyboardTextFormFieldStudentList")
        .get();

    Map<String, dynamic> mapDataTeacher = keyboardSnapShotTeacher.data();
    Map<String, dynamic> mapDataStudent = keyboardSnapShotStudent.data();
    print(mapDataTeacher["Liste"].length.toString());
    print(mapDataStudent["Liste"].length.toString());
    for (bool keyboardBool in mapDataTeacher["Liste"]) {
      keyboardListTeacher.add(keyboardBool);
    }
    for (bool keyboardBool in mapDataStudent["Liste"]) {
      keyboardListStudent.add(keyboardBool);
      //print(keyboardBool.toString());
    }
  }

  void getvalidatorTextInfo() async {
    DocumentSnapshot validatorSnapShot = await _firestore
        .doc("database/validatorNumberTextFormFieldTeacherList")
        .get();

    DocumentSnapshot validatorSnapShotStudent = await _firestore
        .doc("database/validatorNumberTextFormFieldStudentList")
        .get();

    Map<String, dynamic> mapDataTeacher = validatorSnapShot.data();
    Map<String, dynamic> mapDataStudent = validatorSnapShotStudent.data();
    print(mapDataTeacher["Liste"].length.toString());
    print(mapDataStudent["Liste"].length.toString());

    for (int validatorNumber in mapDataTeacher["Liste"]) {
      validatorNumberListTeacher.add(validatorNumber);
    }
    for (int validatorNumber in mapDataStudent["Liste"]) {
      validatorNumberListStudent.add(validatorNumber);
      //print(validatorNumber.toString());
    }
  }

  void addStudent(ctfList) {
    /*for (int i = 0; i < 8; i++) {
      print(ctfList[i].controller.text.toString());
    }*/
    Student ogr = new Student(
      "Student",
      ctfList[0].controller.text,
      ctfList[1].controller.text,
      int.parse(ctfList[2].controller.text),
      int.parse(ctfList[3].controller.text),
      ctfList[4].controller.text,
      ctfList[5].controller.text,
      ctfList[6].controller.text,
      int.parse(ctfList[7].controller.text),
    );
    print(ogr.toString());
    Map<String, dynamic> studentMap = ogr.toMap();

    String docID = _firestore.collection("users").doc().id;

    _firestore.doc("/users/$docID").set(studentMap);
  }

  void addTeacher(ctfList) {
    /*for (int i = 0; i < 8; i++) {
      print(ctfList[i].controller.text.toString());
    }*/
    Ogretmen ogr = new Ogretmen(
        "Teacher",
        ctfList[0].controller.text,
        ctfList[1].controller.text,
        ctfList[2].controller.text,
        ctfList[3].controller.text,
        int.parse(ctfList[4].controller.text),
        int.parse(ctfList[5].controller.text),
        ctfList[6].controller.text,
        ctfList[7].controller.text,
        double.parse(ctfList[8].controller.text));

    print(ogr.toString());
    Map<String, dynamic> teacherMap = ogr.toMap();

    String docID = _firestore.collection("users").doc().id;

    _firestore.doc("/users/$docID").set(teacherMap);
  }
}
