import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTen extends StatefulWidget {
  const ScreenTen({super.key});

  @override
  State<ScreenTen> createState() => _ScreenTenState();
}

class _ScreenTenState extends State<ScreenTen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation alignAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    alignAnimation = AlignmentTween(
            begin: Alignment.topLeft, end: Alignment.bottomRight)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 10",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.w,
              height: 300.h,
              color: Colors.lightBlueAccent,
              child: AnimatedAlign(
                alignment: alignAnimation.value,
                duration: const Duration(seconds: 0),
                child: Text(
                  "Woolha.com",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
                controller.reset();
                controller.forward();
              },
              child: Text(
                "Change Alignment",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
