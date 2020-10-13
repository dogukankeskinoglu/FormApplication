import 'package:FireBaseForm/controller/controller.dart';
import 'package:flutter/material.dart';

Widget getTextFormField(
  String hintText, {
  IconData icon = Icons.adjust,
  bool isKeyBoardString = true,
  validatorNumber = 0,
  String labelText = "",
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      validator: (value) => textValidator(validatorNumber, value),
      /* onChanged: (value) {
        if ((value.length % 4 == 2 || value.length % 4 == 0) &&
            value.length != 0) {
          controller.text = "5";
        }
      },*/
    
      keyboardType:
          isKeyBoardString ? TextInputType.emailAddress : TextInputType.number,
      decoration: InputDecoration(
          labelText: labelText != "" ? labelText : hintText,
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}
