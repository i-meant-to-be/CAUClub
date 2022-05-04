import 'package:frontend_cauclub/services/ui_services.dart';
import "package:frontend_cauclub/services/api_services.dart";
import 'package:frontend_cauclub/login_page.dart';
import "package:flutter/material.dart";

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: MaterialYouLight.background,
            alignment: Alignment.center,
            child: SizedBox(
                width: 428,
                height: 640,
                child: Container(
                    decoration: BoxDecoration(
                        color: MaterialYouLight.surfaceVarient,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("강시운",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: MaterialYouLight.primary,
                                        height: 1.2)),
                                const Text(" 학우님, 반가워요! 😝",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: MaterialYouLight.onBackground,
                                        height: 1.2))
                              ]),
                          SizedBox(height: 30),
                          const Text("활동 인증서를 발급받고 싶으신",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: MaterialYouLight.onBackground,
                                  height: 1.2)),
                          const Text("동아리를 선택해주세요.",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: MaterialYouLight.onBackground,
                                  height: 1.2)),
                          SizedBox(height: 30)
                        ])))));
  }
}

/*
FutureBuilder(
              future: apiService.getJoinedClubs(20185456),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<String> clubList = snapshot.data
                      .toString()
                      .replaceAll("'", '')
                      .replaceAll('"', "")
                      .split(", ");
                  return Text("dsd");
                } else {
                  return CircularProgressIndicator(
                    color: MaterialYouLight.onBackground,
                  );
                }
              },
            )
*/
