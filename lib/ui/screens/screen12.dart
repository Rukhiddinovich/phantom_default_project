import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTwelve extends StatefulWidget {
  const ScreenTwelve({super.key});

  @override
  State<ScreenTwelve> createState() => _ScreenTwelveState();
}

class _ScreenTwelveState extends State<ScreenTwelve>  with SingleTickerProviderStateMixin{
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
          "Screen 12",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
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