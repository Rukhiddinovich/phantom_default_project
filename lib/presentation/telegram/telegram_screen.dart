import 'package:default_project/data/models/file_download_model.dart';
import 'package:default_project/utils/colors/colors.dart';
import 'package:default_project/utils/icons/icons.dart';
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
                Padding(
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
                            child: Image.asset(
                              AppImages.profile,
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
                        height: 80.h,
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
                              // margin: EdgeInsets.only(top: 10.h),
                              width: 35.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: Colors.blue),
                              child: Stack(
                                children: [
                                  Center(
                                    child: state.progress != 1.0 &&
                                            state.progress == 0.0
                                        ? Icon(
                                            Icons.arrow_downward,
                                            color: Colors.white,
                                            size: 22.r,
                                          )
                                        : state.progress != 1.0 &&
                                                state.progress != 0.0
                                            ? Icon(Icons.clear,
                                                color: Colors.white, size: 22.r)
                                            : Icon(
                                                CupertinoIcons.doc_chart_fill,
                                                color: Colors.white,
                                                size: 22.r,
                                              ),
                                  ),
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
                          subtitle: state.progress != 0 && state.progress != 1.0
                              ? Text(
                                  "${(fileInfo.memory * state.progress).toString().substring(0, 4)} / ${fileInfo.memory} MB",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "${fileInfo.memory.toString()} MB",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateTime.now().toString().substring(11, 16),
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
