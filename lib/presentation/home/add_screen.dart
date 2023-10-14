import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/presentation/app_routes.dart';
import 'package:default_project/presentation/home/widgets/global_button.dart';
import 'package:default_project/presentation/home/widgets/global_text_field.dart';
import 'package:default_project/utils/size/size_extension.dart';
import 'package:default_project/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key, required this.barCode});

  final String barCode;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCountController = TextEditingController();
  final TextEditingController qrCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.black),
        backgroundColor: Colors.black,
        title: Text(
          "Add Screen",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  10.ph,
                  GlobalTextField(
                      controller: productNameController,
                      eventText: "Product Name",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next),
                  GlobalTextField(
                      controller: productCountController,
                      eventText: "Product Count",
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done),
                  GlobalTextField(
                    enable: false,
                    eventText: "QR Code",
                    initialValue: widget.barCode,
                    textInputAction: TextInputAction.done,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.homeScreen);
                    },
                    icon: Icon(CupertinoIcons.qrcode,
                        size: 60.r, color: Colors.white),
                  ),
                ],
              ),
            ),
            ZoomTapAnimation(
                onTap: () {
                  if (productNameController.text.isNotEmpty &&
                      productCountController.text.isNotEmpty) {
                    BlocProvider.of<ShopBloc>(context).add(AddProduct(
                        newProducts: ShopModel(
                            name: productNameController.text,
                            count: productCountController.text,
                            qrCode: widget.barCode)));
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteNames.homeScreen, (route) => false);
                  } else {
                    showErrorMessage(
                        message: "The data is incomplete!", context: context);
                  }
                },
                child: const GlobalButton(
                    buttonText: "Add Product", buttonColor: Color(0xFF181A20)))
          ],
        ),
      ),
    );
  }
}
