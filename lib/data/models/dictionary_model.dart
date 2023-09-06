import 'package:default_project/data/models/phonetic_model.dart';
import 'license_model.dart';
import 'meaning_model.dart';

class DictionaryModel {
  String word;
  String phonetic;
  List<PhoneticModel> phonetics;
  List<MeaningModel> meanings;
  LicenseModel license;
  List<String> sourceUrls;

  DictionaryModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      word: json['word'] as String? ?? "",
      phonetic: json['phonetic'] as String? ?? "",
      phonetics: List<PhoneticModel>.from(
          json['phonetics'].map((x) => PhoneticModel.fromJson(x))),
      meanings: List<MeaningModel>.from(
          json['meanings'].map((x) => MeaningModel.fromJson(x))),
      license: LicenseModel.fromJson(json['license']),
      sourceUrls: List<String>.from(json['sourceUrls']),
    );
  }

  static List<DictionaryModel> getFromList(List? list) {
    return list?.map((e) => DictionaryModel.fromJson(e)).toList() ?? [];
  }
}
