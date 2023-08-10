import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:default_project/data/models/honda/honda_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/network/api_service.dart';

class HondaScreen extends StatefulWidget {
  const HondaScreen({super.key});

  @override
  State<HondaScreen> createState() => _HondaScreenState();
}

class _HondaScreenState extends State<HondaScreen> {
  HondaModel? hondaModel;

  bool isLoading = false;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    hondaModel = await ApiService.getCarItem();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        backgroundColor: Colors.teal,
        title: Text(
          "Honda",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  CarouselSlider(
                    items: hondaModel!.carPics != null
                        ? hondaModel!.carPics.map<Widget>((picUrl) {
                            return CachedNetworkImage(
                              imageUrl: picUrl,
                              placeholder: (context, url) =>
                                  CupertinoActivityIndicator(
                                radius: 20.r,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                size: 50.r,
                              ),
                            );
                          }).toList()
                        : [],
                    options: CarouselOptions(
                      height: 220,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {},
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: hondaModel!.logo,
                    width: 100.w,
                    height: 50.h,
                    placeholder: (context, url) => CupertinoActivityIndicator(
                      radius: 20.r,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: 50.r,
                    ),
                  ),
                  Text('Car Model: ${hondaModel!.carModel}',
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: Colors.black)),
                  Text('Established Year: ${hondaModel!.establishedYear}',
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: Colors.black)),
                  Text('Average Price: ${hondaModel!.averagePrice}\$',
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: Colors.black)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Text(
                      'Description: ${hondaModel!.description}',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getData();
        },
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
