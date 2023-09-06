class DefinitionModel {
  String definition;

  DefinitionModel({
    required this.definition,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) {
    return DefinitionModel(
      definition: json['definition'] as String? ?? "",
    );
  }
}
