import 'package:FireBaseForm/database/db.dart';

import 'package:FireBaseForm/object_class/textFormField.dart';
import 'package:FireBaseForm/widget/appBar.dart';
import 'package:FireBaseForm/widget/bodyContainer.dart';
import 'package:flutter/material.dart';


class OgrenciPage extends StatefulWidget {
  @override
  _OgrenciPageState createState() => _OgrenciPageState();
}

class _OgrenciPageState extends State<OgrenciPage> {
  final _formKey = GlobalKey<FormState>();
  final _snackBar = GlobalKey<ScaffoldState>();
  String msj = "";
  DbSingleton db = DbSingleton();
  List<CustomTextFormField> ctfList;
  List<Widget> tfList;
  

  @override
  void initState() {
    
    super.initState();
    ctfList = getCustomTextFormFieldList();
  }

  @override
  Widget build(BuildContext context) {
    tfList = getTextFormFieldList();
    return Scaffold(
      floatingActionButton: savedButton(),
      key: _snackBar,
      resizeToAvoidBottomInset: false,
      appBar: getAppBar("Öğrenci Kayıt Sayfası"),
      body: getBodyContainer(_formKey, ctfList, tfList),
    );
  }

  Widget savedButton() {
    return FloatingActionButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          db.addStudent(ctfList);
          msj = "Başarılı şekilde eklendi";
          ctfList = getCustomTextFormFieldList();
        } else {
          msj = "Lütfen istenilen formatta giriniz";
        }
        setState(() {});
        _snackBar.currentState.showSnackBar(SnackBar(content: Text(msj)));
      },
      child: Icon(Icons.save),
    );
  }

  Form getForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(children: tfList),
      ),
    );
  }

  List<CustomTextFormField> getCustomTextFormFieldList() {
    List<CustomTextFormField> textFormFieldList = [];
    for (int i = 0; i < db.hintListStudent.length; i++) {
      TextEditingController controller = TextEditingController();
      print(db.iconListTeacher[i]);

      CustomTextFormField cttf = new CustomTextFormField(
          db.hintListStudent[i],
          db.hintListStudent[i],
          controller,
          IconData(int.parse(db.iconListStudent[i]),
              fontFamily: 'MaterialIcons'),
          db.keyboardListStudent[i],
          db.validatorNumberListStudent[i]);
      textFormFieldList.add(cttf);
    }
    return textFormFieldList;
  }

  List<Widget> getTextFormFieldList() {
    List<Widget> tffl = [];

    for (CustomTextFormField customText in ctfList) {
      tffl.add(customText.getTextFormField());
    }

    return tffl;
  }

  
}
