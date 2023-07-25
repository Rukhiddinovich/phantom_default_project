
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../provider/calculate_provider.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculateProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Calculator",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Center(
                child: Container(
                  width: 300.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: AppColors.C_008E06,width: 3.w),
                      color: AppColors.C_D9D9D9),
                  child: Consumer<CalculateProvider>(
                    builder: (context, answer, child) {
                      return answer.getAnswer() != 0
                          ? Center(
                            child: Text(
                                answer.getAnswer().toString(),
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Colors.black),
                              ),
                          )
                          : const SizedBox();
                    },
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(6),
                        ],
                        controller: number1,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        // textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                          border: InputBorder.none,
                          hintText: "Number 1",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            fontFamily: "Poppins",
                            color: Colors.grey,
                          ),
                          fillColor: Colors.black,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.green)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(6),
                        ],
                        controller: number2,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        // textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                          border: InputBorder.none,
                          hintText: "Number 2",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            fontFamily: "Poppins",
                            color: Colors.grey,
                          ),
                          fillColor: Colors.black,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.green)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ZoomTapAnimation(
                    onTap: (){
                      if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                        provider.add(
                            int.parse(number1.text), int.parse(number2.text));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter both numbers",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: Container(
                      width: 65.w,
                      height: 65.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                      child: Center(
                        child: SvgPicture.asset(AppImages.addition),
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: (){
                      if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                        provider.subtraction(
                            int.parse(number1.text), int.parse(number2.text));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter both numbers",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: Container(
                      width: 65.w,
                      height: 65.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                      child: Center(
                        child: SvgPicture.asset(AppImages.subtraction),
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: (){
                      if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                        provider.multiplication(
                            int.parse(number1.text), int.parse(number2.text));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter both numbers",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: Container(
                      width: 65.w,
                      height: 65.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                      child: Center(
                        child: SvgPicture.asset(AppImages.multiplication),
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: (){
                      if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                        provider.division(
                            int.parse(number1.text), int.parse(number2.text));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter both numbers",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: Container(
                      width: 65.w,
                      height: 65.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                      child: Center(
                        child: SvgPicture.asset(AppImages.toBe),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ZoomTapAnimation(
                onTap: (){
                  number1.clear();
                  number2.clear();
                  provider.clear();
                },
                child: Container(
                  width: 350.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.C_FF4D00
                  ),
                  child: Center(
                    child: Text("Numbers Clear",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white),),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  ZoomTapAnimation(
                    onTap: (){
                      if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                        provider.mediumGeometric(
                            int.parse(number1.text), int.parse(number2.text));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter both numbers",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: Container(
                      width: 170.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.C_D9D9D9
                      ),
                      child: Center(
                        child: Text("Medium Geometric",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 15.sp,color: AppColors.C_008E06),),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ZoomTapAnimation(
                    onTap: (){
                      if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                        provider.middleArithmetic(
                            int.parse(number1.text), int.parse(number2.text));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter both numbers",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: Container(
                      width: 170.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColors.C_D9D9D9
                      ),
                      child: Center(
                        child: Text("Middle Arithmetic",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 15.sp,color: AppColors.C_008E06),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ZoomTapAnimation(
                onTap: (){
                  if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                    provider.sumOfNumbers(
                        int.parse(number1.text), int.parse(number2.text));
                  } else {
                    Fluttertoast.showToast(
                      msg: "Please enter both numbers",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                  }
                },
                child: Container(
                  width: 170.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.C_D9D9D9
                  ),
                  child: Center(
                    child: Text("Sum Of Numbers",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 15.sp,color: AppColors.C_008E06),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
