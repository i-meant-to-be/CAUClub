import 'package:frontend_cauclub/services/ui_services.dart';
import 'package:frontend_cauclub/services/preset_services.dart';
import "package:frontend_cauclub/services/api_services.dart";
import "package:frontend_cauclub/data_page.dart";
import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            color: MaterialColorScheme.lightColorScheme.background,
            alignment: Alignment.center,
            child: SizedBox(
              width: 428,
              height: 640,
              child: Container(
                  decoration: BoxDecoration(
                      color: MaterialColorScheme.lightColorScheme.background,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/logo.png", width: 120),
                        SizedBox(height: 30),
                        const Text("활동 인증서",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Color(0xFF815600),
                                height: 1.2)),
                        const Text("발급 서비스",
                            style: TextStyle(
                                fontSize: 30,
                                color: MaterialYouLight.onBackground,
                                height: 1.2)),
                        SizedBox(height: 30),
                        Form(
                            key: _formKey,
                            child: Container(
                                width: 300,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      //LoginPageTextField("학번"),
                                      TextFormField(
                                          decoration:
                                              getLoginTextFieldDecoration("학번"),
                                          validator: (val) {
                                            if (val == null || val.length < 8) {
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
                                            print(val is int ? true : false);
                                            _userId = int.parse(val ?? "0");
                                          }),
                                      SizedBox(height: 10),
                                      TextFormField(
                                          decoration:
                                              getLoginTextFieldDecoration("이름"),
                                          validator: (val) {
                                            if (val == null || val.isEmpty) {
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
                                Future<int> validationCode =
                                    apiService.validateUser(_userId, _userName);
                                try {
                                  validationCode.then((val) {
                                    if (val == 0) {
                                      _nextPage(context);
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
                                    MaterialYouLight.primary),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            child: Container(
                                width: 140,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.check_outlined,
                                        color: MaterialYouLight.onPrimary),
                                    SizedBox(width: 10),
                                    Text("활동 기록 확인",
                                        style: TextStyle(
                                            color: MaterialYouLight.onPrimary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )))
                      ])),
            )));
  }
}
