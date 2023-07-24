import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenThirteen extends StatefulWidget {
  const ScreenThirteen({super.key});

  @override
  State<ScreenThirteen> createState() => _ScreenThirteenState();
}

class _ScreenThirteenState extends State<ScreenThirteen>  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 3));

    sizeAnimation=Tween(begin: 100.0,end: 300.0).animate(controller);
    controller.addListener(() {setState(() {

    });});

    controller.forward();

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
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: AnimatedSize(
          duration: const Duration(seconds: 0),
          child: Container(
            color: Colors.yellow,
            child: FlutterLogo(size: sizeAnimation.value,),
          ),
        ),
      ),
    );
  }
}