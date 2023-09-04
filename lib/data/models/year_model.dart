import 'days_model.dart';

class YearModel {
  final int month;
  final int year;
  final List<DaysModel> daysModel;

  YearModel({required this.daysModel, required this.month, required this.year});

  factory YearModel.fromJson(Map<String, dynamic> json) {
    return YearModel(
        daysModel: (json["days"] as List?)
                ?.map((e) => DaysModel.fromJson(e))
                .toList() ??
            [],
        month: json["month"] as int? ?? 0,
        year: json["year"] as int? ?? 0);
  }
}
