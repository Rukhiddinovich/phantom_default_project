import 'package:default_project/models/users/geolocation_model.dart';

class AddressModel {
  final GeolocationModel geolocationModel;
  final String city;
  final String street;
  final String zipcode;
  final num number;

  AddressModel(
      {required this.city,
      required this.street,
      required this.zipcode,
      required this.number,
      required this.geolocationModel});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        city: json["city"] as String? ?? "",
        street: json["street"] as String? ?? "",
        zipcode: json["zipcode"] as String? ?? "",
        number: json["number"] as num? ?? 0,
        geolocationModel: GeolocationModel.fromJson(json["geolocation"]));
  }
}
