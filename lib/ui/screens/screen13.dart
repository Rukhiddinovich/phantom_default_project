import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenThirteen extends StatefulWidget {
  const ScreenThirteen({super.key});

  @override
  State<ScreenThirteen> createState() => _ScreenThirteenState();
}

class _ScreenThirteenState extends State<ScreenThirteen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation<double> percentAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(animationController);
    sizeAnimation =
        Tween(begin: 0.0, end: 350.0.w).animate(animationController);
    percentAnimation =
        Tween<double>(begin: 0.0, end: 100.0).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 13",
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
            Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: colorAnimation.value),
            ),
            SizedBox(height: 50.h),
            Stack(
              children: [
                Container(
                  height: 50.h,
                  width: 350.w,
                  color: Colors.blue.withOpacity(0.7),
                ),
                Container(
                  height: 50.h,
                  width: sizeAnimation.value,
                  color: Colors.blueAccent,
                )
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              "${percentAnimation.value.toInt()} %",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
                onPressed: () {
                  animationController.reset();
                  animationController.forward();
                },
                child: const Text("Animate"))
          ],
        ),
      ),
    );
  }
}
