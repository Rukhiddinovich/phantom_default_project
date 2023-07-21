import 'package:default_project/ui/screens/screen1.dart';
import 'package:default_project/ui/screens/screen2.dart';
import 'package:default_project/ui/screens/screen3.dart';
import 'package:default_project/ui/screens/screen4.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'home/home_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case firstScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenOne());
      case secondScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenTwo());
      case thirdScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenThree());
      case fourthScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenFour());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}'),
                  ),
                ),
        );
    }
  }
}
