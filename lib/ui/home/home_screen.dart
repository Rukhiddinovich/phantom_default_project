import 'package:default_project/data/models/detail/one_call_data.dart';
import 'package:default_project/data/models/main/weather_main.dart';
import 'package:default_project/ui/days_screen/days_screen.dart';
import 'package:default_project/ui/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/models/main/lat_lon.dart';
import '../../data/models/universal_data.dart';
import '../../data/network/api_provider.dart';
import '../../local/storage_repository.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/my_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherMainModel? weatherMainModel;
  UniversalData? universalData;

  _getData(String query) async {
    universalData = await ApiProvider.getMainWeatherDataByQuery(query: query);
    weatherMainModel = universalData?.data;
  }

  @override
  void initState() {
    _getData("Tashkent");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UniversalData>(
        future: ApiProvider.getWeatherOneCallData(
            long: weatherMainModel?.coordModel.lon ?? 0,
            lat: weatherMainModel?.coordModel.lat ?? 0),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Stack(
              children:  [
                Image.asset(AppImages.sky,
                    width: double.infinity.w,
                    height: double.infinity.h,
                    fit: BoxFit.cover),
                const Center(
                child: CircularProgressIndicator(color: Colors.blueAccent,),
              )],
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              OneCallData oneCallData = snapshot.data!.data as OneCallData;
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
                            contentPadding:
                                EdgeInsets.only(left: -5.w, right: 5.w),
                            leading: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SevenDaysScreen(
                                        dailyItem: oneCallData.daily,
                                      );
                                    },
                                  ),
                                );
                              },
                              icon: SvgPicture.asset(AppImages.menu,
                                  width: 25.w, height: 25.h),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SearchScreen(
                                        onSearchTap: () {
                                          (
                                            _getData(
                                              StorageRepository.getString(
                                                  "region"),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                              icon: SvgPicture.asset(AppImages.search,
                                  width: 25.w, height: 25.h),
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
                                      "${oneCallData.timezone}",
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
                                      "Today, ${MyUtils.getDateTime(oneCallData.hourly[0].dt)}"
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
                                        "https://openweathermap.org/img/wn/${oneCallData.hourly[0].weather[0].icon}@2x.png",
                                        width: 120.w,
                                        height: 120.h,
                                        fit: BoxFit.fitHeight),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                "${(oneCallData.hourly[0].temp).toInt()}\n",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 43.sp,
                                                color: AppColors.C_303345),
                                            children: [
                                              TextSpan(
                                                text: oneCallData
                                                    .hourly[0].weather[0].main,
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
                                        "${oneCallData.hourly[0].windSpeed.toInt().toString()} sm",
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
                                        "${oneCallData.hourly[0].windSpeed.toString()} km/h",
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
                                        "${oneCallData.hourly[0].humidity} %",
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
                          SizedBox(height: 20.h),
                          Container(
                            width: 330.w,
                            height: 240.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              gradient: const LinearGradient(
                                colors: [Colors.white, Colors.white60],
                              ),
                            ),
                            child: Expanded(
                              child: ListView(
                                children: [
                                  ...List.generate(
                                    oneCallData.hourly.length,
                                    (index) => ListTile(
                                      leading: Text(
                                        MyUtils.getDateTime(
                                                oneCallData.hourly[index].dt)
                                            .toString()
                                            .substring(10, 16),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp,
                                            fontFamily: "Poppins",
                                            color: AppColors.C_303345),
                                      ),
                                      trailing: SizedBox(
                                        width: 125.w,
                                        child: Row(
                                          children: [
                                            Image.network(
                                              "https://openweathermap.org/img/wn/${oneCallData.hourly[index].weather[0].icon}@2x.png",
                                            ),
                                            Text(
                                              "${(oneCallData.hourly[0].temp).toInt()}\n",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.sp,
                                                  color: AppColors.C_303345),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
            return Center(
              child: Text(snapshot.data!.error),
            );
          }

          return Center(
            child: Text(snapshot.error.toString()),
          );
        },
      ),
    );
  }
}
