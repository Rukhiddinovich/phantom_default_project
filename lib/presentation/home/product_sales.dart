import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/data/models/form_status.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/presentation/app_routes.dart';
import 'package:default_project/presentation/home/widgets/show_dialog.dart';
import 'package:default_project/utils/icons/icons.dart';
import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductSales extends StatelessWidget {
  const ProductSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
              ? Stack(
                  children: [
                    Lottie.asset(AppIcons.background,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width),
                    Center(child: Lottie.asset(AppIcons.empty)),
                  ],
                )
              : Stack(
                  children: [
                    Lottie.asset(AppIcons.background,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width),
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 30.h),
                      children: [
                        Row(
                          children: [
                            ZoomTapAnimation(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      RouteNames.homeScreen, (route) => false);
                                },
                                child: Icon(Icons.arrow_back,
                                    color: Colors.white, size: 25.r)),
                            70.pw,
                            Text(
                              "Product Sales",
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        20.ph,
                        ...List.generate(
                          state.products.length,
                          (index) {
                            ShopModel shopModel = state.products[index];
                            return ZoomTapAnimation(
                              onTap: () {
                                showGlobalDialog(
                                    context: context,
                                    title: "Product Sales",
                                    result: shopModel.qrCode.toString(),
                                    shopModel: shopModel);
                              },
                              child: Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) {
                                  BlocProvider.of<ShopBloc>(context).add(
                                      DeleteProductEvent(
                                          id: shopModel.id ?? 0));
                                },
                                background:
                                    Container(color: Colors.transparent),
                                secondaryBackground: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.all(16.r),
                                  child: Icon(CupertinoIcons.delete,
                                      size: 26.r, color: Colors.white),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Colors.black38),
                                  child: ListTile(
                                    title: Text(
                                      shopModel.name,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          color: Colors.white),
                                    ),
                                    subtitle: Text(shopModel.qrCode.toString(),
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    trailing: Text(
                                      "Count: ${shopModel.count.toString()}",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
