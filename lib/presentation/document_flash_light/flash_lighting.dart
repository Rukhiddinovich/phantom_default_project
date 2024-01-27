import 'package:default_project/provider/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors/colors.dart';
import '../home/widgets/global_alphabet.dart';

class MorseAlphabetRead extends StatefulWidget {
  const MorseAlphabetRead({super.key});

  @override
  _MorseAlphabetReadState createState() => _MorseAlphabetReadState();
}

class _MorseAlphabetReadState extends State<MorseAlphabetRead> {
  List<String> morseCodes = [];
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.C_17191C,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
          ),
        ),
        elevation: 0,
        title: Text(
          "Morse Alphabet",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            constraints: BoxConstraints(maxHeight: 200, minHeight: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Provider.of<ThemeProvider>(context).isDarkMode
                    ? AppColors.C_32383E
                    : AppColors.passiveTextColor),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              child: Wrap(
                children: morseCodes.map((code) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      code,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: "Poppins",
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAlphabetButton("A", ".-"),
                    buildAlphabetButton("B", "-..."),
                    buildAlphabetButton("C", "-.-."),
                    buildAlphabetButton("D", "-.."),
                    buildAlphabetButton("E", "."),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAlphabetButton("F", "..-."),
                    buildAlphabetButton("G", "--."),
                    buildAlphabetButton("H", "...."),
                    buildAlphabetButton("I", ".."),
                    buildAlphabetButton("J", ".---"),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAlphabetButton("K", "-.-"),
                    buildAlphabetButton("L", ".-.."),
                    buildAlphabetButton("M", "--"),
                    buildAlphabetButton("N", "-."),
                    buildAlphabetButton("O", "---"),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAlphabetButton("P", ".--."),
                    buildAlphabetButton("Q", "--.-"),
                    buildAlphabetButton("R", ".-."),
                    buildAlphabetButton("S", "..."),
                    buildAlphabetButton("T", "-"),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAlphabetButton("U", "..-"),
                    buildAlphabetButton("V", "...-"),
                    buildAlphabetButton("W", ".--"),
                    buildAlphabetButton("X", "-..-"),
                    buildAlphabetButton("Y", "-.--"),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildAlphabetButton("Z", "--.."),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          HapticFeedback.vibrate();
          setState(() {
            morseCodes.clear();
          });
        },
        child: const Icon(
          Icons.cleaning_services,
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget buildAlphabetButton(String letter, String code) {
    return ZoomTapAnimation(
      onTap: () {
        HapticFeedback.vibrate();

        setState(() {
          morseCodes.add("$letter:  $code");
        });
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: GlobalAlphabet(text: letter),
    );
  }
}
