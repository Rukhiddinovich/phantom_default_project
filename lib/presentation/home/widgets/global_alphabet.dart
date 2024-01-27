import 'package:default_project/provider/theme_provider.dart';
import 'package:default_project/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GlobalAlphabet extends StatelessWidget {
  const GlobalAlphabet({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color:Provider.of<ThemeProvider>(context).isDarkMode ? AppColors.C_32383E : AppColors.passiveTextColor),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              color: Colors.white),
        ),
      ),
    );
  }
}
