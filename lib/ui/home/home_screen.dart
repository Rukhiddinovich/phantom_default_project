import 'package:default_project/utils/colors.dart';
import 'package:default_project/utils/icons.dart';
import 'package:default_project/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/main/weather_main.dart';
import '../../data/models/universal_data.dart';
import '../../data/network/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UniversalData>(
        future: ApiProvider.getMainWeatherDataByQuery(query: "New York"),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              WeatherMainModel weatherMainModel =
                  snapshot.data!.data as WeatherMainModel;
              return Stack(
                children: [
                  Image.asset(AppImages.sky,
                      width: double.infinity.w,
                      height: double.infinity.h,
                      fit: BoxFit.cover),
                  ListView(
                    children: [
                      Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(left: -5.w,right: 5.w),
                            leading: IconButton(
                              onPressed: (){},
                              icon: SvgPicture.asset(AppImages.search,
                                  width: 24.w, height: 24.h),
                            ),
                            trailing: IconButton(
                              onPressed: (){},
                              icon: SvgPicture.asset(AppImages.menu,
                                  width: 24.w, height: 24.h),
                            ),
                          ),
                          SizedBox(height: 21.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ZoomTapAnimation(
                                      onTap: () {},
                                      child: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                            color: Colors.white38),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            AppImages.location,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "${weatherMainModel.name},",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28.sp,
                                          fontFamily: "Poppins",
                                          color: AppColors.C_313341),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      weatherMainModel.sysInMain.country,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28.sp,
                                          fontFamily: "Poppins",
                                          color: AppColors.C_313341),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Text(
                                      "Today, ${MyUtils.getDateTime(weatherMainModel.dateTime)}"
                                          .toString()
                                          .substring(0, 17),
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.C_9A938C),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                        "https://openweathermap.org/img/wn/${weatherMainModel.weatherModel[0].icon}@2x.png",
                                        width: 120.w,
                                        height: 120.h,
                                        fit: BoxFit.cover),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                "${(weatherMainModel.mainInMain.temp - 273.15).toInt()}\n",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 43.sp,
                                                color: AppColors.C_303345),
                                            children: [
                                              TextSpan(
                                                text: weatherMainModel
                                                    .weatherModel[0].main,
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18.sp,
                                                    color: AppColors.C_303345),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SvgPicture.asset(AppImages.gradus,
                                            width: 40.w, height: 40.h),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Container(
                                  width: 330.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    gradient: const LinearGradient(
                                      colors: [Colors.white, Colors.white60],
                                    ),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      leading: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: Colors.white),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              AppImages.umbrella,
                                              width: 40.w,
                                              height: 40.h),
                                        ),
                                      ),
                                      title: Text(
                                        "RainFall",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            fontFamily: "Poppins",
                                            color: AppColors.C_303345),
                                      ),
                                      trailing: Text(
                                        "${weatherMainModel.windInMain.speed.toInt().toString()} sm",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.C_303345),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Container(
                                  width: 330.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    gradient: const LinearGradient(
                                      colors: [Colors.white, Colors.white60],
                                    ),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      leading: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: Colors.white),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              AppImages.wind,
                                              width: 40.w,
                                              height: 40.h),
                                        ),
                                      ),
                                      title: Text(
                                        "Wind",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            fontFamily: "Poppins",
                                            color: AppColors.C_303345),
                                      ),
                                      trailing: Text(
                                        "${weatherMainModel.windInMain.speed.toString()} km/h",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.C_303345),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Container(
                                  width: 330.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    gradient: const LinearGradient(
                                      colors: [Colors.white, Colors.white60],
                                    ),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      leading: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: Colors.white),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              AppImages.humidity,
                                              width: 40.w,
                                              height: 40.h),
                                        ),
                                      ),
                                      title: Text(
                                        "Humidity",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            fontFamily: "Poppins",
                                            color: AppColors.C_303345),
                                      ),
                                      trailing: Text(
                                        "${weatherMainModel.mainInMain.humidity} %",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.C_303345),
                                      ),
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
                ],
              );
            }
          }
          return Center(
            child: Text(snapshot.error.toString()),
          );
        },
      ),
    );
  }
}
