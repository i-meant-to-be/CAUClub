import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library/ui.dart' as fe_ui;
import 'package:frontend_cauclub/main.dart';

List<int> entries = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class ReviewWidget extends StatefulWidget {
  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Text(MainAppArguments.name, style: fe_ui.plainTextStyle),
            const Text(" 학우님의", style: fe_ui.plainTextStyle)
          ]),
          Text(MainAppArguments.clubName.toString(),
              style: fe_ui.highlightedTextStyle),
          const Text("활동 이력이에요 😊",
              style: fe_ui.plainTextStyle, overflow: TextOverflow.visible),
          SizedBox(height: 20),
          const Text("활동 이력이 정확하지 않은 경우,\n동아리연합회로 문의해주세요.",
              style: fe_ui.commentTextStyle),
          SizedBox(height: 30),
          Expanded(
              child: Scrollbar(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(5),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 50,
                            child: Text('Entry: ${entries[index]}',
                                style: fe_ui.commentTextStyle));
                      })))
        ]);
  }
}
