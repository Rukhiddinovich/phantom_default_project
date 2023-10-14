import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/local/db/local_database.dart';
import 'package:default_project/presentation/app_routes.dart';
import 'package:default_project/presentation/home/widgets/global_button.dart';
import 'package:default_project/presentation/home/widgets/global_text_field.dart';
import 'package:default_project/utils/colors/colors.dart';
import 'package:default_project/utils/icons/icons.dart';
import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Lottie.asset(AppIcons.background,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: Column(
                children: [
                  20.ph,
                  Row(
                    children: [
                      ZoomTapAnimation(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RouteNames.homeScreen, (route) => false);
                          },
                          child: Icon(Icons.arrow_back,
                              color: Colors.white, size: 25.r)),
                      80.pw,
                      Text(
                        "Add Screen",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        10.ph,
                        GlobalTextField(
                            controller: widget.barCode == null
                                ? productNameController
                                : TextEditingController(
                                    text: productNameController.text +
                                        widget.barCode!.name),
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
                      ],
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final existingProduct =
                            await LocalDatabase.getSingleProduct(
                                widget.barCode?.qrCode ?? widget.code!);
                        if (existingProduct != null) {
                          final updatedCount =
                              (int.parse(productCountController.text) +
                                  existingProduct.count);
                          if (!context.mounted) return;
                          context.read<ShopBloc>().add(UpdateProduct(
                              newProduct: ShopModel(
                                  id: existingProduct.id,
                                  name: existingProduct.name,
                                  count: updatedCount,
                                  qrCode: existingProduct.qrCode)));

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.dark1,
                            content: Text(
                              "Product count updated successfully.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Colors.white),
                            ),
                            duration: const Duration(seconds: 2),
                          ));
                        } else {
                          if (!context.mounted) return;
                          context.read<ShopBloc>().add(AddProduct(
                              newProducts: ShopModel(
                                  name: productNameController.text,
                                  count: int.parse(productCountController.text),
                                  qrCode: widget.code!)));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.dark1,
                            content: Text(
                              "Product added successfully.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Colors.white),
                            ),
                            duration: const Duration(seconds: 2),
                          ));
                        }

                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteNames.homeScreen, (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: AppColors.dark1,
                          content: Text(
                            "Please fill all fields",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                          duration: const Duration(seconds: 2),
                        ));
                      }
                    },
                    child: const GlobalButton(
                      buttonText: "Add Product",
                      buttonColor: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
