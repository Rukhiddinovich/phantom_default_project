part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserSuccessState extends UserState {
  List<UserModel> userModels;

  UserSuccessState({required this.userModels});

  @override
  List<Object?> get props => [];
}

class UserErrorState extends UserState {
  final String errorText;

  UserErrorState({required this.errorText});

  @override
  List<Object?> get props => [];
}
