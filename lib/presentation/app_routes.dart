import 'package:default_project/presentation/document_flash_light/flash_lighting.dart';
import 'package:default_project/presentation/home/morse_flash_light.dart';
import 'package:default_project/presentation/settings/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String morseFlash = "/";
  static const String morseAlphabet = "/morse_alphabet";
  static const String settings = "/settings";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.morseAlphabet:
        return CupertinoPageRoute(builder: (context) => MorseAlphabetRead());
      case RouteNames.morseFlash:
        return CupertinoPageRoute(builder: (context) => MorseFlashLight());
      case RouteNames.settings:
        return CupertinoPageRoute(builder: (context) => SettingsScreen());
      default:
        return CupertinoPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}