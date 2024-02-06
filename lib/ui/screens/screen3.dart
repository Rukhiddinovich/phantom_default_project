import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeHeightAnimation;
  late Animation sizeWidthAnimation;
  late Animation borderAnimation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    colorAnimation = ColorTween(begin: Colors.red, end: Colors.green)
        .animate(animationController);

    sizeHeightAnimation = Tween<double>(begin: 300.0.w, end: 50.0.w).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.linear,
            reverseCurve: Curves.linear))
      ..addListener(() {});
    sizeWidthAnimation = Tween<double>(begin: 100.0.w, end: 300.0.w).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.linear,
            reverseCurve: Curves.linear))
      ..addListener(() {});

    borderAnimation =
        Tween<double>(begin: 5.0, end: 50.0).animate(animationController);

    animationController.addListener(() {});

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 3",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,fontFamily: "Poppins",color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: sizeHeightAnimation.value,
              width: sizeWidthAnimation.value,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderAnimation.value),
                  color: colorAnimation.value),
              duration: const Duration(seconds: 1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },

        child: Icon(Icons.slow_motion_video_sharp, size: 20.sp),
      ),
    );
  }
}
