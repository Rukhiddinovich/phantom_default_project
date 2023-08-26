import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/login/login_screen.dart';
import 'package:default_project/ui/login_update/login_update_screen.dart';
import 'package:default_project/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String loginScreen = "/login_screen";
  static const String loginUpdate = "/login_update";
  static const String homeScreen = "/home_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteNames.loginUpdate:
        return MaterialPageRoute(
            builder: (context) => const LoginUpdateScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
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
