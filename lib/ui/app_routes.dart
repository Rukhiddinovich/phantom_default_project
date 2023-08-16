import 'package:default_project/ui/flag_uzb/flag_uzb_screen.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/snowman/snowman_screen.dart';
import 'package:default_project/ui/stickers/stickers_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String flagScreen = "/flag";
  static const String stickersScreen = "/stickers";
  static const String snowmanScreen = "/snowmanScreen";
  static const String homeScreen = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.flagScreen:
        return MaterialPageRoute(
          builder: (context) => const FlagUzbScreen(),
        );
      case RouteNames.stickersScreen:
        return MaterialPageRoute(
          builder: (context) => const StickersScreen(),
        );
      case RouteNames.snowmanScreen:
        return MaterialPageRoute(
          builder: (context) =>
              const SnowmanScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}
