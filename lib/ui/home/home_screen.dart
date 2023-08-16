import 'package:default_project/ui/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.lightBlueAccent),
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          "Menu Screen",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 150.h),
          ZoomTapAnimation(
            onTap: (){
              Navigator.pushNamed(context, RouteNames.flagScreen);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 90.r),
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r), color: Colors.lightBlueAccent),
              child: Center(
                child: Text(
                  "Flag Uzbekistan",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 90.h),
          ZoomTapAnimation(
            onTap: (){
              Navigator.pushNamed(context, RouteNames.snowmanScreen);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 90.r),
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r), color: Colors.lightBlueAccent),
              child: Center(
                child: Text(
                  "Snowman",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 90.h),
          ZoomTapAnimation(
            onTap: (){
              Navigator.pushNamed(context, RouteNames.stickersScreen);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 90.r),
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r), color: Colors.lightBlueAccent),
              child: Center(
                child: Text(
                  "Stickers",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
