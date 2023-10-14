class ShopModelFields {
  static const String id = "_id";
  static const String name = "name";
  static const String count = "count";
  static const String qrCode = "qrCode";

  static const String modelTable = "model_table";
}

class ShopModel {
  int? id;
  String? qrCode;
  final String count;
  final String name;

  ShopModel({
    this.id,
    this.qrCode,
    required this.name,
    required this.count,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json[ShopModelFields.id] as int? ?? 0,
      name: json[ShopModelFields.name] as String? ?? "",
      count: json[ShopModelFields.count] as String? ?? "",
      qrCode: json[ShopModelFields.qrCode] as String? ?? "",
    );
  }

  ShopModel copyWith({
    int? id,
    String? count,
    String? name,
    String? qrCode,
  }) =>
      ShopModel(
          id: id ?? this.id,
          name: name ?? this.name,
          count: count ?? this.count,
          qrCode: qrCode ?? this.qrCode);

  @override
  String toString() {
    return """
    id: $id,
    name: $name,
    count: $count,
    qrCode: $qrCode
    """;
  }

  Map<String, dynamic> toJson() {
    return {
      ShopModelFields.name: name,
      ShopModelFields.count: count,
      ShopModelFields.qrCode: qrCode,
    };
  }

  List<Object?> get props => [id, name, count, qrCode];
}
