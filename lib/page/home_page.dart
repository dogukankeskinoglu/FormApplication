import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyColumn(context),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("Dershane Sistemine Hoşgeldiniz"),
    );
  }

  Column bodyColumn(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        expandedRow(context),
      ],
    );
  }

  Row expandedRow(BuildContext context) {
    return Row(
      children: [
        selectedPage(
            context, "/Ogrenci", "assets/images/student.png", "Öğrenci Kayıt"),
        Spacer(
          flex: 2,
        ),
        selectedPage(context, "/Ogretmen", "assets/images/teacher.png",
            "Öğretmen Kayıt"),
      ],
    );
  }

  Expanded selectedPage(
      BuildContext context, String pageName, String imgsrc, String text) {
    return Expanded(
      flex: 10,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, pageName),
        child: Container(
          child: Column(
            children: [
              Image.asset(
                imgsrc,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
