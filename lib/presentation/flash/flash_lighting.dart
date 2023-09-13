import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors/colors.dart';
import '../home/widgets/global_alphabet.dart';

class MorseAlphabetRead extends StatelessWidget {
  const MorseAlphabetRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_17191C,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_17191C),
        backgroundColor: AppColors.C_17191C,
        elevation: 0,
        title: Text(
          "Morse Alphabet",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 120.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "A")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "B")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "C")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "D")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "E")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "F")),
                ZoomTapAnimation(
                    onTap:  () {},
                    child: const GlobalAlphabet(text: "G")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "H")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "I")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "J")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "K")),
                ZoomTapAnimation(
                    onTap:  () {},
                    child: const GlobalAlphabet(text: "L")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "M")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "N")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "O")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "P")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "Q")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "R")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "S")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "T")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "U")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "V")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "W")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "X")),
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "Y")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomTapAnimation(
                    onTap: () {},
                    child: const GlobalAlphabet(text: "Z")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
