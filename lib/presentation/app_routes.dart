import 'package:default_project/presentation/home/add_screen.dart';
import 'package:default_project/presentation/home/home_screen.dart';
import 'package:default_project/presentation/home/product_sales.dart';
import 'package:default_project/presentation/home/widgets/qrCode_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String homeScreen = "/";
  static const String addProduct = "/add_product";
  static const String qrCode = "/qr_code";
  static const String productSales = "/product_sales";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.addProduct:
        return MaterialPageRoute(
            builder: (context) =>
                AddProductScreen(barCode: settings.arguments as String));
      case RouteNames.qrCode:
        return MaterialPageRoute(builder: (context) => QRViewExample());
      case RouteNames.productSales:
        return MaterialPageRoute(builder: (context) => ProductSales());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not available!"),
            ),
          ),
        );
    }
  }
}
