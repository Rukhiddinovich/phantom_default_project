import '../../../local/storage_repository/storage_repository.dart';
import '../../models/universal_data.dart';
import '../../network/api_service.dart';

class LoginRepository {
  final ApiService apiService;

  LoginRepository({required this.apiService});

  Future<UniversalData> loginUser(
      {required String username, required String password}) async {
    return apiService.loginUser(username: username, password: password);
  }

  Future<UniversalData> loginEdit(
      {required String name,
      required String phone,
      required String username,
      required String password}) async {
    return apiService.loginEdit(
        name: name, phone: phone, username: username, password: password);
  }

  Future<UniversalData> getUser() async {
    return apiService.getUser();
  }

  String getToken() => StorageRepository.getString("tokens");

  Future<bool?> putToken(String token) async =>
      StorageRepository.putString("token", token);

  Future<bool?> putTokenInMain(String token) async =>
      StorageRepository.putString("tokens", token);

  Future<bool?> deleteToken() async => StorageRepository.deleteString("token");

  Future<bool?> deleteTokens() async =>
      StorageRepository.deleteString("tokens");
}
