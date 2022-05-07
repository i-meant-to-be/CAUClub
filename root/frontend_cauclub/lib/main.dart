import 'package:flutter/material.dart';
import 'package:frontend_cauclub/services/ui_services.dart';
import 'package:frontend_cauclub/login_page.dart';
import 'package:frontend_cauclub/data_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: "동아리 활동 인증서 발급 - 중앙대학교 서울캠퍼스 동아리연합회",
      theme: getMaterialLightTheme(),
      darkTheme: getMaterialDarkTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case "login":
      //       return MaterialPageRoute(builder: (context) => LoginPage());
      //     case "main":
      //       var _dataPageArguments = settings.arguments as DataPageArguments;
      //       return MaterialPageRoute(
      //           builder: (context) => DataPage(arguments: _dataPageArguments));
      //   }
      // }
      routes: <String, WidgetBuilder>{
        "/": (context) => LoginPage(),
        "/main": (context) => DataPage()
      }));
}
