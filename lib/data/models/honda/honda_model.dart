class HondaModel {
  final num id;
  final String carModel;
  final num averagePrice;
  final String logo;
  final num establishedYear;
  final String description;
  final List<String> carPics;

  HondaModel(
      {required this.averagePrice,
      required this.carModel,
      required this.establishedYear,
      required this.id,
      required this.logo,
      required this.description,
      required this.carPics});

  factory HondaModel.fromJson(Map<String, dynamic> json) {
    return HondaModel(
        averagePrice: json["average_price"] as num? ?? 0,
        carModel: json["car_model"] as String? ?? "",
        establishedYear: json["established_year"] as num? ?? 0,
        id: json["id"] as num? ?? 0,
        logo: json["logo"] as String? ?? "",
        description: json["description"] as String? ?? "",
        carPics: List<String>.from(json["car_pics"].map((x) => x)),
    );
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "car_model": carModel,
    "logo": logo,
    "established_year": establishedYear,
    "average_price": averagePrice,
    "description": description,
    "car_pics": List<dynamic>.from(carPics.map((x) => x)),
  };
}
