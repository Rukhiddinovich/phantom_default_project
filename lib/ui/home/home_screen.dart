import 'package:default_project/data/models/google_search_model.dart';
import 'package:default_project/data/models/universal_response.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/local/storage_repository.dart';
import 'package:default_project/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/organic_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController queryController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int page = 1;
  int countPage = 5;
  String queryText = "";
  bool isLoading = false;
  List<String> queries =
      StorageRepository.getList("searchHistory").toSet().toList();

  List<OrganicModel> organicModels = [];
  List<String> searchSuggestions = [];

  @override
  void initState() {
    super.initState(); // Load search history when the widget is created
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _fetchResult();
      }
    });
  }

  _fetchResult() async {
    setState(() {
      isLoading = true;
    });
    page++;

    UniversalResponse universalResponse = await ApiProvider.searchFromGoogle(
        query: queryText, page: page, count: countPage);
    queries.add(queryText);
    queries = queries.toSet().toList();
    StorageRepository.putList("searchHistory", queries);
    setState(() {
      isLoading = false;
    });

    if (universalResponse.error.isEmpty) {
      GoogleSearchModel googleSearchModel =
          universalResponse.data as GoogleSearchModel;
      organicModels.addAll(googleSearchModel.organicModels);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Lottie.asset(AppImages.google),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            TextField(
              onChanged: (value) {
                setState(() {
                  queryText = value;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  organicModels.clear();
                  page = 1;
                });
                _fetchResult();
              },
              controller: queryController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.search,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(18.sp),
                fillColor: Colors.black,
                suffixIcon: queryText.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            queryText = "";
                            organicModels = [];
                          });
                          queryController.clear();
                        },
                      ),
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 22.sp,
                  color: Colors.white,
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    fontFamily: "Poppins",
                    color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.blue)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.red)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.green)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.white)),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 40.h,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                      queries.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          border: Border.all(
                            width: 1.w,
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(queries[index],style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 13.sp),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 11.w),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: organicModels.length + 1,
                itemBuilder: (context, index) {
                  if (index < organicModels.length) {
                    OrganicModel organicModel = organicModels[index];
                    return Container(
                      margin: EdgeInsets.all(16.sp),
                      padding: EdgeInsets.all(16.sp),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            organicModel.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            organicModel.snippet,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: "Poppins"),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            organicModel.link,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: "Poppins"),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            organicModel.date,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    );
                  } else if (isLoading) {
                    return Column(
                      children: [
                        SizedBox(height: 100.h),
                        Center(
                          child: Lottie.asset(AppImages.loading, width: 150.w),
                        ),
                      ],
                    );
                  } else if (organicModels.isEmpty) {
                    return Column(
                      children: [
                        for (String suggestion in searchSuggestions)
                          ListTile(
                            onTap: () {
                              setState(() {
                                queryText = suggestion;
                              });
                              queryController.text = suggestion;
                              organicModels.clear();
                              page = 1;
                              _fetchResult();
                            },
                            title: Text(suggestion),
                            leading: const Icon(Icons.search),
                          ),
                      ],
                    );
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
