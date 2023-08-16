import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnowmanScreen extends StatelessWidget {
  const SnowmanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.lightBlueAccent),
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Snowman',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(200, 400),
          painter: SnowmanPainter(),
        ),
      ),
    );
  }
}

class SnowmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final Paint buttonPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final Paint nosePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final Paint whiteFillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var path = Path();

    var leftHand = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    path.moveTo(49, 182);
    path.lineTo(45, 190);
    path.lineTo(-20, 170);
    path.lineTo(-45, 181);
    path.lineTo(-48, 175);
    path.lineTo(-30, 165);
    path.lineTo(-59, 160);
    path.lineTo(-58, 154);
    path.lineTo(-30, 159);
    path.lineTo(-45, 140);
    path.lineTo(-40, 134);
    path.lineTo(-40, 134);
    path.lineTo(-15, 161);
    path.lineTo(49, 182);

    var path2 = Path();

    var rightHand = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    path2.moveTo(169, 181);
    path2.lineTo(229, 160);
    path2.lineTo(240, 140);
    path2.lineTo(247, 140);
    path2.lineTo(237, 159);
    path2.lineTo(264, 148);
    path2.lineTo(266, 155);
    path2.lineTo(238, 166);
    path2.lineTo(267, 175);
    path2.lineTo(263, 180);
    path2.lineTo(230, 170);
    path2.lineTo(230, 170);
    path2.lineTo(169, 190);

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.75),
        width: 180,
        height: 140,
      ),
      whiteFillPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.75),
        width: 180,
        height: 160,
      ),
      blackPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.5),
        width: 140,
        height: 120,
      ),
      whiteFillPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.5),
        width: 140,
        height: 120,
      ),
      blackPaint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.3),
        width: 100,
        height: 90,
      ),
      whiteFillPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.3),
        width: 100,
        height: 90,
      ),
      blackPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.2),
        width: 110,
        height: 30,
      ),
      blackPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.2),
        width: 108,
        height: 28,
      ),
      whiteFillPaint,
    );

    const double squareSize = 60;
    final double squareLeft = (size.width - squareSize) / 2;
    final double squareTop = size.height * 0.02;
    const double borderRadius = 10;

    final roundedRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(squareLeft, squareTop, squareSize, squareSize),
      const Radius.circular(borderRadius),
    );

    canvas.drawRRect(
      roundedRect,
      whiteFillPaint,
    );

    canvas.drawRRect(
      roundedRect,
      blackPaint,
    );

    canvas.drawCircle(
        Offset(size.width / 2 - 2, size.height * 0.27), 5, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 + 25, size.height * 0.27), 5, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 - 15, size.height * 0.35), 4, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 + 0, size.height * 0.36), 4, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 + 15, size.height * 0.36), 4, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 + 30, size.height * 0.346), 4, buttonPaint);

    final nosePath = Path();

    nosePath.moveTo(size.width * 0.54, size.height * 0.3);
    nosePath.lineTo(size.width * 0.83, size.height * 0.28);
    nosePath.lineTo(size.width * 0.55, size.height * 0.33);
    nosePath.close();
    canvas.drawLine(
        const Offset(34.7, 178.7),
        const Offset(32.5, 184.6),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4);
    canvas.drawLine(
        const Offset(70, 60),
        const Offset(129, 60),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 3);
    canvas.drawPath(path2, rightHand);
    canvas.drawPath(path, leftHand);
    canvas.drawPath(nosePath, whiteFillPaint);
    canvas.drawPath(nosePath, nosePaint);
    for (var i = 0; i < 3; i++) {
      canvas.drawCircle(Offset(size.width / 1.75, size.height * 0.47 + 20 * i),
          5, buttonPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
