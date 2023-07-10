import 'package:default_project/data/network/api_provider.dart';
import '../../models/product/products_model.dart';
import '../../models/universal_response.dart';


class CurrencyRepository {
  final ApiProvider apiProvider;
  CurrencyRepository({required this.apiProvider});

  Future<List<ProductsModel>>fetchCurrencies()async{
    UniversalResponse universalResponse=await apiProvider.getAllProducts();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<ProductsModel>;
    }
    return [];
  }
}