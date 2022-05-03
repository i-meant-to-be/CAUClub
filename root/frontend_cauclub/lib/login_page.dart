import "package:flutter/material.dart";
import "package:frontend_cauclub/context.dart";
import "package:frontend_cauclub/data_page.dart";
import "package:frontend_cauclub/api_services.dart";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserService userService = UserService();
  final _formKey = GlobalKey<FormState>();
  late int _userId;
  late String _userName;

  _nextPage(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => DataPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: MaterialYouColor.background,
            alignment: Alignment.center,
            child: SizedBox(
              width: 428,
              height: 640,
              child: Container(
                  decoration: BoxDecoration(
                      color: MaterialYouColor.surfaceVarient,
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
                                color: MaterialYouColor.primary,
                                height: 1.2)),
                        const Text("발급 서비스",
                            style: TextStyle(
                                fontSize: 30,
                                color: MaterialYouColor.onBackground,
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
                                            }
                                          },
                                          onSaved: (val) {
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
                                Future<Map<String, dynamic>> user =
                                    userService.getUser(_userId.toString());
                                user.then((val) {
                                  if ((val["name"] == _userName) &&
                                      (val["id"] == _userId)) {
                                    _nextPage(context);
                                  } else {
                                    ScaffoldMessenger.of(
                                            context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                                "이름 또는 학번을 다시 확인해주세요.",
                                                style: TextStyle(
                                                    color: MaterialYouColor
                                                        .onPrimary,
                                                    fontFamily: "CookieRun")),
                                            backgroundColor:
                                                MaterialYouColor.primary,
                                            behavior: SnackBarBehavior.floating,
                                            width: 400,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20))));
                                  }
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "회원님의 동아리 가입 이력을 확인할 수 없습니다.\n동아리연합회에 문의해주세요.",
                                        style: TextStyle(
                                            color: MaterialYouColor.onPrimary,
                                            fontFamily: "CookieRun")),
                                    backgroundColor: MaterialYouColor.primary,
                                    behavior: SnackBarBehavior.floating,
                                    width: 400,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))));
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    MaterialYouColor.primary),
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
                                        color: MaterialYouColor.onPrimary),
                                    SizedBox(width: 10),
                                    Text("활동 기록 확인",
                                        style: TextStyle(
                                            color: MaterialYouColor.onPrimary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )))
                      ])),
            )));
  }
}
