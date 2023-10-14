import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/data/models/form_status.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductSales extends StatefulWidget {
  const ProductSales({super.key});

  @override
  State<ProductSales> createState() => _ProductSalesState();
}

class _ProductSalesState extends State<ProductSales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Product Sales",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
      ),
      body: BlocConsumer<ShopBloc, ShopState>(
        listener: (context, state) {
          if (state is FormStatus) {
            if (state.status == FormStatus.loading) {
              const CircularProgressIndicator(color: Colors.white);
            }
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              ...List.generate(
                state.products.length,
                (index) {
                  ShopModel shopModel = state.products[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: ListTile(
                      title: Text(
                        shopModel.name,
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        shopModel.qrCode.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Text(
                        shopModel.count.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
