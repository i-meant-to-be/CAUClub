import 'package:flutter/material.dart';

const TextStyle highlightedTextStyle = TextStyle(
    fontSize: 35,
    height: 1.2,
    color: Color(0xFFFFB10A),
    fontWeight: FontWeight.w700);

const TextStyle plainTextStyle = TextStyle(
    fontSize: 35,
    height: 1.2,
    color: Color(0xFF332D24),
    fontWeight: FontWeight.w700);

const TextStyle commentTextStyle = TextStyle(
    fontSize: 20,
    height: 1.2,
    color: Color(0xFF332D24),
    fontWeight: FontWeight.w300);

const TextStyle loginHighlightedTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: Color(0xFFFFB10A));

const TextStyle loginPlainTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: Color(0xFF332D24));

final ButtonStyle screenButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color(0xFFFFB10A)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));

const TextStyle screenButtonTextStyle = TextStyle(
    fontSize: 15,
    height: 1.2,
    color: Color(0xFF332D24),
    fontWeight: FontWeight.w700);

const TextStyle formFieldTextStyle = TextStyle(color: Color(0xFF332D24));

InputDecoration getLoginTextFieldDecoration(String hintText) {
  return InputDecoration(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
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
      duration: Duration(seconds: 2)));
}
