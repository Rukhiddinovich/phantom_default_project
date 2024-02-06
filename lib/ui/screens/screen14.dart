import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenFourteen extends StatefulWidget {
  const ScreenFourteen({super.key});

  @override
  State<ScreenFourteen> createState() => _ScreenFourteenState();
}

class _ScreenFourteenState extends State<ScreenFourteen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation decorationAnimation;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    decorationAnimation = DecorationTween(
      begin: BoxDecoration(
          border: Border.all(width: 5.w, color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(0)),
      end: BoxDecoration(
          border: Border.all(width: 5.w, color: Colors.black),
          color: Colors.black,
          borderRadius: BorderRadius.circular(20.r)),
    ).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 14",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 0),
              width: 200.w,
              height: 200.h,
              decoration: decorationAnimation.value,
              child: FlutterLogo(
                size: 150.r
              ),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {
                isTapped ? controller.reverse() : controller.forward();
                isTapped = !isTapped;
              },
              child: Text(
                "Click me",
                style: TextStyle(fontSize: 20.sp, fontFamily: "Poppins"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
