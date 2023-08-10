import 'dart:convert';

import 'package:default_project/data/models/news_model.dart';
import 'package:http/http.dart' as http;
import '../models/universal_response.dart';

class ApiProvider {
  Future<UniversalResponse> postNotification(
      {required String title,
        required String description,
        required String image}) async {
    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");
    try {
      http.Response response = await http.post(uri, headers: <String, String>{
        "content-type": "application/json",
        "Authorization":
        "key=AAAANf33g0E:APA91bEo1wPTNgld0plGLp8WCe8bbRwHR0KVxnqftsYAB7YC07yaYONuOEOgrJasiTmN_8h26FSnkAgjJMBtqKo6-b-C66Uf0INVd0UMMyrzx3gUXX_mpqo80XPJ-8yRL9x5qlN6f8-H"
      },body: jsonEncode(<String,dynamic>{
        "to":"/topics/news",
        "notification":{
          "title":"NEWS APP",
          "body":"YANGILIKLAR DUNYOSI"
        },"data":{
          "title":title,
          "body":description,
          "image":image
        }
      }));

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => NewsModel.fromJson(e))
                .toString() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}