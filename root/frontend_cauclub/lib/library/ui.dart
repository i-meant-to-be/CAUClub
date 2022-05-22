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
    fontSize: 15,
    height: 1.2,
    color: Color(0xFF332D24),
    fontWeight: FontWeight.w500);

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
