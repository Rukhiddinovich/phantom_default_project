import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ScreenEight extends StatefulWidget {
  const ScreenEight({super.key});

  @override
  State<ScreenEight> createState() => _ScreenEightState();
}

class _ScreenEightState extends State<ScreenEight>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation textAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    textAnimation = TextStyleTween(
            begin: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
            end: TextStyle(
                fontSize: 50.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700))
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }
  bool isSmall=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 7",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: AnimatedDefaultTextStyle(
                style: textAnimation.value,
                duration: const Duration(seconds: 0),
                child: const Text(
                  "Hello! Welcome Tutorial.This is basic demonstration of animation in Flutter",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
              ),
            ),
            ZoomTapAnimation(
              child: Container(
                width: double.infinity,
                height: 50.h,
                color: Colors.grey,
                child: const Center(
                  child: Text(
                    "Bigger text",
                    style: TextStyle(fontFamily: "Poppins"),
                  ),
                ),
              ),
              onTap: () {
                isSmall=!isSmall;
                !isSmall?controller.reverse():controller.forward();
              },
            )
          ],
        ),
      ),
    );
  }
}
