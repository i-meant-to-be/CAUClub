import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library/ui.dart' as fe_ui;
import 'package:frontend_cauclub/main.dart' as fe_main;

class SelectWidget extends StatefulWidget {
  @override
  _SelectWidgetState createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(children: <Widget>[
            Text("강시운", style: fe_ui.highlightedTextStyle),
            const Text(" 학우님,", style: fe_ui.plainTextStyle),
          ]),
          const Text("반가워요! 😆", style: fe_ui.plainTextStyle),
          SizedBox(height: 20),
          const Text("활동 인증서를 발급받고 싶으신\n동아리를 선택해주세요.",
              style: fe_ui.commentTextStyle),
          SizedBox(height: 30)
        ]);
    //return Column();
  }
}
