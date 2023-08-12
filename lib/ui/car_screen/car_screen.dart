import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/ui/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/car/car_model.dart';
import '../../data/network/api_service.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  CarModel? carModel;

  bool isLoading = false;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    carModel = await ApiService.getAllCars();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getData();
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
          "Car",
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
          : Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(
                          carModel!.data.length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.teal,
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteNames.carDetail,
                                      arguments: carModel!.data[index]);
                                },
                                title: Text(
                                  carModel!.data[index].carModel,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                      fontFamily: "Poppins"),
                                ),
                                leading: CachedNetworkImage(
                                  imageUrl: carModel!.data[index].logo,
                                  width: 50.w,
                                  height: 50.h,
                                  placeholder: (context, url) =>
                                      const CupertinoActivityIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
