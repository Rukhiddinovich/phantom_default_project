import 'dart:convert';

import 'package:default_project/models/currency_model.dart';
import 'package:default_project/models/universal_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
   Future<UniversalResponse> getAllCurrencies() async {
    Uri uri = Uri.parse("https://banking-api.free.mockoapp.net/user_cards");

    try {
      http.Response response = await http.get(uri);
      return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => CurrencyModel.fromJson(e))
              .toList() ??
              []);
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}
