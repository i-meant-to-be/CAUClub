import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library/ui.dart' as fe_ui;
import 'package:frontend_cauclub/main.dart' as fe_main;

class ViewWidget extends StatefulWidget {
  @override
  _ViewWidgetState createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Text("Hello", style: fe_ui.highlightedTextStyle);
    //return Column();
  }
}
