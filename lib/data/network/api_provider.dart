import 'dart:convert';
import 'dart:io';

import 'package:default_project/data/models/universal_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../models/google_search_model.dart';
import 'network_utils.dart';

class ApiProvider {
  static Future<UniversalResponse> searchFromGoogle({
    required String query,
    required int page,
    required int count,
  }) async {
    Uri uri = Uri.https(
      baseUrl,
      "/search",
      {
        "q": query,
        "page": page.toString(),
        "num": count.toString(),
        "gl":"uz"
      },
    );

    try {
      http.Response response = await http.post(uri, headers: {
        "Content-Type": "application/json",
        "X-API-KEY": "68a18cafb048059571d5286c2905420498357f74",
      });

      if (response.statusCode == HttpStatus.ok) {
        return UniversalResponse(
            data: GoogleSearchModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalResponse(error: "Internet Error!");
    } on FormatException {
      return UniversalResponse(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalResponse(error: err.toString());
    }
  }
}