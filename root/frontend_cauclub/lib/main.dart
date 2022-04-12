import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter 튜토리얼",
        home: Scaffold(
            body: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                child: Column(
                    children: [imageSection, titleSection],
                    mainAxisAlignment: MainAxisAlignment.center))));
  }

  Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text("중앙대학교 서울캠퍼스 동아리연합회\n회원 인증서 발급 서비스",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          textAlign: TextAlign.center));

  Widget imageSection = Container(
      padding: const EdgeInsets.all(32),
      child: SizedBox(
          height: 200, width: 200, child: Image.asset('resources/logo.png')));
}
