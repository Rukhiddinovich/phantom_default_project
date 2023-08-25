import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}
class LoginSuccessState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginUpdateSuccessState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginUnLoggedState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoggedState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  final String errorText;

  LoginErrorState({required this.errorText});

  @override
  List<Object?> get props => [];
}

class GetUserSuccessState extends LoginState{
  @override
  List<Object?> get props => [];
}


