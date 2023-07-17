import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/detail/daily_item/daily_item.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';

class SevenDaysScreen extends StatefulWidget {
  const SevenDaysScreen({super.key, required this.dailyItem});

  final List<DailyItem>? dailyItem;

  @override
  State<SevenDaysScreen> createState() => _SevenDaysScreenState();
}

class _SevenDaysScreenState extends State<SevenDaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.sky,
              width: double.infinity.w,
              height: double.infinity.h,
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 25.sp,
                        )),
                    SizedBox(width: 10.w),
                    Center(
                      child: Container(
                        width: 250.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            "7 Days Weather Info",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                fontFamily: "Poppins",
                                color: AppColors.C_303345),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
