import "package:flutter/material.dart";

class MaterialYouColor {
  static const Color onBackground = Color(0xffeae1d9);
  static const Color background = Color(0xff1f1b16);
  static const Color surfaceVarient = Color(0xff4e4538);
  static const Color primary = Color(0xffffba3b);
  static const Color onPrimary = Color(0xff442c00);
}

class LoginPageTextField extends StatelessWidget {
  String hintText;

  LoginPageTextField(
      this.hintText, FormFieldSetter onSaved, FormFieldValidator validator);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: TextFormField(
            style: TextStyle(color: Color(0xff1f1b16)),
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffeae1d9),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xffddc3a1), width: 3)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xffffba3b), width: 3)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: hintText)));
  }
}

InputDecoration getLoginTextFieldDecoration(String hintText) {
  return InputDecoration(
      filled: true,
      fillColor: Color(0xffeae1d9),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xffddc3a1), width: 3)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xffffba3b), width: 3)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      hintText: hintText);
}
