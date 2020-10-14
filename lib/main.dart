import 'package:FireBaseForm/database/db.dart';
import 'package:FireBaseForm/page/home_page.dart';
import 'package:FireBaseForm/page/selection_page.dart';
import 'package:FireBaseForm/page/ogrenci_page.dart';
import 'package:FireBaseForm/page/ogretmen_page.dart';

import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';

void main() async {
  DbSingleton db = DbSingleton();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  db.getHintTextInfo();
  db.getIconTextInfo();
  db.getvalidatorTextInfo();
  db.getisKeyboardTextInfo();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        "/": (context) => HomePage(),
        "/Selected": (context) => SelectionPage(),
        "/Ogretmen": (context) => OgretmenPage(),
        "/Ogrenci": (context) => OgrenciPage(),
      },
    );
  }
}
