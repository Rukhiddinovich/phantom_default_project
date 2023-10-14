import 'package:default_project/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {super.key, required this.buttonText, required this.buttonColor});

  final String buttonText;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 46.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: buttonColor),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
