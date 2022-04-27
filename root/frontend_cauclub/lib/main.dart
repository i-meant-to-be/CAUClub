import 'package:flutter/material.dart';
import 'package:frontend_cauclub/context.dart';

void main() {
  runApp(MaterialApp(
      title: "동아리 활동 인증서 발급 - 중앙대학교 서울캠퍼스 동아리연합회",
      home: MainPage(),
      theme: ThemeData(fontFamily: 'Noto Sans KR')));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: MaterialYouColor.background,
            alignment: Alignment.center,
            child: SizedBox(
              width: 428,
              height: 640,
              child: Container(
                  decoration: BoxDecoration(
                      color: MaterialYouColor.surfaceVarient,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("resources/logo.png", width: 120),
                        SizedBox(height: 50),
                        const Text("활동 인증서",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: MaterialYouColor.primary,
                                height: 1.2)),
                        const Text("발급 서비스",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 30,
                                color: MaterialYouColor.onBackground,
                                height: 1.2)),
                        SizedBox(height: 30),
                        LoginPageTextField("학번"),
                        SizedBox(height: 10),
                        LoginPageTextField("이름"),
                        SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: () {
                              print("버튼 클릭됨");
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    MaterialYouColor.primary),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            child: Container(
                                width: 140,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.check_outlined,
                                        color: MaterialYouColor.onPrimary),
                                    SizedBox(width: 10),
                                    Text("활동 기록 확인",
                                        style: TextStyle(
                                            color: MaterialYouColor.onPrimary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )))
                      ])),
            )));
  }
}
