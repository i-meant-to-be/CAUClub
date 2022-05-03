import "package:flutter/material.dart";
import "package:frontend_cauclub/context.dart";
import 'package:frontend_cauclub/login_page.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: MaterialYouColor.background,
            alignment: Alignment.center,
            child: const Text("Test",
                style: TextStyle(color: Colors.white70, fontSize: 70))));
  }
}
