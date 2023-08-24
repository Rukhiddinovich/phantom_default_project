class UserModel {
  final int id;
  final String username;
  final String name;
  final String state;
  final String avatarUrl;

  UserModel(
      {required this.state,
      required this.username,
      required this.name,
      required this.id,
      required this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
