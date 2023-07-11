import 'package:default_project/data/network/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key, required this.userRepository}) : super(key: key);

  final UserRepository userRepository;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users screen"),
      ),
    );
  }
}
