import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/data/network/api_repository.dart';
import 'package:default_project/models/product/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";

  final ProductRepository productRepository =
      ProductRepository(apiProvider: ApiProvider());
  List<ProductsModel> product = [];

  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    product = await productRepository.fetchCurrencies();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Products",
          style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "MetalMania",
              letterSpacing: 3,
              color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Monster",
          style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "MetalMania",
              letterSpacing: 3,
              color: Colors.red),),
      )
    );
  }
}
