
import 'package:flutter/material.dart';

Widget getBodyContainer(_formKey,ctfList,tfList){
  return Container(
      color: Colors.red[50],
      child: bodyContainerColumn(_formKey,ctfList,tfList),
    );
}

Column bodyContainerColumn(_formKey,ctfList,tfList) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: getForm(_formKey,ctfList,tfList),
        ),
      ],
    );
  }

   Form getForm(_formKey,ctfList,tfList) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(children: tfList),
      ),
    );
  }

  
