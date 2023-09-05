import '../../models/universal_data.dart';
import '../../network/api_service.dart';

class YearRepository {
  final ApiService apiService;

  YearRepository({required this.apiService});

  Future<UniversalData> getAllYear() async => apiService.getAllData();
}
