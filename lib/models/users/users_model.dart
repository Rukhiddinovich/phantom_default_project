import 'address_model.dart';
import 'name_model.dart';

class UsersModel {
  final AddressModel addressModel;
  final num id;
  final String email;
  final String username;
  final String phone;
  final num v;
  final NameModel nameModel;

  UsersModel(
      {required this.addressModel,
      required this.id,
      required this.email,
      required this.username,
      required this.phone,
      required this.v,
      required this.nameModel});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
        addressModel: AddressModel.fromJson(json["address"]),
        id: json["id"] as num? ?? 0,
        email: json["email"] as String? ?? "",
        username: json["username"] as String? ?? "",
        phone: json["phone"] as String? ?? "",
        v: json["__v"] as num? ?? 0,
        nameModel: NameModel.fromJson(json["name"]));
  }
}
