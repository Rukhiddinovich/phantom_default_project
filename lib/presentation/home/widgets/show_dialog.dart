import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/utils/colors/colors.dart';
import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showGlobalDialog(
    {required BuildContext context,
    required String title,
    required String result,
    ShopModel? shopModel}) {
  TextEditingController countController = TextEditingController();
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.black),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Container(
            height: 150.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r), color: Colors.white),
            child: Column(
              children: [
                10.ph,
                TextField(
                  keyboardType: TextInputType.number,
                  controller: countController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Product Count",
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.dark1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.dark1),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              color: Colors.white),
                        )),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.dark1,
                      ),
                      onPressed: () {
                        if (countController.text.isNotEmpty) {
                          int newCount = shopModel!.count -
                              int.parse(countController.text);
                          if (newCount <= 0) {
                            context.read<ShopBloc>().add(DeleteProductEvent(id: shopModel.id ?? 0));
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.dark1,
                                content: Text(
                                  "Product has been sold and removed from the database!",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          } else {
                            ShopModel newProduct = ShopModel(
                              id: shopModel.id,
                              count: newCount,
                              name: shopModel.name,
                              qrCode: shopModel.qrCode,
                            );
                            context.read<ShopBloc>().add(UpdateProduct(newProduct: newProduct));
                            context.read<ShopBloc>().add(GetProduct());
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text(
                        "Sell",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
        contentPadding: EdgeInsets.zero,
      );
    },
  );
}
