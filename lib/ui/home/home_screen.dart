import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/data/model/pokemon_model.dart';
import 'package:default_project/data/network/api_repository.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/ui/home/info_screen.dart';
import 'package:default_project/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PokemonModel> pokemon = [];
  ApiProvider apiProvider = ApiProvider();
  ApiRepository apiRepository = ApiRepository(apiProvider: ApiProvider());

  bool isLoading = false;

  _init() async {
    setState(() {
      isLoading = true;
    });
    pokemon = await apiRepository.getAllData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : pokemon.isEmpty
          ? const Center(child: Text("An error occurred!"))
          : Column(
        children: [
          SizedBox(height: 30.h),
          Center(
            child: Image.asset(AppImages.pokemon,
                width: 252.w, height: 88.h),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 296.w,
            height: 42.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.C_E5E5E5),
            child: Center(
              child: Text(
                "Buscar Pokémon",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                    color: AppColors.C_838282),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: GridView.builder(
              itemCount: pokemon.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ZoomTapAnimation(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return  InfoScreen(
                          pokemonModel: pokemon[index],
                        );
                      }));
                    },
                    child: SizedBox(
                      height: 150.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 177.w,
                            height: 115.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.C_FC7CFF,
                                  AppColors.C_FA5AFD
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                    imageUrl: pokemon[index].img),
                                SizedBox(height: 10.h),
                                Container(
                                  width: 140.w,
                                  height: 27.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10.r),
                                      color: AppColors.C_676767),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "#${pokemon[index].number}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        pokemon[index].name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
