import '../../../models/universal_response.dart';
import '../provider/api_provider.dart';

class CategoryRepository {
  final ApiProvider apiProvider;

  CategoryRepository({required this.apiProvider});

  Future<List<String>> getAllCategories() async {
    UniversalResponse universalResponse = await apiProvider.getAllCategories();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<String>;
    }
    return [];
  }
}
