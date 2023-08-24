import 'package:bloc/bloc.dart';
import 'package:default_project/data/models/universal_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/user_model.dart';
import '../../data/repository/user/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());

  final UserRepository userRepository;

  Future<void> getAllUsers() async {
    emit(UserLoadingState());

    UniversalData universalData = await userRepository.getAllHomework();
    if (universalData.error.isEmpty) {
      emit(UserSuccessState(userModels: universalData.data as List<UserModel>));
    } else {
      emit(UserErrorState(errorText: universalData.error));
    }
  }
}
