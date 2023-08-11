class CountryModel {
  final String code;
  final String name;
  final String phone;
  final Map<String, String> continent;
  final String capital;
  final String currency;
  final String emoji;

  CountryModel(
      {required this.continent,
      required this.name,
      required this.phone,
      required this.capital,
      required this.code,
      required this.currency,
      required this.emoji});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      continent: json["continent"],
      name: json["name"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      capital: json["capital"] as String? ?? "",
      code: json["code"] as String? ?? "",
      currency: json["currency"] as String? ?? "",
      emoji: json["emoji"] as String? ?? "",
    );
  }
}
