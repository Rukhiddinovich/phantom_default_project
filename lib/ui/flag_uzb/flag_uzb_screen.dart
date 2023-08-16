import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlagUzbScreen extends StatefulWidget {
  const FlagUzbScreen({super.key});

  @override
  State<FlagUzbScreen> createState() => _FlagUzbScreenState();
}

class _FlagUzbScreenState extends State<FlagUzbScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.lightBlueAccent),
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Flag Uzbekistan',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              child: CustomPaint(
                size: Size(double.infinity, 305.h),
                painter: MyPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()..color = Colors.blue;
    var paint2 = Paint()..color = Colors.white;
    var paint3 = Paint()..color = const Color(0xFF07EE0F);
    Rect rect = Offset(20.w, 10.h) & Size(60.h, 70.h);
    const startAngle = pi / 2 - 0.3;
    // const sweepAngle = sweepAngle;
    // const useCenter = true;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 6;

    Rect rect2 = Offset(30.w, 10.h) & Size(60.h, 70.h);
    const startAngle2 = pi / 2;
    // const sweepAngle = sweepAngle;
    // const useCenter2 = true;
    final paint4 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 6;

    var star = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    // moveTo and  lineTo
    //1
    path.moveTo(160, 20);
    path.lineTo(168, 50);
    path.moveTo(160, 21);
    path.lineTo(152, 40);
    path.lineTo(152, 40);
    path.lineTo(172, 28);
    path.lineTo(148, 28);
    path.lineTo(168, 40);

    path.moveTo(190, 20);
    path.lineTo(198, 50);
    path.moveTo(190, 21);
    path.lineTo(182, 40);
    path.lineTo(182, 40);
    path.lineTo(202, 28);
    path.lineTo(178, 28);
    path.lineTo(198, 40);

    path.moveTo(220, 20);
    path.lineTo(228, 50);
    path.moveTo(220, 21);
    path.lineTo(212, 40);
    path.lineTo(212, 40);
    path.lineTo(232, 28);
    path.lineTo(208, 28);
    path.lineTo(228, 40);

    //2
    path.moveTo(130, 40);
    path.lineTo(138, 70);
    path.moveTo(130, 41);
    path.lineTo(122, 60);
    path.lineTo(122, 60);
    path.lineTo(142, 48);
    path.lineTo(118, 48);
    path.lineTo(138, 60);

    path.moveTo(160, 40);
    path.lineTo(168, 70);
    path.moveTo(160, 41);
    path.lineTo(152, 60);
    path.lineTo(152, 60);
    path.lineTo(172, 48);
    path.lineTo(148, 48);
    path.lineTo(168, 60);

    path.moveTo(190, 40);
    path.lineTo(198, 70);
    path.moveTo(190, 41);
    path.lineTo(182, 60);
    path.lineTo(182, 60);
    path.lineTo(202, 48);
    path.lineTo(178, 48);
    path.lineTo(198, 60);

    path.moveTo(220, 40);
    path.lineTo(228, 70);
    path.moveTo(220, 41);
    path.lineTo(212, 60);
    path.lineTo(212, 60);
    path.lineTo(232, 48);
    path.lineTo(208, 48);
    path.lineTo(228, 60);

//3
    path.moveTo(130, 40);
    path.lineTo(138, 70);
    path.moveTo(130, 41);
    path.lineTo(122, 60);
    path.lineTo(122, 60);
    path.lineTo(142, 48);
    path.lineTo(118, 48);
    path.lineTo(138, 60);

    path.moveTo(100, 60);
    path.lineTo(108, 90);
    path.moveTo(100, 61);
    path.lineTo(92, 80);
    path.lineTo(92, 80);
    path.lineTo(112, 68);
    path.lineTo(88, 68);
    path.lineTo(108, 80);
    // moveTo and  lineTo
    path.moveTo(130, 60);
    path.lineTo(138, 90);
    path.moveTo(130, 61);
    path.lineTo(122, 80);
    path.lineTo(122, 80);
    path.lineTo(142, 68);
    path.lineTo(118, 68);
    path.lineTo(138, 80);

    path.moveTo(160, 60);
    path.lineTo(168, 90);
    path.moveTo(160, 61);
    path.lineTo(152, 80);
    path.lineTo(152, 80);
    path.lineTo(172, 68);
    path.lineTo(148, 68);
    path.lineTo(168, 80);

    path.moveTo(190, 60);
    path.lineTo(198, 90);
    path.moveTo(190, 61);
    path.lineTo(182, 80);
    path.lineTo(182, 80);
    path.lineTo(202, 68);
    path.lineTo(178, 68);
    path.lineTo(198, 80);

    path.moveTo(220, 60);
    path.lineTo(228, 90);
    path.moveTo(220, 61);
    path.lineTo(212, 80);
    path.lineTo(212, 80);
    path.lineTo(232, 68);
    path.lineTo(208, 68);
    path.lineTo(228, 80);

    canvas.drawRect(const Offset(0.0, 0.0) & Size(size.width, 95.h), paint1);
    canvas.drawArc(rect, startAngle, pi + 0.5, false, paint);
    canvas.drawArc(rect2, startAngle2, pi, false, paint4);
    canvas.drawPath(path, star);
    canvas.drawRect(Offset(0.0, 105.h) & Size(size.width, 95.h), paint2);
    canvas.drawRect(Offset(0.0, 210.h) & Size(size.width, 95.h), paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}