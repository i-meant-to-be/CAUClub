import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library/ui.dart' as fe_ui;
import 'package:frontend_cauclub/main.dart';

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
          Text("π", style: TextStyle(fontSize: 100)),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text("λ°κΈ", style: fe_ui.highlightedTextStyle),
                Text("μ΄", style: fe_ui.plainTextStyle)
              ]),
          Text("μλ£λμμ΄μ", style: fe_ui.plainTextStyle),
          SizedBox(height: 20),
          Text("νλ¨μ λ²νΌμ λλ₯΄λ©΄", style: fe_ui.commentTextStyle),
          Text("μ΄κΈ° νλ©΄μΌλ‘ λμκ°λλ€.", style: fe_ui.commentTextStyle),
          SizedBox(height: 30),
          Center(
              child: ElevatedButton(
                  child: Container(
                      width: 140,
                      height: 40,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.refresh_sharp, color: Color(0xFF442C00)),
                            SizedBox(width: 10),
                            Text("μ²μ νλ©΄μΌλ‘", style: fe_ui.screenButtonTextStyle)
                          ])),
                  style: fe_ui.screenButtonStyle,
                  onPressed: () {
                    MainApp.of(context)!.setWidgetReplaceCounter();
                  }))
        ]);
  }
}
