import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library/ui.dart' as fe_ui;
import 'package:frontend_cauclub/login_widget.dart';
import 'package:frontend_cauclub/review_widget.dart';
import 'package:frontend_cauclub/end_widget.dart';

void main() => runApp(MainApp());

int _widgetReplaceCounter = 0;

class MainAppArguments {
  static String name = "";
  static String clubName = "";
  static int id = 0;
}

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();

  static MainAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MainAppState>();
}

class MainAppState extends State<MainApp> {
  List<Widget> _allWidgetsList = [LoginWidget(), ReviewWidget(), EndWidget()];

  void setWidgetReplaceCounter() => setState(() {
        if (_widgetReplaceCounter < 2) {
          _widgetReplaceCounter++;
        } else {
          _widgetReplaceCounter = 0;
        }
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "활동 인증서 발급 - 중앙대학교 서울캠퍼스 동아리연합회",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Noto Sans"),
        home: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: const [Color(0xFFE88802), Color(0XFFE8B602)])),
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 70),
                      SizedBox(
                          width: 428,
                          height: 640,
                          child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Color(0xFFEFE0CF),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x22000000),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3))
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                  child:
                                      _allWidgetsList[_widgetReplaceCounter]))),
                      Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: const Text(
                              "Copyright 2022. 중앙대학교 서울캠퍼스 동아리연합회 & Shawn Kang. 모든 권리 보유.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.3,
                                  color: Color(0xFFEFE0CF))))
                    ]))));
  }
}
