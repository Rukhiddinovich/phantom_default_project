import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "Привет, Максим",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(width: 63.w),

            ],
          )
        ],
      ),
    );
  }
}
