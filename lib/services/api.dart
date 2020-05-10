import 'package:http/http.dart' as http;
import 'package:parkfinder/models/api_response.dart';

class Api {
  static const APIBase = "http://192.168.42.71:8080/api/";

  dynamic getDeviceToken() async {}

  Future<APIResponse<String>> getSomething(String journeyName) {
    return http.get(APIBase + "path/" + journeyName).then((data) {
      if (data.statusCode == 200) {
        return APIResponse<String>(data: "test");
      }
      return APIResponse<String>(error: true, errorMessage: "Fetch Failed");
    }).catchError((Object error) =>
        APIResponse<String>(error: true, errorMessage: "Unknown Error"));
  }
}
