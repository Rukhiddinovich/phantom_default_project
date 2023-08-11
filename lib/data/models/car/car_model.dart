// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

CarModel emptyFromJson(String str) => CarModel.fromJson(json.decode(str));

String emptyToJson(CarModel data) => json.encode(data.toJson());

class CarModel {
  List<Datum> data;

  CarModel({
    required this.data,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String carModel;
  int averagePrice;
  String logo;
  int establishedYear;

  Datum({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]as int? ?? 0,
    carModel: json["car_model"]as String? ?? "",
    averagePrice: json["average_price"]as int? ?? 0,
    logo: json["logo"]as String? ?? "",
    establishedYear: json["established_year"]as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_model": carModel,
    "average_price": averagePrice,
    "logo": logo,
    "established_year": establishedYear,
  };
}