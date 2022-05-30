import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library/ui.dart' as fe_ui;

class EndWidget extends StatefulWidget {
  @override
  _EndWidgetState createState() => _EndWidgetState();
}

class _EndWidgetState extends State<EndWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("😊", style: TextStyle(fontSize: 100)),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text("발급", style: fe_ui.highlightedTextStyle),
                Text("이", style: fe_ui.plainTextStyle)
              ]),
          Text("완료되었어요", style: fe_ui.plainTextStyle),
          SizedBox(height: 20),
          Text("하단의 버튼을 누르면", style: fe_ui.commentTextStyle),
          Text("초기 화면으로 돌아갑니다.", style: fe_ui.commentTextStyle),
          SizedBox(height: 30)
        ]);
  }
}
