import 'package:frontend_cauclub/services/ui_services.dart';
import 'package:frontend_cauclub/services/preset_services.dart';
import "package:frontend_cauclub/services/api_services.dart";
import "package:frontend_cauclub/data_page.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  APIService apiService = APIService();
  final _formKey = GlobalKey<FormState>();
  late int _userId;
  late String _userName;

  _nextPage(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => DataPage()));

  @override
  Widget build(BuildContext context) {
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
                        //border: Border.all(width: 2, color: Color(0xFFFFB10A))
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/logo.png", width: 120),
                            SizedBox(height: 30),
                            const Text("활동 인증서",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                    color: Color(0xFFFFB10A),
                                    height: 1.2)),
                            const Text("발급 서비스",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xFF332D24),
                                    fontWeight: FontWeight.bold,
                                    height: 1.2)),
                            SizedBox(height: 30),
                            Form(
                                key: _formKey,
                                child: Container(
                                    width: 300,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          //LoginPageTextField("학번"),
                                          TextFormField(
                                              style: TextStyle(
                                                  color: Color(0xFF332D24)),
                                              decoration:
                                                  getLoginTextFieldDecoration(
                                                      "학번"),
                                              validator: (val) {
                                                if (val == null ||
                                                    val.length < 8) {
                                                  return "학번은 8자리 숫자입니다. (ex. 12345678)";
                                                } else {
                                                  try {
                                                    int.parse(val);
                                                  } catch (e) {
                                                    return "학번에는 숫자만 적을 수 있어요.";
                                                  }
                                                }
                                              },
                                              onSaved: (val) {
                                                _userId = int.parse(val ?? "0");
                                              }),
                                          SizedBox(height: 10),
                                          TextFormField(
                                              style: TextStyle(
                                                  color: Color(0xFF332D24)),
                                              decoration:
                                                  getLoginTextFieldDecoration(
                                                      "이름"),
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return "이름을 입력해주세요.";
                                                }
                                              },
                                              onSaved: (val) {
                                                _userName = val ?? "";
                                              }),
                                          //LoginPageTextField("이름"),
                                        ]))),
                            SizedBox(height: 30),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    Future<int> validationCode = apiService
                                        .validateUser(_userId, _userName);
                                    try {
                                      validationCode.then((val) {
                                        if (val == 0) {
                                          Navigator.pushNamed(context, "/main",
                                              arguments: DataPageArguments(
                                                  name: _userName,
                                                  id: _userId));
                                        } else if (val == 4) {
                                          getLoginPageSnackBar(
                                              "등록되지 않은 학번과 이름입니다.\n동아리연합회에 문의해주세요.",
                                              context);
                                        } else {
                                          getLoginPageSnackBar(
                                              "학번과 이름을 다시 확인해주세요.", context);
                                        }
                                      });
                                    } catch (e) {
                                      getLoginPageSnackBar(
                                          "API 요청에 실패했습니다.\n잠시 후에 다시 시도해주세요.",
                                          context);
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFFFFB10A)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                child: Container(
                                    width: 140,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Icon(Icons.check_outlined,
                                            color: MaterialYouLight.onPrimary),
                                        SizedBox(width: 10),
                                        Text("활동 기록 확인",
                                            style: TextStyle(
                                                color: Color(0xFF332D24),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700))
                                      ],
                                    )))
                          ]))),
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
