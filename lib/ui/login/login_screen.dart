import 'package:default_project/cubits/login/login_cubit.dart';
import 'package:default_project/local/storage_repository/storage_repository.dart';
import 'package:default_project/ui/app_routes.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/login/widgets/global_text_field.dart';
import 'package:default_project/ui/login/widgets/global_text_filed_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../cubits/login/login_state.dart';
import '../../utils/icons.dart';
import '../../utils/ui_utils/error_message_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.blueAccent),
        title: Text(
          "Login Screen",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 15.r,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset(AppImages.login),
                Center(
                  child: Text(
                    "Login Screen",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20.h),
                GlobalTextField(
                  hintText: "Username",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: usernameController,
                  prefixIcon: const Icon(Icons.email, color: Colors.black),
                ),
                SizedBox(height: 10.h),
                GlobalTextFieldPassword(
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.start,
                    prefixIcon: Icons.key_outlined,
                    onChanged: (v) {
                      password = v;
                    }),
                SizedBox(height: 60.h),
                ZoomTapAnimation(
                  onTap: () {
                    if (password.isEmpty || usernameController.text.isEmpty) {
                      showErrorMessage(
                          message: "Fill in the fields!", context: context);
                    } else {
                      if (StorageRepository.getString("username") ==
                              usernameController.text &&
                          StorageRepository.getString("password") == password) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                      context.read<LoginCubit>().loginUser(
                          username: usernameController.text,
                          password: password);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 90.w),
                    width: 200.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.blueAccent),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacementNamed(
              context,
              RouteNames.loginUpdate,
            );
          }

          if (state is LoginErrorState) {
            print('faARRUXXXXXXXXXX');
            showErrorMessage(message: state.errorText, context: context);
          }
          if (state is LoginLoadingState) {
            const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
