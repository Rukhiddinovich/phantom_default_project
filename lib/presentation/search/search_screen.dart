import 'package:audioplayers/audioplayers.dart';
import 'package:default_project/data/models/dictionary_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/getx_controller/dictionary_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final DictionaryController dictionaryController = Get.find();

  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        backgroundColor: Colors.teal,
        title: Text(
          "Search Screen",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                dictionaryController.word.value = value;
              },
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 25.r),
                  labelText: "Search Word",
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins"),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.teal)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.teal)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.teal))),
            ),
          ),
          SizedBox(height: 20.h),
          ZoomTapAnimation(
            onTap: () async {
              await dictionaryController.getWordDefinitionList(
                  context: context);
              dictionaryController.isSearchTapped.value = true;
              setState(() {});
            },
            child: Container(
              width: 100.w,
              height: 50.h,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.teal, blurRadius: 5.r)],
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.teal,
              ),
              child: Center(
                child: Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          dictionaryController.dictionaryModel.isNotEmpty
              ? Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(
                        dictionaryController.dictionaryInfo.value.meanings[0]
                            .definitions.length,
                        (index) {
                          DictionaryModel dictionaryModel =
                              dictionaryController.dictionaryInfo.value;
                          return Container(
                            padding: EdgeInsets.all(16.r),
                            margin: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.teal, blurRadius: 5.r)
                                ],
                                borderRadius: BorderRadius.circular(16.r),
                                border:
                                    Border.all(width: 1, color: Colors.teal)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Part of Speech: ${dictionaryModel.meanings[0].partOfSpeech}",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.black),
                                ),
                                Text(
                                  "Definition: ",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.black),
                                ),
                                Text(
                                  dictionaryModel.meanings[0].definitions[index]
                                      .definition,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : SizedBox(height: 0.h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.r))),
        backgroundColor: Colors.teal,
        onPressed: () {
          final player = AudioPlayer();
          player.play(UrlSource(
              dictionaryController.dictionaryModel[0].phonetics[0].audio));
          setState(() {
            isClick = !isClick;
          });
        },
        child: isClick
            ? Icon(CupertinoIcons.pause_fill, color: Colors.white, size: 30.r)
            : Icon(CupertinoIcons.play_fill, color: Colors.white, size: 30.r),
      ),
    );
  }
}
// Nbhg5UjtUkvT
