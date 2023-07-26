import 'dart:convert';
import 'dart:io';
import 'package:default_project/data/models/universal_response.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<UniversalResponse> getAllUsers() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => UserModel.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalResponse(error: "Error");
    } on SocketException {
      return UniversalResponse(error: "Internet Error!");
    } on FormatException {
      return UniversalResponse(error: "Format Error!");
    } catch (err) {
      return UniversalResponse(error: err.toString());
    }
  }
}