import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        toolbarHeight: 0.h,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text1,style: TextStyle(fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            ),
            SizedBox(height: 20.h,),
            Text(
              widget.text2,style: TextStyle(fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
