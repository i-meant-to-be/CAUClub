import 'package:frontend_cauclub/services/ui_services.dart';
import "package:frontend_cauclub/services/api_services.dart";
import "package:flutter/material.dart";

class DataPageArguments {
  final String name;
  final int id;

  DataPageArguments({required this.name, required this.id});
}

class DataPage extends StatelessWidget {
  APIService apiService = APIService();
  List<String> _clubList = [];
  String _selectedClubName = "";

  @override
  Widget build(BuildContext context) {
    final DataPageArguments _args =
        ModalRoute.of(context)!.settings.arguments as DataPageArguments;

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight, end: Alignment.bottomLeft,
                    //colors: [Color(0xFFFFB10A), Color(0xFF815600)]
                    colors: [Color(0xFFE88802), Color(0XFFE8B602)])),
            alignment: Alignment.center,
            child: SizedBox(
                width: 428,
                height: 640,
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEFE0CF),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x22000000),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(children: <Widget>[
                            SizedBox(width: 40),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(children: [
                                    Text(_args.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 35,
                                            height: 1.2,
                                            color: Color(0xFFFFB10A))),
                                    const Text(" 학우님,",
                                        style: TextStyle(
                                            fontSize: 35,
                                            height: 1.2,
                                            color: Color(0xFF332D24),
                                            fontWeight: FontWeight.w700)),
                                  ]),
                                  const Text("반가워요! 😝",
                                      style: TextStyle(
                                          fontSize: 35,
                                          height: 1.2,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF332D24))),
                                  SizedBox(height: 30),
                                  const Text("활동 인증서를 발급받고 싶으신\n동아리를 선택해주세요.",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF332D24),
                                          height: 1.2,
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(height: 30),
                                ])
                          ])
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
