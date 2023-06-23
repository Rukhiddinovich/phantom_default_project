import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/products/second_screen.dart';
import 'package:default_project/ui/products/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String splash = "/";
  static const String homeScreen = "/home_screen";
  static const String secondScreen = "/second_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RouteNames.secondScreen:
        return MaterialPageRoute(builder: (context) {
          Map<String, String> map = settings.arguments as Map<String, String>;

          return SecondScreen(
            text1: map["name_text"] as String,
            text2: map["lastName_text"] as String,
          );
        });

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("Route not available"),
                  ),
                ));
    }
  }
}
