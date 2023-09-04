import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        title: Text(
          "Products Screen",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
