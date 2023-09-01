import 'package:default_project/data/models/model.dart';
import '../models/universal_data.dart';
import 'api_provider.dart';

class ApiRepository{
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<List<Model>> getAllData()async{
    UniversalData universalResponse=await apiProvider.getAllData();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  List<Model>;
    }
    return [];
  }
}