import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> routeNames = [
    firstScreenRoute,
    secondScreenRoute,
    thirdScreenRoute,
    fourthScreenRoute,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Animations",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              routeNames.length,
              (index) => ListTile(
                title: Text(
                  "Screen ${index + 1}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      fontFamily: "Poppins",
                      color: Colors.black),
                ),
                onTap: () {
                  Navigator.pushNamed(context, routeNames[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
