import 'package:default_project/data/models/country/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/network/api_service.dart';
import '../app_routes.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  CountryData? countryData;

  bool isLoading = false;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    countryData = await ApiService.getCountry();
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
          "Country",
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
                          countryData!.data.countries.length,
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
                                      context, RouteNames.countryDetail,
                                      arguments:
                                          countryData!.data.countries[index]);
                                },
                                title: Text(
                                  countryData!.data.countries[index].name,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Colors.white),
                                ),
                                leading: Text(
                                  countryData!.data.countries[index].emoji,
                                  style: TextStyle(fontSize: 24.sp),
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
