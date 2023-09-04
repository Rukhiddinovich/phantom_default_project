import 'package:default_project/presentation/home/country_screen.dart';
import 'package:default_project/presentation/home/widgets/country_detail_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String home = "/";
  static const String productDetail = "/product_detail";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (context) => const CountryScreen());
      case RouteNames.productDetail:
        return MaterialPageRoute(builder: (context) => const CountryDetailScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not available"),
            ),
          ),
        );
    }
  }
}