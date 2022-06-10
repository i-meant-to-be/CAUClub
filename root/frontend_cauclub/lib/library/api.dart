import "package:http/http.dart" as http;
import "dart:convert";

class APIService {
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

  Future<String> isHistoryExists(int userId, String clubName) async {
    try {
      var response = await http.get(
          Uri.parse(baseUrl + "issue/" + userId.toString() + "_" + clubName));
      if (response.statusCode == 200) {
        return utf8.decode(response.bodyBytes);
      } else {
        return Future.error("API 호출 실패");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> getHistories(int userId, String clubName) async {
    try {
      var response = await http.get(
          Uri.parse(baseUrl + "issue/" + userId.toString() + "_" + clubName));
      if (response.statusCode == 200) {
        return utf8.decode(response.bodyBytes);
      } else {
        return Future.error("API 호출 실패");
      }
    } catch (e) {
      return Future.error(e);
    }
  }


  Future<int> validateUser(int userId, String userName) async {
    try {
      var response = await http.get(Uri.parse(
          baseUrl + "validate/" + userId.toString() + "_" + userName));
      if (response.statusCode == 200) {
        return int.parse(response.body);
      } else {
        return Future.error("API 호출 실패");
      }
    } catch (e) {
      // print("Error <$e> has been returned.");
      return Future.error(e);
    }
  }

  Future<String> getJoinedClubs(int userId) async {
    try {
      var response = await http
          .get(Uri.parse(baseUrl + userId.toString() + "/getJoinedClubs"));
      if (response.statusCode == 200) {
        // print(utf8.decode(response.bodyBytes));
        return utf8.decode(response.bodyBytes);
      } else {
        return Future.error("API 호출 실패");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
