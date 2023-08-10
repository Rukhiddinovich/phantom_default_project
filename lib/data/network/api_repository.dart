import 'package:default_project/data/models/news_model.dart';
import '../models/universal_response.dart';
import 'api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider;

  ApiRepository({required this.apiProvider});

  Future<List<NewsModel>> postNotification({
    required String title,
    required String description,
    required String image,
  }) async {
    UniversalResponse universalResponse = await apiProvider.postNotification(
        title: title, description: description, image: image);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<NewsModel>;
    }
    return [];
  }
}
