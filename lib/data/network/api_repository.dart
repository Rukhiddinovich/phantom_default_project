// import 'package:default_project/data/models/year_model.dart';
// import '../models/universal_data.dart';
// import 'api_service.dart';
//
// class ApiRepository{
//   final ApiService apiService;
//   ApiRepository({required this.apiService});
//
//   Future<List<UserModel>> getAllData()async{
//     UniversalData universalResponse=await apiService.getAllData();
//     if(universalResponse.error.isEmpty){
//       return universalResponse.data as  List<UserModel>;
//     }
//     return [];
//   }
// }