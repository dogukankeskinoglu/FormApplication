import 'package:flutter/material.dart';

class TextFormFieldGeneral {
  String labelText;
  String helperText;
  TextEditingController controller;
  bool isVisible;
  TextFormFieldGeneral(this.helperText, this.labelText, this.controller,
      {this.isVisible = false});

  getTextFromFieldGeneral() {
    return TextFormField(
      obscureText: isVisible,
      keyboardType: isVisible ? TextInputType.text : TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
        alignLabelWithHint: false,
        labelText: this.labelText,
        helperText: this.helperText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  @override
  String toString() {
    
    return "$labelText $helperText $isVisible";
  }
}
