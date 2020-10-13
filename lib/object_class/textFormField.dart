import 'package:FireBaseForm/controller/controller.dart';
import 'package:flutter/material.dart';

class CustomTextFormField {
  String hintText;
  String labelText;
  TextEditingController controller;
  IconData icon = Icons.access_alarm;
  bool isKeyBoardString;
  int validatorNumber;

  CustomTextFormField(this.hintText, this.labelText, this.controller, this.icon,
      this.isKeyBoardString, this.validatorNumber);

  getTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: (value) => textValidator(this.validatorNumber, value),
        keyboardType: this.isKeyBoardString
            ? TextInputType.emailAddress
            : TextInputType.number,
        decoration: InputDecoration(
            labelText: this.labelText,
            hintText: this.hintText,
            prefixIcon: Icon(this.icon),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  @override
  String toString() {
    
    return "HinText$hintText labelText$labelText isKeyBoard${isKeyBoardString.toString()} validatorNumber$validatorNumber";
  }
}
