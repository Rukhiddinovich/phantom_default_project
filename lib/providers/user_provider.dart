import 'package:default_project/data/models/universal_response.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

import '../data/models/status/form_status.dart';
import '../data/network/api_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository userRepository;

  UserProvider({required this.userRepository}) {
    fetchUsersData();
  }

  String errorText = "";

  FormStatus status = FormStatus.pure;

  List<UserModel>? users;

  fetchUsersData() async {
    notify(FormStatus.loading);
    UniversalResponse universalData = await userRepository.getAllUsers();
    if (universalData.error.isEmpty) {
      notify(FormStatus.success);
      users = universalData.data as List<UserModel>;
    } else {
      errorText = universalData.error;
      notify(FormStatus.failure);
    }
  }

  notify(FormStatus value) {
    status = value;
    notifyListeners();
  }
}
