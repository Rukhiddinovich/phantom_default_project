import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/detail/daily_item/daily_item.dart';
import '../../utils/colors.dart';

class SevenDaysScreen extends StatefulWidget {
  const SevenDaysScreen({super.key, required this.dailyItem });
  final List<DailyItem>? dailyItem;

  @override
  State<SevenDaysScreen> createState() => _SevenDaysScreenState();
}

class _SevenDaysScreenState extends State<SevenDaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "7 Days Weather Info",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.C_303345),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
