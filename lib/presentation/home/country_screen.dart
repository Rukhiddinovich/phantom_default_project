import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../bloc/country_bloc.dart';
import '../../bloc/country_state.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        title: Text(
          "Products Screen",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoadInProgress) {
              return CupertinoActivityIndicator(radius: 15.r);
            }
            if (state is CountryLoadSuccess) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ZoomTapAnimation(
                    // onTap: () {
                    //   Navigator.pushNamed(context, RouteNames.productDetail);
                    // },
                    child: Container(
                      padding: EdgeInsets.only(
                          right: 24.w, bottom: 2.h, top: 2.h, left: 2.w),
                      margin: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5.r)
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  const CupertinoActivityIndicator(),
                              imageUrl: product.image,
                              height: 100.h,
                              width: 100.w,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Icon(CupertinoIcons.photo, size: 40.r),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  product.name,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Colors.white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                product.type,
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            product.yearBuilt.toString(),
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}
