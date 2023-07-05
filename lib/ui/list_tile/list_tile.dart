import 'package:default_project/ui/second_screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/icons.dart';

class ListTileScreen extends StatefulWidget {
  const ListTileScreen({super.key, required this.title, required this.img});

  final String title;
  final String img;

  @override
  State<ListTileScreen> createState() => _ListTileScreenState();
}

class _ListTileScreenState extends State<ListTileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ZoomTapAnimation(
        onTap: (){},
        child: SvgPicture.asset(
          AppImages.person,
          width: 50.w,
          height: 50.h,
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: Colors.black),
      ),
      subtitle: Text(
        "+99891 222 64 44",
        style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: Colors.grey),
      ),
      trailing:
          ZoomTapAnimation(onTap: () {}, child: SvgPicture.asset(widget.img)),
    );
  }
}
