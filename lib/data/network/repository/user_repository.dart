import '../../../models/universal_response.dart';
import '../../../models/users/users_model.dart';
import '../provider/api_provider.dart';

class UserRepository {
  final ApiProvider apiProvider;

  UserRepository({required this.apiProvider});

  Future<List<UserModel>> getAllUsers({
    required String username,
    required String password,
  }) async {
    UniversalResponse universalResponse = await apiProvider.getAllUsers();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<UserModel>;
    }
    return [];
  }
}
