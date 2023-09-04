class DaysModel {
  final int day;
  final int type;

  DaysModel({required this.type, required this.day});

  factory DaysModel.fromJson(Map<String, dynamic> json) {
    return DaysModel(
      type: json["type"] as int? ?? 0,
      day: json["day"] as int? ?? 0,
    );
  }
}
