import 'package:default_project/cubits/user/year_cubit.dart';
import 'package:default_project/cubits/user/year_state.dart';
import 'package:default_project/data/models/year_model.dart';
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
    BlocProvider.of<YearCubit>(context).getAllUsers();
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
      body: BlocConsumer<YearCubit, YearState>(
        builder: (context, state) {
          if (state is YearSuccessState) {
            return ListView(
              children: [
                ...List.generate(
                  state.yearModels.length,
                  (index) {
                    YearModel yearModel = state.yearModels[index];
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.h),
                          Text(
                            yearModel.year.toString(),
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            yearModel.month.toString(),
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            yearModel.daysModel.toString(),
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                        ],
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
        buildWhen: (previous, current) {
          return previous != current;
        },
        listener: (context, state) {
          if (state is YearErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
          if (state is YearLoadingState) {
            const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
