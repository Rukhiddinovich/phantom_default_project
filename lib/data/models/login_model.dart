class LoginModel {
  final int id;
  final String username;
  final String name;
  final String state;
  final String avatarUrl;

  LoginModel(
      {required this.state,
      required this.username,
      required this.name,
      required this.id,
      required this.avatarUrl});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        state: json["state"] as String? ?? "",
        username: json["username"] as String? ?? "",
        name: json["name"] as String? ?? "",
        id: json["id"] as int? ?? 0,
        avatarUrl: json["avatar_url"] as String? ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "name": name,
      "state": state,
      "avatar_url": avatarUrl
    };
  }

  @override
  String toString() {
    return """
    id: $id
    username:$username
    name: $name
    state: $state
    avatar_url: $avatarUrl
    """;
  }
}
