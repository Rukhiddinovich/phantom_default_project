import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenFive extends StatefulWidget {
  const ScreenFive({super.key});

  @override
  State<ScreenFive> createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> iconAnimation;

  _init() {
    animationController
        .forward()
        .whenComplete(() => animationController.reverse());
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    iconAnimation = Tween<double>(begin: 30, end: 50).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Curves.bounceIn,
          reverseCurve: Curves.bounceIn),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});

    animation = Tween<double>(begin: 0, end: pi).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Logo",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Transform.rotate(
            angle: animation.value,
            child: Transform.rotate(
              angle: animation.value,
              child: SizedBox(
                width: 350.w,
                height: 350.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: FlutterLogo(size: 100.r),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FlutterLogo(size: 100.r),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlutterLogo(size: 100.r),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FlutterLogo(size: 100.r),
                    ),
                  ],
                ),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          _init();
        },
        child: Icon(Icons.reddit, size: iconAnimation.value),
      ),
    );
  }
}
