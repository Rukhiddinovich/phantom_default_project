import 'dart:io';
import 'dart:ui';

import 'package:default_project/presentation/home/widgets/global_container.dart';
import 'package:default_project/presentation/home/widgets/text_widget.dart';
import 'package:default_project/utils/constants/constants.dart';
import 'package:default_project/utils/size/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey containerKey = GlobalKey();

  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text(
          "Check",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  RepaintBoundary(
                    key: containerKey,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      width: double.infinity,
                      height: 700,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1400,00 UZS",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        color: Colors.black),
                                  ),
                                  Container(
                                    width: 100.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        color: Colors.green),
                                    child: Center(
                                      child: Text(
                                        "Muvaffaqiyatli",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(CupertinoIcons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                          10.ph,
                          const Divider(color: Colors.green),
                          10.ph,
                          const TextWidget(
                              title: "Jo'natuvchi nomi",
                              subtitle: "JO'RAYEV JAMSHID"),
                          const TextWidget(
                              title: "Jo'natuvchi",
                              subtitle: "561468******3040"),
                          const TextWidget(
                              title: "Qabul qiluvchi nomi",
                              subtitle: "ATTO (metro to'lovi)"),
                          const TextWidget(
                              title: "Qabul qiluvchi", subtitle: "STATION 3"),
                          const TextWidget(
                              title: "Jo'natuvchi nomi",
                              subtitle: "Jo'rayev Jamshid"),
                          10.ph,
                          const TextWidget(
                              title: "Komissiya", subtitle: "0,00 UZS"),
                          const TextWidget(
                              title: "Qabul qiluvchidan komissiya",
                              subtitle: "0,00 UZS"),
                          const TextWidget(
                              title: "Qabul qilingan so'mma",
                              subtitle: "1400,00 UZS"),
                          const TextWidget(
                              title: "Amaliyot sanasi",
                              subtitle: "12.10.2023 15:40:01"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                  title: "Amaliyot ID",
                                  subtitle: "asdfa1212haj23hjh-afda23-af123"),
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(const ClipboardData(
                                      text: "asdfa1212haj23hjh-afda23-af123"));
                                  Clipboard.getData("text/plain");
                                },
                                icon: const Icon(
                                  CupertinoIcons.doc_text_fill,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.green),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Current Balance",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "150,000,00 UZS",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: Colors.black),
                                  ),
                                  10.pw,
                                  const Icon(Icons.remove_red_eye_outlined)
                                ],
                              )
                            ],
                          ),
                          20.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GlobalContainer(
                                onTap: () {},
                                title: "Refresh",
                                icon: const Icon(Icons.refresh,
                                    color: Colors.purple),
                              ),
                              GlobalContainer(
                                onTap: () {
                                  saveToGallery();
                                },
                                title: "Check Share",
                                icon: const Icon(Icons.share,
                                    color: Colors.purple),
                              ),
                              GlobalContainer(
                                onTap: () {},
                                title: "Storage",
                                icon: const Icon(Icons.star_border_outlined,
                                    color: Colors.purple),
                              ),
                            ],
                          )
                        ],
                      ),
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

  _takeScreenshot<Uint8List>() async {
    RenderRepaintBoundary boundary = containerKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    var im = await boundary.toImage();
    var byteData = await im.toByteData(format: ImageByteFormat.png);
    setState(() {
      imageBytes = byteData!.buffer.asUint8List();
    });
    const String fileName = 'screenshot.png';
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/$fileName';
    File(filePath).writeAsBytesSync(imageBytes!);
    Share.shareFiles([filePath]);
    return byteData!.buffer.asUint8List();
  }

  saveToGallery() async {
    await PermissionUtil.requestAll();
    var pngBytes = await _takeScreenshot();
    var t = await ImageGallerySaver.saveImage(pngBytes);
  }
}
