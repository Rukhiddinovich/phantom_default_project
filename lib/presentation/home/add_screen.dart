import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/local/db/local_database.dart';
import 'package:default_project/presentation/app_routes.dart';
import 'package:default_project/presentation/home/widgets/global_button.dart';
import 'package:default_project/presentation/home/widgets/global_text_field.dart';
import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key, this.barCode, this.code});

  final ShopModel? barCode;
  final String? code;

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
                      enable: widget.barCode == null,
                      initialValue: widget.barCode?.name,
                      // controller: productNameController,
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
                    initialValue: widget.barCode == null
                        ? widget.code
                        : widget.barCode?.qrCode,
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
              onTap: () async {
                print('ok1');
                if ((productNameController.text.isNotEmpty || widget.barCode!.name.isNotEmpty) &&
                    productCountController.text.isNotEmpty) {
                  print('ok2');
                  final barCode = await LocalDatabase.getSingleProduct(
                      widget.barCode?.qrCode ?? widget.code!);
                  if (barCode != null) {
                    if (!context.mounted) return;
                    context.read<ShopBloc>().add(UpdateProduct(
                        newProduct: ShopModel(
                            id: barCode.id,
                            name: productNameController.text.isNotEmpty? productNameController.text: widget.barCode!.name ,
                            count: (int.parse(productCountController.text) +
                                    int.parse(barCode.count))
                                .toString(),
                            qrCode: widget.barCode!.qrCode)));
                  } else {
                    print('ok3');
                    if (!context.mounted) return;
                    context.read<ShopBloc>().add(AddProduct(
                        newProducts: ShopModel(
                            name: productNameController.text,
                            count: productCountController.text,
                            qrCode: widget.code!)));
                  }
                  print('ok4');
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.homeScreen, (route) => false);
                } else {
                  print('ok5');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please fill all fields"),
                    duration: const Duration(seconds: 2),
                  ));
                }
              },
              child: const GlobalButton(
                buttonText: "Add Product",
                buttonColor: Color(0xFF181A20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
