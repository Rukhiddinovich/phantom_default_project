import 'package:default_project/utils/my_utils.dart';
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
                SizedBox(height: 40.h),
                Row(
                  children: [
                    Center(
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 25.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 95.w,vertical: 6.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            "7 Days",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                fontFamily: "Poppins",
                                color: AppColors.C_303345),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85.h,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.dailyItem?.length,
                      itemBuilder: (item, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white60],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                MyUtils.getWeekday(
                                    widget.dailyItem?[index].dt.toString() ?? ""),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    fontFamily: "Poppins",
                                    color: AppColors.C_303345),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${(widget.dailyItem?[0].dailyTemp)}\n",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: AppColors.C_303345),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 40.h),
                                    child: Image.network(
                                        "https://openweathermap.org/img/wn/${widget.dailyItem?[index].weather[0].icon}@2x.png",
                                        width: 90.w),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
