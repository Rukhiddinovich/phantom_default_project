import 'package:default_project/presentation/telegram/telegram_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/file_download_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/icons/icons.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_1C1C1D,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.C_1C1C1D,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_1C1C1D),
        title: Row(
          children: [
            ZoomTapAnimation(
                onTap: () {},
                child: Icon(Icons.arrow_back, size: 25.r, color: Colors.white)),
            SizedBox(width: 20.w),
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: Colors.blue),
              child: Center(
                  child: Icon(
                Icons.bookmark,
                size: 25.r,
                color: Colors.white,
              )),
            ),
            // Image.asset(AppImages.profile, width: 50.w, height: 50.h),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bro",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "last seen recently",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(CupertinoIcons.phone_fill, size: 25.r, color: Colors.white),
          SizedBox(width: 20.w),
          Icon(Icons.more_vert, size: 25.r, color: Colors.white),
          SizedBox(width: 10.w),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.telegramBackground,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          ListView(
            children: List.generate(
              filesData.length,
              (index) {
                var singleFile = filesData[index];
                return TelegramScreen(fileInfo: singleFile);
              },
            ),
          )
        ],
      ),
    );
  }
}
