import 'package:default_project/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String home = "/";
  static const String addContact = "/add_contact";
  static const String contactDetails = "/contact_details";
  static const String contactUpdate = "/contact_update";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
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