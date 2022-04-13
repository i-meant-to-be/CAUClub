import 'package:flutter/material.dart';
import 'package:frontend_cauclub/login.dart';
import 'package:frontend_cauclub/context.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '활동 인증서 발급 - 중앙대학교 서울캠퍼스 동아리연합회',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

// 메인 페이지: 3:7의 비율로 두 영역으로 나눔
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQueryData deviceData = MediaQuery.of(context);
    // Size screenSize = deviceData.size;
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: screenSize.width * 0.3,
                height: screenSize.height,
                color: Color(0xFF292929),
                child: LoginPage()),
            Container(
                width: screenSize.width * 0.7,
                height: screenSize.height,
                color: Color(0xFFFFB102),
                child: ContextPage())
          ],
        ),
      ),
    );
  }
}
