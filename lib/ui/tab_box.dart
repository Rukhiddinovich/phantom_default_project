import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:default_project/ui/home/news_screen.dart';
import 'package:default_project/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  List<Widget> screens = [];

  int currentIndex = 0;

  @override
  void initState() {
    screens = [
      const NewsScreen(),
      const ProfileScreen(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.teal,
        buttonBackgroundColor: Colors.teal,
        height: 60.h,
        items: <Widget>[
          Icon(Icons.home_filled, color: Colors.white, size: 30.sp),
          Icon(Icons.person, color: Colors.white, size: 30.sp),
        ],
        onTap: (index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
      ),
    );
  }
}
