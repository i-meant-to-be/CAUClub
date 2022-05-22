import "package:flutter/material.dart";

final Map<String, String> allClubsList = {
  '라켓단': '탁구',
  '랑데부': '야구',
  '리베로': '축구',
  '미식축구부': '미식축구',
  '쓰리쿠션': '당구',
  '자이언츠': '농구',
  'LOVE4T': '테니스',
  '네비게이토': '개신교 성경',
  'CCC': '전도 육성 파송',
  'CUSCM': '개신교 예배',
  'ESF': '기독교 사회 운동',
  '가람터': '팬플룻',
  '누리울림': '민중가요',
  '루바토': '관현악',
  '블루드래곤': '락밴드',
  '피카통': '통기타',
  'MuSE': 'MIDI 작곡',
  '라이너스': '자전거',
  '산악부': '산악',
  '스키부': '스키',
  '스킨스쿠버부': '스킨스쿠버 다이빙',
  '요트부': '요트',
  '프리스타일': '보드',
  'CAUON': '러닝',
  'CRUX': '클라이밍',
  '날파람': '태권도',
  '쏜살': '국궁',
  '의혈검': '대한검도',
  '중앙유도회': '유도',
  '피트니스부': '보디빌딩',
  '해동검도부': '해동검도',
  '만화두레': '만화',
  '문학동인회': '문학',
  '미술시간': '순수미술',
  '반영': '영화 제작',
  '사진연구회': '사진',
  '중앙서예연구회': '서예',
  '햇귀': '한복',
  '사랑터': '탁아봉사',
  '손짓사랑': '수화봉사',
  '푸름회': '교육봉사',
  'MRA': '대민지원',
  'RCY': '적십자',
  '비꼼': '자유토론',
  '지구인': '환경',
  '휴머니즘': '찬반토론',
  '새날지기': '율동',
  '영죽무대': '연극',
  '청룡합창단': '합창',
  '타박네': '극예술',
  'Da C Side': '흑인음악',
  'Dance P.O.zz': '스트릿 댄스',
  'M&M': '마술',
  '소래얼': '풍물',
  '한백사위': '마당놀이',
  '가톨릭학생회': '천주교',
  '불교학생회': '불교',
  '미생마': '바둑',
  '애니타임': '애니메이션 및 서브컬쳐',
  'BOCA': '보드게임',
  'FRA:ME': 'e-Sports',
  '(중)앙상추': '텃밭 가꾸기',
  '코스모스': '천체관측',
  '화인법학회': '법학',
  'CECOM': '하드웨어',
  'CIEN': '게임 제작',
  'COMP': '모바일 앱 개발',
  'CUDS': '영어토론',
  'HAM': '무선통신',
  '굿네이버': '길거리 정화 봉사',
  '하이클리어': '배드민턴',
  '한반도미래연구회': '통일 외교 안보',
  'KOREA CLUB': '유학생 교환학생',
};

class AppArguments {
  final int id;
  final String name;
  final String clubs;

  AppArguments({required this.name, required this.id, required this.clubs});
}

InputDecoration getLoginTextFieldDecoration(String hintText) {
  return InputDecoration(
      filled: true,
      //fillColor: Color(0xffe6d7c7),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFF332D24), width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xFFFFB10A), width: 2)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      hintText: hintText,
      hintStyle: TextStyle(color: Color(0x881F1B16)));
}

void getLoginPageSnackBar(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text,
          style: TextStyle(
              color: Color(0xFF332D24),
              fontFamily: "Noto Sans",
              fontWeight: FontWeight.bold)),
      backgroundColor: Color(0xFFFFB10A),
      behavior: SnackBarBehavior.floating,
      width: 400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      duration: Duration(seconds: 2)));
}
