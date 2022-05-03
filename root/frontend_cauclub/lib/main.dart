import 'package:flutter/material.dart';
import 'package:frontend_cauclub/context.dart';
import 'package:frontend_cauclub/login_page.dart';
import 'package:frontend_cauclub/data_page.dart';

void main() {
  runApp(MaterialApp(
      title: "동아리 활동 인증서 발급 - 중앙대학교 서울캠퍼스 동아리연합회",
      home: LoginPage(),
      theme: ThemeData(fontFamily: 'CookieRun'),
      debugShowCheckedModeBanner: false));
}
