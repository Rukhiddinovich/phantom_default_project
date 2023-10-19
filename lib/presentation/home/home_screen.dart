import 'package:default_project/utils/colors/colors.dart';
import 'package:default_project/utils/icons/icons.dart';
import 'package:default_project/utils/size/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 280.h,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:
                    Color.lerp(AppColors.C_313131, AppColors.C_131313, 0.6),
                statusBarIconBrightness: Brightness.light),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    height: 280.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF313131), Color(0xFF131313)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight),
                    ),
                    child: Column(
                      children: [
                        30.ph,
                        ListTile(
                          title: Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontSize: 12.sp,
                                color: const Color(0xFFB7B7B7)),
                          ),
                          subtitle: Text(
                            "Bilzen, Tanjungbalai",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontSize: 14.sp,
                                color: Colors.white),
                          ),
                          trailing: Image.asset(AppIcons.profile),
                        ),
                        30.ph,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: const Color(0xFF313131)),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {},
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(CupertinoIcons.search,
                                    color: Colors.white),
                                hintText: "Search coffee",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins"),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: BorderSide(
                                        width: 1.w,
                                        color: const Color(0xFF313131))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: BorderSide(
                                        width: 1.w,
                                        color: const Color(0xFF313131))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: BorderSide(
                                        width: 1.w,
                                        color: const Color(0xFF313131))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: BorderSide(
                                        width: 1.w,
                                        color: const Color(0xFFC67C4E))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: BorderSide(
                                        width: 1.w,
                                        color: const Color(0xFF313131)))),
                          ),
                     ),
                      ],
                    ),
                  ),
                ],
              ),
              title: Container(
                margin: EdgeInsets.only(right: 50.w),
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(AppIcons.coffeePng1, fit: BoxFit.cover,)),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
