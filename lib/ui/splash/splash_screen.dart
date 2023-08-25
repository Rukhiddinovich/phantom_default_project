import 'package:default_project/cubits/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../cubits/login/login_state.dart';
import '../../utils/icons.dart';
import '../app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<LoginCubit>(context).checkLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return Center(
            child: Lottie.asset(AppImages.loading),
          );
        },
        listener: (context, state) {
          if (state is LoginUnLoggedState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
          if (state is LoggedState) {
            Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
          }
        },
      ),
    );
  }
}
