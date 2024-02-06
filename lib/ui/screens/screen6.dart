import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ScreenSix extends StatefulWidget {
  const ScreenSix({super.key});

  @override
  State<ScreenSix> createState() => _ScreenSixState();
}

class _ScreenSixState extends State<ScreenSix> {
  bool _first = true;
  double _fontSize = 40;
  Color _color = Colors.cyan;
  double _height = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Screen 6",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 210.h,
              child: AnimatedDefaultTextStyle(
                curve: Curves.bounceOut,
                duration: const Duration(milliseconds: 350),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: 10.h),
                    Text("Flutter Dev's"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    _fontSize = _first ? 60 : 40;
                    _color = _first ? Colors.blue : Colors.brown;
                    _first = !_first;
                    _height = _first ? 100 : 130;
                  });
                },
                child: const Text(
                  "Click Here!!",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
