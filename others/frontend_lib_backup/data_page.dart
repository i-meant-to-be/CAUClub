import 'package:frontend_cauclub/services/ui_services.dart';
import "package:frontend_cauclub/services/api_services.dart";
import "package:frontend_cauclub/services/preset_services.dart";
import 'package:frontend_cauclub/review_page.dart';
import "package:flutter/material.dart";

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  APIService _apiService = APIService();
  String _selectedClubName = "(선택)";
  List<String> _clubList = [];
  var args;

  Future<String> _func(args) async {
    return await _apiService.getJoinedClubs(args.id);
  }

  @override
  void initState() {
    super.initState();
    print("initState called");
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)?.settings.arguments as AppArguments;
      });
      Future<String> _clubListData = _apiService.getJoinedClubs(args.id);
      _clubListData.then((val1) {
        List<String> _tempClubList =
            val1.replaceAll("'", "").replaceAll('"', "").split(", ");
        _tempClubList.forEach((element) => print(element));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as AppArguments;

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: const [Color(0xFFE88802), Color(0XFFE8B602)])),
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              SizedBox(height: 70),
              SizedBox(
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
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(children: [
                                  Text(args.name,
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
                                FutureBuilder(
                                    future: _apiService.getJoinedClubs(args.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<String> clubList = ["(선택)"];
                                        clubList.addAll(
                                            (snapshot.data as String)
                                                .replaceAll("'", "")
                                                .replaceAll('"', "")
                                                .split(", "));
                                        return DecoratedBox(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xFF332D24)),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Container(
                                              width: 200,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(width: 25),
                                                  Container(
                                                      width: 150,
                                                      child: DropdownButton(
                                                          isExpanded: true,
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_downward_sharp,
                                                              color: Color(
                                                                  0xFF34302A)),
                                                          style:
                                                              TextStyle(
                                                                  color: Color(
                                                                      0xFF34302A),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontFamily:
                                                                      "Noto Sans"),
                                                          dropdownColor:
                                                              Color(0xFFEFE0CF),
                                                          focusColor:
                                                              Color(0x00000000),
                                                          underline:
                                                              Container(),
                                                          value:
                                                              _selectedClubName,
                                                          items: clubList.map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              val) {
                                                            return DropdownMenuItem<
                                                                    String>(
                                                                child:
                                                                    Text(val),
                                                                value: val);
                                                          }).toList(),
                                                          onChanged:
                                                              (String? newVal) {
                                                            setState(() {
                                                              _selectedClubName =
                                                                  newVal!;
                                                            });
                                                          })),
                                                  SizedBox(width: 25)
                                                ],
                                              )),
                                        );
                                      } else {
                                        print("데이터 없음");
                                        return Text("데이터 없음");
                                      }
                                    }),
                                SizedBox(height: 230),
                                Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/review",
                                              arguments: ReviewPageArguments(
                                                  club: "비꼼",
                                                  name: "강시운",
                                                  userId: 20185456));
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xFFFFB10A)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                        child: Container(
                                            width: 140,
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const <Widget>[
                                                Icon(Icons.find_in_page_sharp,
                                                    color: Color(0xFF442c00)),
                                                SizedBox(width: 10),
                                                Text("활동 이력 검토",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF332D24),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700))
                                              ],
                                            ))))
                              ])))),
              Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: const Text(
                      "Copyright 2022. 중앙대학교 서울캠퍼스 동아리연합회 & Shawn Kang. 모든 권리 보유.",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.3,
                          color: Color(0xFFEFE0CF))))
            ])));
  }
}
