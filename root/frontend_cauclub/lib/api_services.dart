import "package:http/http.dart" as http;
import "dart:convert";

class UserService {
  final String baseUrl = "http://localhost:8000/app/user/";

  Future<Map<String, dynamic>> getUser(String userId) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + userId));
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        return Future.error("API 호출 실패");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
