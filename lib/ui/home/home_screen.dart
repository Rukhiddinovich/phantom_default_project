import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/data/network/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../models/currency_model.dart';
import '../../models/universal_response.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({super.key});

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  final CurrencyRepository currencyRepository =
      CurrencyRepository(apiProvider: ApiProvider());

  List<CurrencyModel> currencies = [];

  bool isLoading = false;

  getDataf()async{
    UniversalResponse universalResponse =await ApiProvider().getAllCurrencies();
    print(universalResponse.error);
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    currencies = await currencyRepository.fetchCurrencies();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getDataf();
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Bank Cards",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: "Poppins"),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.indigo,),
            )
          : currencies.isEmpty
              ? const Center(child: Text("Not Found"))
              : ListView(
                  children: [
                    ...List.generate(
                      currencies.length,
                      (index) {
                        CurrencyModel currency = currencies[index];
                        String colorA =
                            "0xFF${currency.colors["color_a"].toString().substring(1)}";
                        String colorB =
                            "0xFF${currency.colors["color_b"].toString().substring(1)}";
                        return ZoomTapAnimation(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 7.h),
                            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              gradient: LinearGradient(
                                colors: [
                                  Color(int.parse(colorA)),
                                  Color(int.parse(colorB)),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      currency.bankName,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.sp,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      currency.cardType,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Center(
                                  child: Text(
                                    "${currency.moneyAmount.toString()} ${currency.cardCurrency}",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.sp,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "CARD NUMBER: ${currency.cardNumber}",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "EXPIRE DATE: ${currency.expireDate}",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.white),
                                    ),
                                    Image.network(currency.iconImage,width: 50.w),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
    );
  }
}
