import 'package:default_project/utils/colors.dart';
import 'package:default_project/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const Spacer(),
          TextField(
            controller: controller,
            cursorColor: Colors.white,
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w500,fontFamily: "Poppins",color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: ZoomTapAnimation(
                onTap: (){
                  controller.text=controller.text.substring(0,controller.text.length-1);
                },
                child: Container(
                  width: 65.w,
                  height: 65.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                  ),
                  child: Center(child: SvgPicture.asset(AppImages.back,width: 30.w),),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              border: InputBorder.none,
              hintText: "0",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
                fontFamily: "Poppins",
                color: Colors.grey,
              ),
              fillColor: Colors.black,
              filled: true,

              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(width: 1.w, color: Colors.black)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(width: 1.w, color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(width: 1.w, color: Colors.black)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.r),
                  borderSide: BorderSide(width: 1.w, color: Colors.black)),
            ),
          ),
          const Divider(),
          SizedBox(height: 95.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text="";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: SvgPicture.asset(AppImages.clear),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){},
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: SvgPicture.asset(AppImages.bracket),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){},
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: SvgPicture.asset(AppImages.percentage),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){},
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: SvgPicture.asset(AppImages.toBe),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="7";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child:  Text("7",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="8";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: Text("8",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="9";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child:  Text("9",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){},
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: SvgPicture.asset(AppImages.multiplication),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="4";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child:  Text("4",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="5";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: Text("5",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="6";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child:  Text("6",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){},
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: SvgPicture.asset(AppImages.subtraction),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="1";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child:  Text("1",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="2";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: Text("2",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="3";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child:  Text("3",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){},
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: SvgPicture.asset(AppImages.addition),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ZoomTapAnimation(
                      onTap: (){},
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child:  SvgPicture.asset(AppImages.plusMinus,color: Colors.black),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+="0";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child: Text("0",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        controller.text+=".";
                      },
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_D9D9D9),
                        child: Center(
                          child:  Text(".",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 30.sp,color: Colors.black),),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){},
                      child: Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.C_008E06),
                        child: Center(
                          child: SvgPicture.asset(AppImages.equal),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
