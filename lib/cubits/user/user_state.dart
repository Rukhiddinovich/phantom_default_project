part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  List<UserModel> userModels;

  UserSuccessState({required this.userModels});
}

class UserErrorState extends UserState {
  final String errorText;

  UserErrorState({required this.errorText});
}
