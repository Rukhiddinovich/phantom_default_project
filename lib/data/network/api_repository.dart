import '../models/pokemon_model.dart';
import '../models/universal_response.dart';
import 'api_provider.dart';

class ApiRepository{
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<List<PokemonModel>> getAllData()async{
    UniversalResponse universalResponse=await apiProvider.getAllData();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  List<PokemonModel>;
    }
    return [];
  }
}