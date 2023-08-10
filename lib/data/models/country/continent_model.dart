class Continent {
  final String code;
  final String name;

  Continent({required this.code, required this.name});

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
        code: json["code"] as String? ?? "",
        name: json["name"] as String? ?? "");
  }
  Map<String, dynamic> toJson() => {
    "code":code,
    "name":name
  };
}
