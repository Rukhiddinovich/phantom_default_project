import 'package:default_project/data/models/dictionary_model/license_model.dart';

class PhoneticModel {
  String text;
  String audio;
  String sourceUrl;
  LicenseModel license;

  PhoneticModel({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    required this.license,
  });

  factory PhoneticModel.fromJson(Map<String, dynamic> json) {
    return PhoneticModel(
      text: json['text'] as String? ?? "",
      audio: json['audio'] as String? ?? "",
      sourceUrl: json['sourceUrl'] as String? ?? "",
      license: LicenseModel.fromJson(json['license']),
    );
  }
}
