import 'package:default_project/data/models/year_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/constants.dart';
import '../models/universal_data.dart';

class ApiService {
  // DIO SETTINGS
  final dio = Dio();

  ApiService() {
    _init();
  }

  _init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint("ENTERED ERROR:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("REQUEST SENT :${handler.isCompleted}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("THE ANSWER HAS COME :${handler.isCompleted}");
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getAllData() async {
    Response response;
    final dio1 = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          "Content-Type": "application/json",
        },
        connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
        receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
        sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
      ),
    );
    try {
      response = await dio1.get(baseUrl);

      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(
            data: (response.data as List?)
                ?.map((e) => YearModel.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data["message"]);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

}
