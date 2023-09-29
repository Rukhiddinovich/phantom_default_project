import 'dart:async';
import 'package:default_project/presentation/app_routes.dart';
import 'package:default_project/presentation/home/widgets/global_alphabet.dart';
import 'package:default_project/utils/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:torch_light/torch_light.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MorseFlashLight extends StatefulWidget {
  const MorseFlashLight({super.key});

  @override
  State<MorseFlashLight> createState() => _MorseFlashLightState();
}

class _MorseFlashLightState extends State<MorseFlashLight> {
  bool isFlash = true;
  bool check = true;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_17191C,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.C_17191C),
        backgroundColor: AppColors.C_17191C,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 120.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "A")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "B")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "C")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "D")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "E")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "F")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "G")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "H")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "I")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "J")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "K")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "L")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "M")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "N")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "O")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "P")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "Q")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "R")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "S")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "T")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "U")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "V")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "W")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "X")),
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "Y")),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomTapAnimation(
                    onTap: check
                        ? () async {
                            setState(() {
                              check = false;
                            });
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _longFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            await _shortFlash(context);
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              check = true;
                            });
                          }
                        : () {},
                    child: const GlobalAlphabet(text: "Z")),
              ],
            ),
          ),
          SizedBox(height: 80.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isFlash
                  ? ZoomTapAnimation(
                      onTap: () {
                        setState(() {
                          isFlash = !isFlash;
                        });
                        _turnOnFlash(context);
                      },
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.C_32383E),
                        child: Center(
                          child: Icon(Icons.flashlight_on_rounded,
                              color: Colors.white, size: 30.r),
                        ),
                      ),
                    )
                  : ZoomTapAnimation(
                      onTap: () {
                        setState(() {
                          isFlash = !isFlash;
                        });
                        _turnOffFlash(context);
                      },
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.C_32383E),
                        child: Center(
                          child: Icon(Icons.flashlight_off_rounded,
                              color: Colors.white, size: 30.r),
                        ),
                      ),
                    ),
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.morseAlphabet);
                },
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColors.C_32383E),
                  child: Center(
                    child: Icon(CupertinoIcons.doc_text_fill,
                        color: Colors.white, size: 30.r),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _turnOnFlash(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showErrorMessage('Could not enable Flashlight', context);
    }
  }

  Future<void> _turnOffFlash(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showErrorMessage('Could not enable Flashlight', context);
    }
  }

  void _showErrorMessage(String mes, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mes)));
  }

  Future<void> _longFlash(BuildContext context) async {
    try {
      _turnOnFlash(context);
      await Future.delayed(const Duration(seconds: 1));
      _turnOffFlash(context);
    } catch (e) {
    }
  }

  Future<void> _shortFlash(BuildContext context) async {
    try {
      _turnOnFlash(context);
      await Future.delayed(const Duration(milliseconds: 200));
      _turnOffFlash(context);
    } catch (e) {
    }
  }
}
