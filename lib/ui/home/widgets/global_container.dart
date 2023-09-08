import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalContainer extends StatelessWidget {
  const GlobalContainer({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: color),
    );
  }
}
