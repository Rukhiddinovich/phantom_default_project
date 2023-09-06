import 'definition_model.dart';

class MeaningModel {
  String partOfSpeech;
  List<DefinitionModel> definitions;
  List<String> synonyms;
  List<String> antonyms;

  MeaningModel({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) {
    return MeaningModel(
      partOfSpeech: json['partOfSpeech'] as String? ?? "",
      definitions: List<DefinitionModel>.from(
          json['definitions'].map((x) => DefinitionModel.fromJson(x))),
      synonyms: List<String>.from(json['synonyms']),
      antonyms: List<String>.from(json['antonyms']),
    );
  }
}
