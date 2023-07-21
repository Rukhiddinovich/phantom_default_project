import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween<double>(begin: 0, end: 4 * pi).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.repeat();
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
          "Screen 1",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,fontFamily: "Poppins",color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r), color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
