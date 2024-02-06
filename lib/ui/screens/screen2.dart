import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  bool isChanged = false;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation =
        ColorTween(begin: Colors.green, end: Colors.orange).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 2",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,fontFamily: "Poppins",color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.linear,
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: isChanged ? Colors.orange : Colors.green),
              child: Center(
                child: isSelected
                    ? Text(
                        "This is first widgets",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: "Poppins"),
                      )
                    : Text(
                        "This is second widgets",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: "Poppins"),
                      ),
              ),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {
                isChanged = !isChanged;
                isSelected = !isSelected;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: Text(
                "Click here",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
