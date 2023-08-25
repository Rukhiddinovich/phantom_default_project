import 'package:default_project/cubits/login/login_cubit.dart';
import 'package:default_project/ui/login/widgets/global_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../cubits/login/login_state.dart';
import '../../utils/icons.dart';
import '../../utils/ui_utils/error_message_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController gmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Center(child: CupertinoActivityIndicator(),);
          }
            return ListView(
              children: [
                Lottie.asset(AppImages.login),
                GlobalTextField(
                  hintText: "Enter email",
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: gmailController,
                  prefixIcon: const Icon(Icons.email),
                ),
                SizedBox(height: 10.h),
                GlobalTextField(
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: passwordController,
                  prefixIcon: const Icon(Icons.key_outlined),
                ),
                SizedBox(height: 60.h),
              ],
            );
        },
        listener: (context, state) {
          if (state is LoginErrorState) {
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
