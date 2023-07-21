import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../local/storage_repository.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';

String query = '';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.onSearchTap});

  final VoidCallback onSearchTap;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.sky,
              width: double.infinity.w,
              height: double.infinity.h,
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 250.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "Search",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              fontFamily: "Poppins",
                              color: AppColors.C_303345),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: AppColors.white),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.C_303345),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(18.sp),
                      hintText: "Search Location",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          fontFamily: "Poppins",
                          color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(
                              width: 1, color: AppColors.white)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(
                              width: 1, color: Colors.lightBlue)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(
                              width: 1, color: AppColors.white)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                ZoomTapAnimation(
                  onTap: () {
                    StorageRepository.putString("region", controller.text);
                    widget.onSearchTap.call();
                    query = controller.text;
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: Colors.lightBlue,
                    ),
                    child: Center(
                        child: Text("Apply",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.C_303345))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
