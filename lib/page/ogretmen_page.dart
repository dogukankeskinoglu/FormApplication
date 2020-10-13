import 'package:FireBaseForm/database/db.dart';

import 'package:FireBaseForm/object_class/textFormField.dart';
import 'package:FireBaseForm/widget/appBar.dart';
import 'package:FireBaseForm/widget/bodyContainer.dart';

import "package:flutter/material.dart";


class OgretmenPage extends StatefulWidget {
  @override
  _OgretmenPageState createState() => _OgretmenPageState();
}

class _OgretmenPageState extends State<OgretmenPage> {
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
      appBar: getAppBar("Ogretmen Kayıt Sayfası"),
      body: getBodyContainer(_formKey, ctfList, tfList),
    );
  }

  Widget savedButton() {
    return FloatingActionButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
         db.addTeacher(ctfList);
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
    for (int i = 0; i < db.hintListTeacher.length; i++) {
      TextEditingController controller = TextEditingController();
      print(db.iconListTeacher[i]);

      CustomTextFormField cttf = new CustomTextFormField(
          db.hintListTeacher[i],
          db.hintListTeacher[i],
          controller,
          IconData(int.parse(db.iconListTeacher[i]), fontFamily: 'MaterialIcons'),
          db.keyboardListTeacher[i],
          db.validatorNumberListTeacher[i]);
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
