import 'package:default_project/cubits/login/login_cubit.dart';
import 'package:default_project/cubits/login/login_state.dart';
import 'package:default_project/ui/login/login_screen.dart';
import 'package:default_project/ui/login/widgets/global_text_field_contact.dart';
import 'package:default_project/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../local/storage_repository/storage_repository.dart';
import '../../utils/ui_utils/error_message_dialog.dart';
import '../app_routes.dart';
import '../login/widgets/global_text_field.dart';
import '../login/widgets/global_text_filed_password.dart';

class LoginUpdateScreen extends StatefulWidget {
  const LoginUpdateScreen({super.key});

  @override
  State<LoginUpdateScreen> createState() => _LoginUpdateScreenState();
}

class _LoginUpdateScreenState extends State<LoginUpdateScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: "+998 (##) ###-##-##",
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.blueAccent),
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Login Update",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return Center(
              child: CupertinoActivityIndicator(radius: 15.r),
            );
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AppImages.register),
                GlobalTextField(
                  hintText: "Name",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: nameController,
                  prefixIcon: const Icon(CupertinoIcons.person_alt_circle,
                      color: Colors.black),
                ),
                SizedBox(height: 10.h),
                GlobalTextFieldContact(
                  hintText: "Phone",
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: phoneController,
                  prefixIcon: const Icon(CupertinoIcons.phone_fill,
                      color: Colors.black),
                ),
                SizedBox(height: 10.h),
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
                SizedBox(height: 50.h),
                Center(
                  child: ZoomTapAnimation(
                    onTap: () {
                      if (nameController.text.isEmpty ||
                          phoneController.text.isEmpty ||
                          usernameController.text.isEmpty ||
                          password.isEmpty) {
                        showErrorMessage(
                            message: "Fill in the fields", context: context);
                      } else {
                        saveToShared(username: usernameController.text, password: password);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        // context.read<LoginCubit>().loginEdit(
                        //     token: StorageRepository.getString("tokens"),
                        //     name: nameController.text,
                        //     phone: phoneController.text,
                        //     username: usernameController.text,
                        //     password: password);
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
                )
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is LoginErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
          if (state is LoginUpdateSuccessState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
        },
      ),
    );
  }

  void saveToShared({required String username,required String password})async{
    await StorageRepository.putString("username", username);
    await StorageRepository.putString("password", password);
  }
}
