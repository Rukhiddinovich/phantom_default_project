import 'package:default_project/cubits/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit():super(LoginState(email: "", password: ""));



}