import 'package:frontend_cauclub/services/ui_services.dart';
import "package:frontend_cauclub/services/api_services.dart";
import "package:frontend_cauclub/services/preset_services.dart";
import "package:flutter/material.dart";

class ReviewPageArguments {
  final String name;
  final String club;
  final int userId;

  ReviewPageArguments(
      {required this.name, required this.club, required this.userId});
}

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Container(
                              padding: EdgeInsets.all(30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Text("?????????", style: plainTextStyle),
                                      const Text(" ????????????", style: plainTextStyle)
                                    ]),
                                    Text("Da C Side",
                                        style: highlightedTextStyle),
                                    const Text("?????? ???????????????????",
                                        style: plainTextStyle,
                                        overflow: TextOverflow.visible),
                                    SizedBox(height: 10),
                                    const Text(
                                        "?????? ????????? ???????????? ??? ????????? ???????????? ?????? ??????,\n????????????????????? ??????????????????.",
                                        style: commentTextStyle)
                                  ])))),
                  Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: const Text(
                          "Copyright 2022. ??????????????? ??????????????? ?????????????????? & Shawn Kang. ?????? ?????? ??????.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.3,
                              color: Color(0xFFEFE0CF))))
                ])));
  }
}
