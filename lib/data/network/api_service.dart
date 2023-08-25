import 'package:default_project/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../local/storage_repository/storage_repository.dart';
import '../../utils/constants.dart';
import '../models/universal_data.dart';

class ApiService {
  final _dio = Dio(
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

  ApiService() {
    _init();
  }

  _init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV  YUBORILDI :${requestOptions.path}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB  KELDI :${response.requestOptions.path}");
          return handler.next(response);
        },
      ),
    );
  }

  //--------------------------------Login---------------------------------------

  Future<UniversalData> loginUser(
      {required String username, required String password}) async {
    Response response;
    try {
      response = await _dio.post("/auth/login",
          data: {"username": username, "password": password});
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: {
          "token": response.data["token"],
          "status": response.data["status"]
        });
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

  Future<UniversalData> loginEdit(
      {required String name,
      required String phone,
      required String username,
      required String password}) async {
    Response response;
    String token = StorageRepository.getString("token");
    try {
      response = await _dio.post("/auth/users/first/edit",
          options: Options(headers: {"Authorization": "Bearer Token:$token"}));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: LoginModel.fromJson(response.data));
      //   Model boshqa yozilishi kerak
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

  Future<UniversalData> getUser() async {
    Response response;
    String token = StorageRepository.getString("token");
    try {
      response = await _dio.get("/auth/users/me",
          options: Options(headers: {"Authorization": "Bearer Token:$token"}));
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return UniversalData(data: LoginModel.fromJson(response.data));
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
