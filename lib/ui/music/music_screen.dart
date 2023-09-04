import 'package:default_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_26292D,
      appBar: AppBar(
        backgroundColor: AppColors.C_1A1C1F,
        // elevation: 0,
        title: Text(
          "Music Player",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_1A1C1F),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 88,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ZoomTapAnimation(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    margin: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: AppColors.C_1A1C1F, blurRadius: 3.r),
                      ],
                    ),
                    child: Column(
                      children: [

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
