import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String baseUrl = "https://api.openweathermap.org";

class StatusTextConstants {
  static String addProduct = "add_product";
  static String getProduct = "get_product";
  static String updateProduct = "update_product";
  static String deleteProduct = "delete_product";
}

void showDialogGlobal(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Error",style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: Colors.black),),
        content: Text("Please try again",style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: Colors.black),),
        actions: <Widget>[

          ElevatedButton(
            child: Text(
              "OK",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}