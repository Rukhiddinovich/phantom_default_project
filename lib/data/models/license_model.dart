class LicenseModel {
  String name;
  String url;

  LicenseModel({
    required this.name,
    required this.url,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      name: json['name'] as String? ?? "",
      url: json['url'] as String? ?? "",
    );
  }
}
