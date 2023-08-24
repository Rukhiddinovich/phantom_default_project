import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/cubits/user/user_cubit.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/ui_utils/error_message_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        title: Text(
          "Users",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccessState) {
            return ListView(
              children: [
                ...List.generate(
                  state.userModels.length,
                  (index) {
                    UserModel userModel = state.userModels[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      margin: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.teal,
                        boxShadow: [
                          BoxShadow(color: Colors.teal, blurRadius: 5.r),
                        ],
                      ),
                      child: ListTile(
                        leading: SizedBox(
                            height: 60.h,
                            width: 60.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: userModel.avatarUrl,
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(
                                        color: Colors.black),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                        ),
                        title: Text(
                          userModel.username,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (context, state) {
          if (state is UserErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
          if (state is UserLoadingState) {
            const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
