import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StickersScreen extends StatefulWidget {
  const StickersScreen({Key? key}) : super(key: key);

  @override
  State<StickersScreen> createState() => _StickersScreenState();
}

class _StickersScreenState extends State<StickersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.lightBlueAccent),
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          "Stickers",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              fontFamily: "Poppins"),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(16.r),
             color: Colors.grey.withOpacity(0.4
             ),
           ),
            child: CustomPaint(
              size: const Size(150, 180),
              painter: MyPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    //Draw the body
    var paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);
    //Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCenter(center: center, width: radius, height: radius),
      0,
      pi,
      false,
      smilePaint,
    );
    //Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 15, Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 15, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
