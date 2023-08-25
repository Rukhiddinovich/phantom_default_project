import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginUpdateScreen extends StatefulWidget {
  const LoginUpdateScreen({super.key});

  @override
  State<LoginUpdateScreen> createState() => _LoginUpdateScreenState();
}

class _LoginUpdateScreenState extends State<LoginUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Edit",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
