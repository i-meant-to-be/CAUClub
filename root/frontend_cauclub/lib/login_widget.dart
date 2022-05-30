import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library/ui.dart' as fe_ui;
import 'package:frontend_cauclub/library/data.dart' as fe_data;
import 'package:frontend_cauclub/main.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();

  String _selectedClubName = "라켓단";

  void initState() {
    super.initState();
    MainAppArguments.clubName = _selectedClubName;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/logo.png", width: 120),
          SizedBox(height: 20),
          const Text("활동 인증서", style: fe_ui.loginHighlightedTextStyle),
          const Text("발급 서비스", style: fe_ui.loginPlainTextStyle),
          SizedBox(height: 20),
          Form(
              key: _formKey,
              child: Container(
                  width: 300,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          style: fe_ui.formFieldTextStyle,
                          decoration: fe_ui.getLoginTextFieldDecoration("이름"),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "이름을 입력해주세요.";
                            }
                          },
                          onSaved: (val) {
                            MainAppArguments.name = val ?? "";
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          style: fe_ui.formFieldTextStyle,
                          decoration: fe_ui.getLoginTextFieldDecoration("학번"),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "학번은 숫자 8자리로 이루어져 있어요.";
                            } else if (val.length < 8) {
                              bool msgCounter = false;
                              try {
                                int.parse(val);
                              } catch (e) {
                                msgCounter = true;
                              } finally {
                                if (msgCounter) {
                                  return "학번은 숫자로만 이루어져 있어요.";
                                } else {
                                  return "학번은 숫자 8자리로 이루어져 있어요.";
                                }
                              }
                            }
                          },
                          onSaved: (val) {
                            MainAppArguments.id = int.parse(val ?? "0");
                          },
                        ),
                        SizedBox(height: 10),
                        Container(
                            width: 360,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFF332D24)),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(children: [
                                  SizedBox(width: 10),
                                  Container(
                                      width: 280,
                                      child: DropdownButton(
                                          isExpanded: true,
                                          icon: Icon(Icons.arrow_downward_sharp,
                                              color: Color(0xFF34302A)),
                                          style: TextStyle(
                                              color: Color(0xFF34302A),
                                              fontSize: 16,
                                              fontFamily: "Noto Sans"),
                                          dropdownColor: Color(0xFFEFE0CF),
                                          focusColor: Color(0x00000000),
                                          underline: Container(),
                                          value: _selectedClubName,
                                          items: fe_data.allClubsList
                                              .map<DropdownMenuItem<String>>(
                                                  (String val) {
                                            return DropdownMenuItem<String>(
                                                child: Text(val), value: val);
                                          }).toList(),
                                          onChanged: (String? newVal) {
                                            setState(() {
                                              _selectedClubName = newVal!;
                                              MainAppArguments.clubName =
                                                  newVal;
                                              print(MainAppArguments.clubName);
                                            });
                                          }))
                                ])))
                      ]))),
          SizedBox(height: 30),
          ElevatedButton(
              child: Container(
                  width: 140,
                  height: 40,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        fe_ui.buttonIconList[0],
                        SizedBox(width: 10),
                        Text("활동 이력 확인", style: fe_ui.screenButtonTextStyle)
                      ])),
              style: fe_ui.screenButtonStyle,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  MainApp.of(context)!.setWidgetReplaceCounter();
                  print(MainAppArguments.clubName);
                }
              })
        ]);
  }
}
