import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_model.dart';
import '../models/universal_response.dart';

class ApiProvider {
  Future<UniversalResponse> getAllData() async {
    Uri uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body)['pokemon'] as List?)
                ?.map((e) => PokemonModel.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}