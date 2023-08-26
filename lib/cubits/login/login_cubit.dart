import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:default_project/data/repository/login/login_repository.dart';
import '../../data/models/universal_data.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  final LoginRepository loginRepository;

  Future<void> checkLoggedState() async {
    await Future.delayed(const Duration(seconds: 3));
    if (loginRepository.getToken().isEmpty) {
      emit(LoginUnLoggedState());
    } else {
      emit(LoggedState());
    }
  }

  Future<UniversalData> getUser() async {
    emit(LoginLoadingState());
    UniversalData universalData = await loginRepository.getUser();
    if (universalData.error.isEmpty) {
      emit(GetUserSuccessState());
      return universalData;
    } else {
      emit(LoginErrorState(errorText: universalData.error));
      return universalData;
    }
  }

  Future<void> loginUser(
      {required String username, required String password}) async {
    emit(LoginLoadingState());
    UniversalData universalData =
        await loginRepository.loginUser(username: username, password: password);
    if (universalData.error.isEmpty) {
      if (!universalData.data["status"]) {
        await loginRepository
            .putTokenInMain(universalData.data["token"] as String);
        emit(LoginSuccessState());
      } else {
        await loginRepository.putToken(universalData.data["token"] as String);
        emit(LoginSuccessState());
      }
    } else {
      emit(LoginErrorState(errorText: universalData.error));
    }
  }

  Future<void> loginEdit(
      {required String name,
      required String phone,
      required String username,
      required String token,
      required String password}) async {
    emit(LoginLoadingState());
    UniversalData universalData = await loginRepository.loginEdit(
      token: token,
        name: name, phone: phone, username: username, password: password);
    if (universalData.error.isEmpty) {
      emit(LoginUpdateSuccessState());
    } else {
      emit(LoginErrorState(errorText: universalData.error));
    }
  }

  Future<void> logOutUser() async {
    emit(LoginLoadingState());
    bool? isDeleted = await loginRepository.deleteToken();
    bool? isDelete = await loginRepository.deleteTokens();
    if (isDeleted != null) {
      emit(LoginUnLoggedState());
    }
  }
}
