import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/presentation/app_routes.dart';
import 'package:default_project/utils/icons/icons.dart';
import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Lottie.asset(AppIcons.background,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  200.ph,
                  Lottie.asset(AppIcons.shop),
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.qrCode);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.black38),
                          child: Column(
                            children: [
                              Icon(CupertinoIcons.add_circled,
                                  color: Colors.green, size: 25.r),
                              Text(
                                "Add Product",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          context.read<ShopBloc>().add(GetProduct());
                          Navigator.pushNamed(context, RouteNames.productSales);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.black38),
                          child: Column(
                            children: [
                              Icon(CupertinoIcons.shopping_cart,
                                  color: Colors.green, size: 25.r),
                              Text(
                                "Product sales",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
