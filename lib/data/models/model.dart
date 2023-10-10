class ContactModel {
  final String name;
  final String phone;
  final String data;

  ContactModel({required this.phone, required this.data, required this.name});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
        phone: json["phone"] as String? ?? "",
        data: json["data"] as String? ?? "",
        name: json["name"] as String? ?? "");
  }
}
