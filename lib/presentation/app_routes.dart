import 'package:default_project/presentation/home/add_screen.dart';
import 'package:default_project/presentation/home/home_screen.dart';
import 'package:default_project/presentation/home/product_sales.dart';
import 'package:default_project/presentation/home/widgets/qrCode_screen.dart';
import 'package:default_project/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String splash = "/";
  static const String homeScreen = "/home_screen";
  static const String addProduct = "/add_product";
  static const String qrCode = "/qr_code";
  static const String productSales = "/product_sales";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteNames.addProduct:
        return MaterialPageRoute(
            builder: (context) {
              final map = (settings.arguments as Map<String, dynamic>);
              return AddProductScreen(
                barCode: map['product'], code: map['code'],);
            });
      case RouteNames.qrCode:
        return MaterialPageRoute(builder: (context) => const QRViewExample());
      case RouteNames.productSales:
        return MaterialPageRoute(builder: (context) => const ProductSales());
      default:
        return MaterialPageRoute(
          builder: (context) =>
          const Scaffold(
            body: Center(
              child: Text("Route not available!"),
            ),
          ),
        );
    }
  }
}
