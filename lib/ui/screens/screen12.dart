import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ScreenTwelve extends StatefulWidget {
  const ScreenTwelve({super.key});

  @override
  State<ScreenTwelve> createState() => _ScreenTwelveState();
}

class _ScreenTwelveState extends State<ScreenTwelve>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation paddingAnimation;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    paddingAnimation = Tween(begin: 10.0, end: 100.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 12",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomTapAnimation(
            onTap: () {
              isTapped ? controller.reverse() : controller.forward();
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: AnimatedPadding(
              padding: EdgeInsets.symmetric(horizontal: paddingAnimation.value),
              duration: const Duration(seconds: 0),
              child: Container(
                height: 100.h,
                width: double.infinity,
                color: Colors.blueAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
