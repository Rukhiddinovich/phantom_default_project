import 'package:default_project/cubits/calculate/calculate_cubit.dart';
import 'package:default_project/cubits/calculate/calculate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  var firstNumberFormatter = MaskTextInputFormatter(
      mask: "####",
      filter: {"#": RegExp(r"[0-9]")},
      type: MaskAutoCompletionType.lazy);

  var secondNumberFormatter = MaskTextInputFormatter(
      mask: "###",
      filter: {"#": RegExp(r"[0-9]")},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    CalculateState calculateState =
        BlocProvider.of<CalculateCubit>(context).state;
    firstNumberController.text = calculateState.firstNumber.toString();
    secondNumberController.text = calculateState.secondNumber.toString();
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
          "Calculate Screen",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CalculateCubit, CalculateState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField(
                  controller: firstNumberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [firstNumberFormatter],
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      context
                          .read<CalculateCubit>()
                          .newFirstNumber(int.parse(value));
                    }
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      labelText: "First Number",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.teal)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.teal)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.teal)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.teal))),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField(
                  controller: secondNumberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [secondNumberFormatter],
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      context
                          .read<CalculateCubit>()
                          .newSecondNumber(int.parse(value));
                    }
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      labelText: "Second Number",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.teal)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.teal)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.teal)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(width: 1.w, color: Colors.teal))),
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: Text(
                  "Answer: ${state.answer.toString()}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
