import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../local/storage_repository/storage_repository.dart';
import '../../provider/news_provider.dart';
import '../../utils/icons.dart';
import '../app_routes.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsProvider newsProvider = NewsProvider.instance;
  bool isSomething = StorageRepository.getBool("isSomething");

  checking() async {
    isSomething
        ? await FirebaseMessaging.instance.subscribeToTopic("news")
        : await FirebaseMessaging.instance.unsubscribeFromTopic("news");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        backgroundColor: Colors.teal,
        title: Lottie.asset(AppImages.news, width: 60.w),
        centerTitle: true,
        actions: [
          Switch(
            value: isSomething,
            onChanged: (value) {
              isSomething = !isSomething;
              StorageRepository.putBool("isSomething", isSomething);
              setState(() {
                checking();
              });
            },
          )
        ],
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    height: 131.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delete This New",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Are you sure you want to delete all News!",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins"),
                                )),
                            TextButton(
                              onPressed: () {
                                context.read<NewsProvider>().deleteAllNews();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  "News success deleted!",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins"),
                                )));
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.folder_delete, color: Colors.yellow, size: 30.sp),
        ),
      ),
      backgroundColor: Colors.white,
      body: context.watch<NewsProvider>().news.isEmpty
          ? Center(child: Lottie.asset(AppImages.empty))
          : ListView(
              children: [
                ...List.generate(
                  context.watch<NewsProvider>().news.length,
                  (index) => ZoomTapAnimation(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.newsDetail,
                        arguments: {
                          "model": context.read<NewsProvider>().news[index],
                          "index": index
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      width: double.infinity,
                      height: 120.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 4,
                              color: Colors.black54,
                              blurRadius: 15,
                              offset: Offset(1, 7))
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(
                            tag: index,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: CachedNetworkImage(
                                  imageUrl: context
                                      .watch<NewsProvider>()
                                      .news[index]
                                      .newsDataImg,
                                  width: 114.w,
                                  height: 90.h,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Expanded(
                                      child: SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          context
                                              .watch<NewsProvider>()
                                              .news[index]
                                              .newsDataTitle,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 5,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12.h)
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Text(
                                  context
                                      .watch<NewsProvider>()
                                      .news[index]
                                      .newsDataDatetime
                                      .substring(0, 16),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
