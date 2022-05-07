import "package:frontend_cauclub/services/ui_services.dart";
import "package:flutter/material.dart";

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
      // fillColor: Color(0xffeae1d9),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFF332D24), width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFFFFB10A), width: 2)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      hintText: hintText,
      hintStyle: TextStyle(color: Color(0x881F1B16)));
}

void getLoginPageSnackBar(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text,
          style: TextStyle(
              color: Color(0xFF332D24),
              fontFamily: "Noto Sans",
              fontWeight: FontWeight.bold)),
      backgroundColor: Color(0xFFFFB10A),
      behavior: SnackBarBehavior.floating,
      width: 400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      duration: Duration(seconds: 1)));
}
