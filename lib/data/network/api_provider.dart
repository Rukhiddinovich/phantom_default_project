import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';
import '../models/universal_data.dart';

class ApiProvider {
  Future<UniversalData> getAllData() async {
    Uri uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalData(
            data: (jsonDecode(response.body)['pokemon'] as List?)
                ?.map((e) => Model.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalData(error: "ERROR");
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
