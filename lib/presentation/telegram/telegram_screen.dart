import 'package:default_project/data/models/file_download_model.dart';
import 'package:default_project/utils/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../cubit/download/file_download_cubit.dart';

class TelegramScreen extends StatelessWidget {
  TelegramScreen({super.key, required this.fileInfo});

  final FileDownloadModel fileInfo;
  FileDownloadCubit fileDownloadCubit = FileDownloadCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: fileDownloadCubit,
      child: BlocBuilder<FileDownloadCubit, FileDownloadState>(
        builder: (context, state) {
          return SizedBox(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                ...List.generate(
                  filesData.length,
                  (index) => Padding(
                    padding: EdgeInsets.all(5.r),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: CircleAvatar(
                            backgroundColor: AppColors.C_1C1C1D,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                "https://picsum.photos/300/${index}00",
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Container(
                          width: 250.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r),
                              ),
                              border: Border.all(color: Colors.grey),
                              color: AppColors.C_1C1C1D),
                          child: ListTile(
                            leading: ZoomTapAnimation(
                              onTap: () {
                                context
                                    .read<FileDownloadCubit>()
                                    .downloadFile(fileInfo: fileInfo);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10.h),
                                width: 35.w,
                                height: 35.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: Colors.blue),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: SizedBox(
                                        height: 45.h,
                                        width: 45.w,
                                        child: Visibility(
                                          visible: state.progress != 1.0,
                                          child: CircularProgressIndicator(
                                            value: state.progress,
                                            color: Colors.white,
                                            backgroundColor: Colors.blue,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: state.progress != 1.0 &&
                                              state.progress == 0.0
                                          ? Icon(
                                              CupertinoIcons.down_arrow,
                                              color: Colors.white,
                                              size: 22.r,
                                            )
                                          : state.progress != 1.0 &&
                                                  state.progress != 0.0
                                              ? Text(
                                                  "${(state.progress * 100).toInt()}%",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                )
                                              : Icon(
                                                  CupertinoIcons.doc_chart_fill,
                                                  color: Colors.white,
                                                  size: 22.r,
                                                ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            title: Text(
                              fileInfo.fileName,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: state.progress != 0 &&
                                    state.progress != 1.0
                                ? Text(
                                    "${(fileInfo.memory * state.progress).toString().substring(0, 4)} / ${fileInfo.memory} MB")
                                : Text("${fileInfo.memory.toString()} MB",style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    // return Scaffold(
    //   backgroundColor: AppColors.C_1C1C1D,
    //   appBar: AppBar(
    //     toolbarHeight: 65,
    //     backgroundColor: AppColors.C_1C1C1D,
    //     systemOverlayStyle:
    //         const SystemUiOverlayStyle(statusBarColor: AppColors.C_1C1C1D),
    //     title: Row(
    //       children: [
    //         ZoomTapAnimation(
    //             onTap: () {},
    //             child: Icon(Icons.arrow_back, size: 25.r, color: Colors.white)),
    //         SizedBox(width: 20.w),
    //         Container(
    //           width: 45.w,
    //           height: 45.h,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(100.r),
    //               color: Colors.blue),
    //           child: Center(
    //               child: Icon(
    //             Icons.bookmark,
    //             size: 25.r,
    //             color: Colors.white,
    //           )),
    //         ),
    //         // Image.asset(AppImages.profile, width: 50.w, height: 50.h),
    //         SizedBox(width: 20.w),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               "Bro",
    //               style: TextStyle(
    //                 fontFamily: "Poppins",
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 24.sp,
    //                 color: Colors.white,
    //               ),
    //             ),
    //             Text(
    //               "last seen recently",
    //               style: TextStyle(
    //                 fontFamily: "Poppins",
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 15.sp,
    //                 color: Colors.grey,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     actions: [
    //       Icon(CupertinoIcons.phone_fill, size: 25.r, color: Colors.white),
    //       SizedBox(width: 20.w),
    //       Icon(Icons.more_vert, size: 25.r, color: Colors.white),
    //       SizedBox(width: 10.w),
    //     ],
    //   ),
    //   body: BlocBuilder<FileDownloadCubit, FileDownloadState>(
    //       builder: (context, state) {
    //     return Stack(
    //       children: [
    //         Image.asset(
    //           AppImages.telegramBackground,
    //           fit: BoxFit.cover,
    //           height: double.infinity,
    //         ),
    //         ListView(
    //           children: [
    //             SizedBox(height: 20.h),
    //             ...List.generate(
    //               filesData.length,
    //               (index) => Padding(
    //                 padding: const EdgeInsets.all(5),
    //                 child: Row(
    //                   children: [
    //                     SizedBox(width: 10.w),
    //                     Padding(
    //                       padding: EdgeInsets.only(top: 20.h),
    //                       child: CircleAvatar(
    //                         backgroundColor: AppColors.C_1C1C1D,
    //                         child: ClipRRect(
    //                           borderRadius: BorderRadius.circular(60),
    //                           child: Image.network(
    //                             "https://picsum.photos/300/${index}00",
    //                             fit: BoxFit.cover,
    //                             width: double.infinity,
    //                             height: double.infinity,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(width: 15.w),
    //                     Container(
    //                       width: 150.w,
    //                       height: 60.h,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.only(
    //                             topLeft: Radius.circular(16.r),
    //                             topRight: Radius.circular(16.r),
    //                             bottomRight: Radius.circular(16.r),
    //                           ),
    //                           border: Border.all(color: Colors.grey),
    //                           color: AppColors.C_1C1C1D),
    //                       child: ListTile(
    //                         leading: ZoomTapAnimation(
    //                           onTap: () {
    //                             context
    //                                 .read<FileDownloadCubit>()
    //                                 .downloadFile(fileInfo: filesData[index]);
    //                           },
    //                           child: Container(
    //                             margin: EdgeInsets.only(top: 10.h),
    //                             width: 35.w,
    //                             height: 35.h,
    //                             decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(100.r),
    //                                 color: Colors.blue),
    //                             child: Stack(
    //                               children: [
    //                                 Padding(
    //                                   padding: const EdgeInsets.all(3),
    //                                   child: SizedBox(
    //                                     height: 45,
    //                                     width: 45,
    //                                     child: Visibility(
    //                                       visible: state.progress != 1.0,
    //                                       child: CircularProgressIndicator(
    //                                         value: state.progress,
    //                                         color: Colors.white,
    //                                         backgroundColor: Colors.blue,
    //                                         strokeWidth: 2,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 Center(
    //                                   child: state.progress != 1.0 &&
    //                                           state.progress == 0.0
    //                                       ? Icon(
    //                                           CupertinoIcons.down_arrow,
    //                                           color: Colors.white,
    //                                           size: 22.r,
    //                                         )
    //                                       : state.progress != 1.0 &&
    //                                               state.progress != 0.0
    //                                           ? Text(
    //                                               "${(state.progress * 100).toInt()}%",
    //                                               style: const TextStyle(
    //                                                   color: Colors.white),
    //                                             )
    //                                           : Icon(
    //                                               CupertinoIcons.doc_chart_fill,
    //                                               color: Colors.white,
    //                                               size: 22.r,
    //                                             ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                         title: Text(
    //                          "",
    //                           style: TextStyle(
    //                             fontFamily: "Poppins",
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 15.sp,
    //                             color: Colors.grey,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     );
    //   }),
    // );
  }
}
