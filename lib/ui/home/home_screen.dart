import 'package:default_project/ui/list_tile/list_tile.dart';
import 'package:default_project/utils/colors.dart';
import 'package:default_project/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../second_screen/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Contacts",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: ListTile(
                          leading: const Text(
                            "Sort by",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: "Poppins",
                                color: Colors.black),
                          ),
                          title: SvgPicture.asset(AppImages.back,
                              width: 35.w, height: 35.h),
                        ),
                        content: const ListTile(
                          leading: Text(
                            "Delete all",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: "Poppins",
                                color: Colors.black),
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 40.h),
              const ListTileScreen(
                  title: "MuhammadAli Eshon...", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Sarvar Abdug’aniyev", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Asilbek Taksi", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Rustam sartarosh", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Shovkat qo’shni", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Bobur Mavlonov", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Abdurahim Qassob", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Alisherni akasi", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Noma’lum shaxs", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(title: "Bekzod aka", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(
                  title: "Adham Sinfdosh", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(title: "Market", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(title: "Uztelecom", img: AppImages.phone),
              SizedBox(height: 30.h),
              const ListTileScreen(title: "MCHS", img: AppImages.phone),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const SecondScreen();
              },
            ),
          );
        },
        backgroundColor: AppColors.C_00B2FF,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
