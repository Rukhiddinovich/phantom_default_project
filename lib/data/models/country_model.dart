class CountryModel {
  final String id;
  final String name;
  final String image;
  final String status;
  final String type;
  final List<dynamic> roles;
  final int yearBuilt;

  CountryModel(
      {required this.name,
      required this.id,
      required this.image,
      required this.status,
      required this.roles,
      required this.type,
      required this.yearBuilt});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json["name"] as String? ?? "",
      id: json["id"] as String? ?? "",
      image: json["image"] as String? ?? "",
      status: json["status"] as String? ?? "",
      roles: json["roles"] as List? ?? [],
      type: json["type"] as String? ?? "",
      yearBuilt: json["year_build"] as int? ?? 0,
    );
  }
}
