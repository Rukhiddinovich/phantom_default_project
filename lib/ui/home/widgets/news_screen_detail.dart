import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/news_model.dart';
import '../../../provider/news_provider.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsDetailScreen({super.key, required this.newsModel, required this.index});

  final NewsModel newsModel;
  final int index;

  final NewsProvider newsProvider = NewsProvider.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Info Screen",
          style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 24.sp),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 132.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delete This New",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins"),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Are you sure you want to delete this New!",
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
                                            color: Colors.teal,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins"),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        context
                                            .read<NewsProvider>()
                                            .deleteNews(id: newsModel.id ?? 0);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                          "New success deleted!",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Poppins"),
                                        )));
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins"),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                newsModel.newsDataTitle,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp),
              ),
              SizedBox(height: 20.h),
              ZoomTapAnimation(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context){
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: PhotoView(backgroundDecoration: BoxDecoration(color: Colors.transparent),
                            imageProvider: NetworkImage(newsModel.newsDataImg)),
                      );
                    },
                  );
                },
                child: Hero(
                  tag: index,
                  child: CachedNetworkImage(imageUrl: newsModel.newsDataImg),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                newsModel.newsDataBody,
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
