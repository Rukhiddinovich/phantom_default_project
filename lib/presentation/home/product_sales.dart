import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/data/models/form_status.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/utils/icons/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProductSales extends StatefulWidget {
  const ProductSales({Key? key});

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
          return state.products.isEmpty
              ? Center(
                  child: Lottie.asset(AppIcons.empty),
                )
              : ListView(
                  children: [
                    ...List.generate(
                      state.products.length,
                      (index) {
                        ShopModel shopModel = state.products[index];
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            BlocProvider.of<ShopBloc>(context)
                                .add(DeleteProductEvent(id: shopModel.id ?? 0));
                          },
                          background: Container(color: Colors.black),
                          secondaryBackground: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(16.r),
                            child: Icon(CupertinoIcons.delete,
                                size: 26.r, color: Colors.white),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: ListTile(
                              title: Text(shopModel.name,
                                  style: TextStyle(color: Colors.black)),
                              subtitle: Text(shopModel.qrCode.toString(),
                                  style: TextStyle(color: Colors.black)),
                              trailing: Text(shopModel.count.toString(),
                                  style: TextStyle(color: Colors.black)),
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
