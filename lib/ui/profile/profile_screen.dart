import 'package:default_project/ui/profile/widgets/global_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        backgroundColor: Colors.teal,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children:[ Column(
          children: [
            SizedBox(height: 20.h),
            GlobalTextField(
                hintText: "Title",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: context.watch<ProfileProvider>().titleController),
            SizedBox(height: 20.h),
            GlobalTextField(
                hintText: "Description",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                controller: context.watch<ProfileProvider>().descriptionController),
            SizedBox(height: 20.h),
            ZoomTapAnimation(
              onTap: () {
                showBottomSheetDialog();
              },
              child: Container(
                margin: EdgeInsets.all(20.r),
                padding: EdgeInsets.all(14.r),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.teal),
                child: Center(
                  child: context.watch<ProfileProvider>().imageUrl.isEmpty
                      ? Text(
                          "Image Not Selected",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : Image.network(context.watch<ProfileProvider>().imageUrl),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ZoomTapAnimation(
              onTap: () {
                // if (context
                //         .read<ProfileProvider>()
                //         .titleController
                //         .text
                //         .isNotEmpty &&
                //     context
                //         .read<ProfileProvider>()
                //         .descriptionController
                //         .text
                //         .isNotEmpty &&
                //     context.read<ProfileProvider>().imageUrl.isNotEmpty) {
                  context.read<ProfileProvider>().postNotification();
                  // Navigator.pop(context);
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       duration: const Duration(milliseconds: 700),
                //       backgroundColor: Colors.teal,
                //       margin: EdgeInsets.symmetric(
                //         vertical: 100.h,
                //         horizontal: 20.w,
                //       ),
                //       behavior: SnackBarBehavior.floating,
                //       content: Text(
                //         "Fill in the fields!",
                //         style: TextStyle(
                //           fontFamily: "Poppins",
                //           color: Colors.red,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 15.sp,
                //         ),
                //       ),
                //     ),
                //   );
                // }
              },
              child: Container(
                margin: EdgeInsets.all(20.r),
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.teal),
                child: Center(
                  child: Text(
                    "Post News",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        )],
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(24.r),
          height: 200.h,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                title: const Text(
                  "Select from Camera",
                  style: TextStyle(fontFamily: "Poppins", color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.photo,
                  color: Colors.white,
                ),
                title: const Text(
                  "Select from Gallery",
                  style: TextStyle(fontFamily: "Poppins", color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      await Provider.of<ProfileProvider>(context, listen: false)
          .uploadCategoryImage(context, xFile);
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      await Provider.of<ProfileProvider>(context, listen: false)
          .uploadCategoryImage(context, xFile);
    }
  }
}
