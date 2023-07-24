import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTen extends StatefulWidget {
  const ScreenTen({super.key});

  @override
  State<ScreenTen> createState() => _ScreenTenState();
}

class _ScreenTenState extends State<ScreenTen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation decorationAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
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
          "Screen 10",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 0),
          width: 200.w,
          height: 200.h,
          decoration: decorationAnimation.value,
        ),
      ),
    );
  }
}