import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenNine extends StatefulWidget {
  const ScreenNine({super.key});

  @override
  State<ScreenNine> createState() => _ScreenNineState();
}

class _ScreenNineState extends State<ScreenNine>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation decorationAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3)
    );
    decorationAnimation = DecorationTween(
        begin: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 5, color: Colors.orange),
            color: Colors.yellow),
        end: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 50, color: Colors.red),
            color: Colors.deepPurple))
        .animate(controller);

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
          "Screen 9",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 0),
          width: 200.w,
          height: 200.h,
          decoration: decorationAnimation.value,
        ),
      ),
    );
  }
}