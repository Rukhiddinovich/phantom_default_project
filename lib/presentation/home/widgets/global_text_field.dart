import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField(
      {super.key,
      required this.eventText,
       this.keyboardType,
       this.textInputAction,  this.controller, this.initialValue, this.enable});

  final String eventText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventText,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: Colors.white),
            ),
          ],
        ),
        4.ph,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: Color(0xFF181A20)),
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            enabled: enable,
            textInputAction: textInputAction,
            controller: controller,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        BorderSide(width: 1.w, color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        BorderSide(width: 1.w, color: Colors.transparent)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        BorderSide(width: 1.w, color: Colors.transparent)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        BorderSide(width: 1.w, color: Colors.transparent))),
          ),
        ),
        16.ph,
      ],
    );
  }
}
