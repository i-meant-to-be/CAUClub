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
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 50,
                            child: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("2022년 1학기",
                                    style: TextStyle(fontSize: 18, height: 1)),
                                Text("회장",
                                    style: TextStyle(fontSize: 15, height: 1))
                              ],
                            )));
                      }))),
          SizedBox(height: 30),
          Center(
              child: ElevatedButton(
                  child: Container(
                      width: 140,
                      height: 40,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.local_print_shop_sharp,
                                color: Color(0xFF442C00)),
                            SizedBox(width: 10),
                            Text("활동 인증서 발급",
                                style: fe_ui.screenButtonTextStyle)
                          ])),
                  style: fe_ui.screenButtonStyle,
                  onPressed: () {
                    MainApp.of(context)!.setWidgetReplaceCounter();
                  }))
        ]);
  }
}
