import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library/ui.dart' as fe_ui;
import 'package:frontend_cauclub/main.dart' as fe_main;

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/logo.png", width: 120),
          SizedBox(height: 20),
          const Text("활동 인증서", style: fe_ui.loginHighlightedTextStyle),
          const Text("발급 서비스", style: fe_ui.loginPlainTextStyle),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: fe_main.MainAppState.onClick,
              child: Container(
                  width: 140,
                  height: 40,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.login_sharp, color: Color(0xFF442C00)),
                        SizedBox(width: 10),
                        Text("로그인", style: fe_ui.screenButtonTextStyle)
                      ])),
              style: fe_ui.screenButtonStyle)
        ]);
  }
}
