import 'package:carousel_slider/carousel_slider.dart';
import 'package:default_project/ui/home/widgets/global_container.dart';
import 'package:default_project/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.blue),
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
          ),
          Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(width: 10.w),
                  Icon(Icons.more_vert, size: 25.r, color: Colors.white),
                  SizedBox(width: 20.w),
                  Container(
                    width: 280.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        const Icon(CupertinoIcons.search, color: Colors.grey),
                        SizedBox(width: 10.w),
                        Text(
                          "Search",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              color: Colors.grey),
                        ),
                        SizedBox(width: 130.w),
                        Container(
                          width: 0.5.w,
                          height: 38.h,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        const Icon(CupertinoIcons.qrcode_viewfinder,
                            color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                height: 703.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                    color: Colors.lightBlueAccent),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        Text(
                          "Bonus card",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp,
                              color: Colors.white),
                        ),
                        SizedBox(width: 10.w),
                        const Icon(CupertinoIcons.chevron_down,
                            color: Colors.white),
                        SizedBox(width: 130.w),
                        Text(
                          "More",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 628.8.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          color: Colors.grey[200]),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                        ),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 30.h),
                                Row(
                                  children: [
                                    SizedBox(width: 20.w),
                                    Text(
                                      "Stocks",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                          color: Colors.black),
                                    ),
                                    SizedBox(width: 150.w),
                                    Text(
                                      "All promotions",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                CarouselSlider(
                                  items: [
                                    ...List.generate(
                                      images.length,
                                      (index) => Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 10.h),
                                        width: 320.w,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: Colors.indigo),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          child: Image.asset(AppImages.image1,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 1),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const GlobalContainer(color: Colors.blue),
                                    SizedBox(width: 5.w),
                                    const GlobalContainer(color: Colors.grey),
                                    SizedBox(width: 5.w),
                                    const GlobalContainer(color: Colors.grey),
                                    SizedBox(width: 5.w),
                                    const GlobalContainer(color: Colors.grey),
                                    SizedBox(width: 5.w),
                                    const GlobalContainer(color: Colors.grey),
                                    SizedBox(width: 5.w),
                                    const GlobalContainer(color: Colors.grey),
                                    SizedBox(width: 5.w),
                                    const GlobalContainer(color: Colors.grey),
                                  ],
                                ),
                                SizedBox(height: 40.h),
                                Row(
                                  children: [
                                    SizedBox(width: 20.w),
                                    Text(
                                      "Categories",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                          color: Colors.black),
                                    ),
                                    SizedBox(width: 210.w),
                                    Text(
                                      "All",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.h),
                                SizedBox(
                                  width: double.infinity,
                                  height: 200.h,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        width: 200.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.time_to_leave,
                                                size: 40.r,
                                                color: Colors.green),
                                            SizedBox(height: 20.h),
                                            Text(
                                              "All Products",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Inter",
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Container(
                                        width: 200.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.time_to_leave,
                                                size: 40.r,
                                                color: Colors.green),
                                            SizedBox(height: 20.h),
                                            Text(
                                              "All Products",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Inter",
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Container(
                                        width: 200.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.time_to_leave,
                                                size: 40.r,
                                                color: Colors.green),
                                            SizedBox(height: 20.h),
                                            Text(
                                              "All Products",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Inter",
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Container(
                                        width: 200.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.time_to_leave,
                                                size: 40.r,
                                                color: Colors.green),
                                            SizedBox(height: 20.h),
                                            Text(
                                              "All Products",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Inter",
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Container(
                                        width: 200.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.time_to_leave,
                                                size: 40.r,
                                                color: Colors.green),
                                            SizedBox(height: 20.h),
                                            Text(
                                              "All Products",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Inter",
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                Container(
                                  width: double.infinity,
                                  height: 400.h,
                                  color: Colors.white,
                                  child: ListView(
                                    children: [
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          SizedBox(width: 10.w),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Colors.white,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: Image.asset(
                                                  AppImages.image3,
                                                  fit: BoxFit.cover,
                                                  width: 170.w,
                                                  height: 150.h),
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Colors.white,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: Image.asset(
                                                  AppImages.image4,
                                                  fit: BoxFit.cover,
                                                  width: 170.w,
                                                  height: 150.h),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                        ],
                                      ),
                                      SizedBox(height: 15.h),
                                      Row(
                                        children: [
                                          SizedBox(width: 10.w),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Colors.white,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: Image.asset(
                                                  AppImages.image1,
                                                  fit: BoxFit.cover,
                                                  width: 170.w,
                                                  height: 150.h),
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Colors.white,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: Image.asset(
                                                  AppImages.image2,
                                                  fit: BoxFit.cover,
                                                  width: 170.w,
                                                  height: 150.h),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                        ],
                                      ),
                                      SizedBox(height: 15.h),
                                      Row(
                                        children: [
                                          SizedBox(width: 10.w),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Colors.white,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: Image.asset(
                                                  AppImages.image3,
                                                  fit: BoxFit.cover,
                                                  width: 170.w,
                                                  height: 150.h),
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Colors.white,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: Image.asset(
                                                  AppImages.image4,
                                                  fit: BoxFit.cover,
                                                  width: 170.w,
                                                  height: 150.h),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                Row(
                                  children: [
                                    SizedBox(width: 10.w),
                                    Container(
                                      width: 170.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: Colors.blue),
                                      child: Center(
                                        child: Text(
                                          "Products",
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Container(
                                      width: 170.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "News",
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SizedBox(width: 10.w),
                                    Container(
                                      width: 170.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "Promotion",
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Container(
                                      width: 170.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "Sale",
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 195,
                                  child: GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: 20,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                child: Image.asset(
                                                  AppImages.image1,
                                                  fit: BoxFit.cover,
                                                  height: 150,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Text(
                                                "A sharp knife",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(height: 15.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 100.w,
                                                    height: 40.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        color: Colors.green),
                                                    child: Center(
                                                      child: Text(
                                                        "Basket",
                                                        style: TextStyle(
                                                            fontFamily: "Inter",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15.sp,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  LikeButton(size: 30.r),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Image> images = [
  Image.asset(AppImages.image1),
  Image.asset(AppImages.image2),
  Image.asset(AppImages.image3),
  Image.asset(AppImages.image4),
];
