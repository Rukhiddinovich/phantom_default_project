import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalContainer extends StatelessWidget {
  const GlobalContainer({super.key, required this.title, required this.icon, required this.onTap});

  final String title;
  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ZoomTapAnimation(
          onTap: onTap,
          child: Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(10.r), color: Colors.white),
            child: Column(
              children: [
                Center(child: icon),
                10.ph,
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
