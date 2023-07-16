import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/pokemon_model.dart';
import '../../data/network/api_provider.dart';
import '../../data/network/api_repository.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.pokemonModel});

  final PokemonModel pokemonModel;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
          SizedBox(height: 10.h),
          Center(
            child: Image.asset(AppImages.pokemon,
                width: 252.w, height: 88.h),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 20.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 25.w),
                Container(
                  width: 228.w,
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
                const Spacer(),
                ZoomTapAnimation(
                  child: SvgPicture.asset(AppImages.menu),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 290.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 320.w,
                  height: 210.h,
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
                  child: Row(
                    children: [
                      SizedBox(
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(height: 10.h),
                                Text(
                                  "#${widget.pokemonModel.number}",
                                  style: TextStyle(
                                      color: AppColors.C_FC7CFF,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "Poppins",
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                            CachedNetworkImage(
                                imageUrl: widget.pokemonModel.img,
                                height: 190.h,
                                fit: BoxFit.fill),
                            Row(
                              children: [
                                SizedBox(height: 10.h),
                                Text(
                                  widget.pokemonModel.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "Poppins",
                                      fontSize: 14.sp),
                                ),
                              ],
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
          SizedBox(height: 22.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                Container(
                  width: 154.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.C_FCA600),
                  child: Center(
                    child: Text(
                      widget.pokemonModel.type[0],
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: "Poppins",
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 7.w),
                Container(
                  width: 154.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.C_0083FC),
                  child: Center(
                    child: Text(
                      widget.pokemonModel.type[1],
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: "Poppins",
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Container(
            height: 243.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60.r),
                  topLeft: Radius.circular(60.r),
                ),
                color: AppColors.C_FA5AFD),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 41.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Altura",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      ),
                      Text(
                        "Categoría",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      ),
                      Text(
                        "Debilidad",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Text(
                        widget.pokemonModel.height,
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 30.w),
                      Text(
                        "Llama",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 45.w),
                      SvgPicture.asset(AppImages.blue),
                      SizedBox(width: 10.w),
                      Text(
                        "${widget.pokemonModel.weaknesses[0]}",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 200.w),
                      SvgPicture.asset(AppImages.yellow),
                      SizedBox(width: 10.w),
                      Text(
                        "${widget.pokemonModel.weaknesses[1]}",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Text(
                        "Peso",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      ),
                      SizedBox(width: 45.w),
                      Text(
                        "Sexo",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      ),
                      SizedBox(width: 53.w),
                      SvgPicture.asset(AppImages.darkYellow),
                      SizedBox(width: 10.w),
                      Text(
                        "${widget.pokemonModel.weaknesses[2]}",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Text(
                        widget.pokemonModel.weight,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: Colors.white54),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        widget.pokemonModel.egg,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: Colors.white54),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ListTile(
                    title: Text(
                      "Habilidades",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      widget.pokemonModel.candy,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Colors.white54),
                    ),
                    trailing:  Image.asset(AppImages.boyPokemon,width: 129.w,height: 150.h),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}