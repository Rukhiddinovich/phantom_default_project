import 'package:default_project/data/models/detail/one_call_data.dart';
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


  OneCallData oneCallData= OneCallData as OneCallData;

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
                    ),
                  ],
                ),
                Container(
                  width: 320.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: const LinearGradient(
                      colors: [Colors.white, Colors.white60],
                    ),
                  ),
                  child: Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(
                          oneCallData.daily.length,
                              (index) => ListTile(
                            leading: Text(
                              MyUtils.getWeekday(
                                  oneCallData.daily[index].dt.toString())
                                  .toString()
                                  .substring(10, 16),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  fontFamily: "Poppins",
                                  color: AppColors.C_303345),
                            ),
                            trailing: SizedBox(
                              width: 125.w,
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://openweathermap.org/img/wn/${oneCallData.daily[index].weather[0].icon}@2x.png",
                                  ),
                                  Text(
                                    "${(oneCallData.daily[0].dailyTemp)}\n",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: AppColors.C_303345),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
