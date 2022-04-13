import 'package:flutter/material.dart';
import 'package:frontend_cauclub/library.dart';

// 로그인 영역의 텍스트 필드가 양식이 비슷해서 함수 하나로 퉁쳤음
TextField loginTextField(String labelInput, String hintInput) {
  TextField temp = TextField(
      maxLines: 1,
      cursorColor: beige,
      style: TextStyle(color: beige, fontSize: 20),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: beige)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: mustard, width: 2.0)),
          hintStyle: TextStyle(color: Color(0xFF666560)),
          labelText: labelInput,
          hintText: hintInput,
          labelStyle: TextStyle(color: beige, fontSize: 20),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))));
  return temp;
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double widgetOpacity = 0.0;

  void changeOpacity() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() => widgetOpacity = 1.0);
  }

  @override
  void initState() {
    super.initState();
    changeOpacity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50),
        // 페이드-인 효과로 전체 요소 감싸기
        child: AnimatedOpacity(
            duration: Duration(milliseconds: 700),
            opacity: widgetOpacity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // 로고
              Image.asset('resources/logo.png', width: 200, height: 200),
              SizedBox(height: 50),
              // 안내 텍스트
              Text("중앙동아리 활동 이력 확인을 위해서는 학우님의 정보가 필요해요.",
                  style: TextStyle(color: beige, fontSize: 30)),
              SizedBox(height: 50),
              // 입력 칸
              loginTextField("이름", "홍길동"),
              SizedBox(height: 20),
              loginTextField("동아리명", "비꼼"),
              SizedBox(height: 20),
              loginTextField("학번", "20221234"),
              SizedBox(height: 50),
              // 제출 버튼
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "발급 가능 여부 확인",
                    style: TextStyle(
                        color: dark, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: beige,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                ),
              )
            ])));
  }
}
