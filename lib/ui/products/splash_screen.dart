import 'package:default_project/ui/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToWelcomeScreen(context);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0.h,
      ),
      body: Center(
        child: Text(
          "New Application", style: TextStyle(
            fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: "Poppins",color: Colors.teal),
        ),
      ),
    );
  }

  void _navigateToWelcomeScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
    },
    );
  }
}
