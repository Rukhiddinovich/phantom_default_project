import '../../models/universal_data.dart';
import '../../network/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<UniversalData> getAllHomework() async => apiService.getAllUsers();
}