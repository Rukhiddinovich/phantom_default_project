import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenFifteen extends StatefulWidget {
  const ScreenFifteen({super.key});

  @override
  State<ScreenFifteen> createState() => _ScreenFifteenState();
}

class _ScreenFifteenState extends State<ScreenFifteen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation rateAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    rateAnimation = Tween(begin: 0, end: 3 * pi).animate(controller);
    sizeAnimation = Tween(begin: 100.0, end: 50.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 15",
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
          angle: rateAnimation.value,
          child: SizedBox(
            width: sizeAnimation.value * 2,
            height: sizeAnimation.value * 2,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    width: sizeAnimation.value,
                    height: sizeAnimation.value,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    width: sizeAnimation.value,
                    height: sizeAnimation.value,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                    width: sizeAnimation.value,
                    height: sizeAnimation.value,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.indigoAccent,
                    ),
                    width: sizeAnimation.value,
                    height: sizeAnimation.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
