import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../models/detail/one_call_data.dart';
import '../models/main/weather_main.dart';
import '../models/universal_data.dart';
import 'network_utils.dart';

class ApiProvider {
  static Future<UniversalData> getWeatherOneCallData({
    required double lat,
    required double long,
  }) async {

    Uri uri = Uri.https(
      baseUrlWithoutHttp,
      "/data/2.5/onecall",
      {
        "appid": apiKeyForMain,
        "lat": lat.toString(),
        "lon": long.toString(),
        "exclude": "minutely,current",
        "units": "metric",
      },
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: OneCallData.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }
  }

  static Future<UniversalData> getMainWeatherDataByLatLong({
    required double lat,
    required double long,
  }) async {
    Uri uri = Uri.https(
      baseUrlWithoutHttp,
      "/data/2.5/weather",
      {
        "appid": apiKeyForMain,
        "lat": lat.toString(),
        "lon": long.toString(),
      },
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      return UniversalData(error: err.toString());
    }
  }

  static Future<UniversalData> getMainWeatherDataByQuery(
      {required String query}) async {
    //Uri uri = Uri.parse("$baseUrl/data/2.5/weather?q=$query&appid=$apiKeyForMain");

    Uri uri = Uri.https(
      baseUrlWithoutHttp,
      "/data/2.5/weather",
      {
        "appid": apiKeyForMain,
        "q": query,
      },
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        {
          return UniversalData(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)),
            statusCode: response.statusCode,
          );
        }
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    }
    catch (err) {
      return UniversalData(error: err.toString());
    }
  }
}
