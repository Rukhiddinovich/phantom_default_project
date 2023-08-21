class LoginState {
  final String email;
  final String password;

  LoginState({required this.email, required this.password});

  factory LoginState.fromJson(Map<String, dynamic> json) {
    return LoginState(
      email: json["firstName"] as String? ?? "",
      password: json["lastName"] as String? ?? "",
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
  }) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  String toString() {
    return '''
    Email: $email
    Password: $password
    ''';
  }
}
