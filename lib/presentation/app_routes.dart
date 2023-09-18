import 'package:default_project/presentation/flash/flash_lighting.dart';
import 'package:default_project/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String morseFlash = "/";
  static const String morseAlphabet = "/morse_alphabet";
  static const String authScreen = "/auth_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.morseAlphabet:
        return MaterialPageRoute(builder: (context) => MorseAlphabetRead());
      case RouteNames.morseFlash:
        return MaterialPageRoute(builder: (context) => MorseFlashLight());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}