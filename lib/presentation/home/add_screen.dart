import 'package:default_project/bloc/shop_bloc.dart';
import 'package:default_project/data/models/model.dart';
import 'package:default_project/local/db/local_database.dart';
import 'package:default_project/presentation/app_routes.dart';
import 'package:default_project/presentation/home/widgets/global_button.dart';
import 'package:default_project/presentation/home/widgets/global_text_field.dart';
import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key, this.barCode, this.code});

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
      appBar: AppBar(
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    10.ph,
                    GlobalTextField(
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter name of first player!';
                        //   }
                        //   return null;
                        // },
                        enable: widget.barCode == null,
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
                    await LocalDatabase.getSingleProduct(widget.barCode?.qrCode ?? widget.code!);

                    if (existingProduct != null) {
                      final updatedCount = (int.parse(productCountController.text) +
                          int.parse(existingProduct.count))
                          .toString();

                      context.read<ShopBloc>().add(UpdateProduct(
                          newProduct: ShopModel(
                              id: existingProduct.id,
                              name: existingProduct.name,
                              count: updatedCount,
                              qrCode: existingProduct.qrCode)));

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Product count updated successfully."),
                        duration: const Duration(seconds: 2),
                      ));
                    } else {
                      context.read<ShopBloc>().add(AddProduct(
                          newProducts: ShopModel(
                              name: productNameController.text,
                              count: productCountController.text,
                              qrCode: widget.code!)));

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Product added successfully."),
                        duration: const Duration(seconds: 2),
                      ));
                    }

                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteNames.homeScreen, (route) => false);
                  } else {
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
      ),
    );
  }
}
