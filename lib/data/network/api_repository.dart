import 'package:default_project/data/models/universal_response.dart';
import 'package:default_project/data/network/api_provider.dart';

class UserRepository {
  final ApiProvider apiProvider;

  UserRepository({required this.apiProvider});

  Future<UniversalResponse> getAllUsers() => apiProvider.getAllUsers();
}