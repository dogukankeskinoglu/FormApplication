

import 'package:FireBaseForm/database/db.dart';
import 'package:FireBaseForm/object_class/textFormFieldGeneral.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbSingleton db = DbSingleton();
  final _snackBar = GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String snackBarMessage = "";
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  List<TextFormFieldGeneral> tfList;
  Size size;
  @override
  void initState() {
    
    super.initState();
    tfList = getTextFormFieldGeneralList();
    fireBaseAuth();
    if (_auth.currentUser != null) {
      _signOutFunction();
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    getStatusBarColor();
    return Scaffold(
      key: _snackBar,
      //resizeToAvoidBottomInset: false,
      body: buildBody() /* add child content here */,
    );
  }

  fireBaseAuth() {
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        print("User is currently signed out");
      } else {
        print("User sign in");
      }
    });
  }

  Stack buildBody() {
    return Stack(
      children: [getBackGroundImage(), bottomContainerAlign(size)],
    );
  }

  Container getBackGroundImage() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        "assets/images/school.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Align bottomContainerAlign(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: bottomContainer(size),
    );
  }

  Container bottomContainer(Size size) {
    return Container(
      width: size.width,
      height: size.height / 1.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
          color: Colors.white),
      child: bottomContainerColumn(),
    );
  }

  Widget bottomContainerColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTextFromField(tfList[0]),
        Divider(),
        getTextFromField(tfList[1]),
        Divider(),
        buildButtonRow(),

        /*RaisedButton(
          onPressed: _signOutFunction,
          child: Text("Çıkış yap"),
        )*/
      ],
    );
  }

  Widget getTextFromField(TextFormFieldGeneral tf) =>
      Padding(padding: EdgeInsets.all(8), child: tf.getTextFromFieldGeneral());

  Row buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getSignInContainer(false),
        getSignInContainer(true),
      ],
    );
  }

  Widget getSignInContainer(bool isSignIn) {
    return InkWell(
        child: Container(
          height: size.height / 10,
          width: size.width / 2.4,
          decoration: isSignIn
              ? getBoxDecorationSignIn()
              : getBoxDecorationForgotPassword(),
          child: isSignIn
              ? buttonRow(true, "SIGN IN", Icons.arrow_forward)
              : buttonRow(false, "FORGOT PASSWORD", Icons.arrow_back),
        ),
        onTap: isSignIn ? _signInFunction : _forgotPasswordFunction);
  }

  _signOutFunction() async {
    await _auth.signOut();
  }

  _signInFunction() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: tfList[0].controller.text,
          password: tfList[1].controller.text);
      print(tfList[0].controller.text);
      print(tfList[1].controller.text);

      //snackBarMessage = "Başarılı Şekilde Giriş Yapıldı";

      Navigator.pushNamed(context, "/Selected");
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        snackBarMessage = "Yazılan emaille kayıtlı kullanıcı yok";
        //print("No user found for that emial");
      } else if (e.code == "wrong-password") {
        snackBarMessage = "Yanlış Şifre";
        //print("Wrong password provided for that user.");
      }
    } finally {
      setState(() {});
      _snackBar.currentState
          .showSnackBar(SnackBar(content: Text(snackBarMessage)));
    }
  }

  void _forgotPasswordFunction() {
    _auth
        .sendPasswordResetEmail(email: tfList[0].controller.text)
        .then((value) => print("Başarılı Şekilde Yollandı"))
        .catchError((e) => print("$e hatası verdi"));
  }

  Row buttonRow(bool isSignIn, String text, IconData icon) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: isSignIn
            ? getSignInRow(text, icon)
            : getForgotPasswordRow(text, icon));
  }

  List<Widget> getSignInRow(String text, IconData icon) {
    return [
      Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      Icon(
        icon,
        color: Colors.white,
      ),
    ];
  }

  List<Widget> getForgotPasswordRow(String text, IconData icon) {
    return [
      Icon(
        icon,
        color: Colors.white,
      ),
      Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ];
  }

  BoxDecoration getBoxDecorationSignIn() {
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
        color: Colors.blue);
  }

  BoxDecoration getBoxDecorationForgotPassword() {
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Colors.blue);
  }

  TextFormFieldGeneral buildTextFormField(
      hintText, labelText, controller, isVisibles) {
    TextFormFieldGeneral tf = new TextFormFieldGeneral(
        hintText, labelText, controller,
        isVisible: isVisibles);
    print(tf.toString());
    return tf;
  }

  List<TextFormFieldGeneral> getTextFormFieldGeneralList() {
    List<TextFormFieldGeneral> tfList = [];
    tfList.add(
        buildTextFormField("Email", "Email Giriniz", controlleremail, false));
    tfList.add(
        buildTextFormField("Şifre", "Şifre Giriniz", controllerpassword, true));

    return tfList;
  }

  getStatusBarColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  }
}
