import 'package:default_project/data/models/car/car_model.dart';
import 'package:default_project/data/models/country/model.dart';
import 'package:default_project/ui/car_screen/car_screen.dart';
import 'package:default_project/ui/country_screen/country_screen.dart';
import 'package:default_project/ui/country_screen/widgets/country_detail_screen.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/honda_screen/honda_screen.dart';
import 'package:flutter/material.dart';

import 'car_screen/widgets/car_detail_screen.dart';

class RouteNames {
  static const String countryScreen = "/country";
  static const String carScreen = "/car";
  static const String hondaScreen = "/honda";
  static const String countryDetail = "/countryDetail";
  static const String carDetail = "/carDetail";
  static const String homeScreen = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.countryScreen:
        return MaterialPageRoute(
          builder: (context) => const CountryScreen(),
        );
      case RouteNames.carScreen:
        return MaterialPageRoute(
          builder: (context) => const CarScreen(),
        );
      case RouteNames.hondaScreen:
        return MaterialPageRoute(
          builder: (context) => const HondaScreen(),
        );
      case RouteNames.countryDetail:
        return MaterialPageRoute(
          builder: (context) =>
              CountryDetailScreen(country: settings.arguments as Country),
        );
      case RouteNames.carDetail:
        return MaterialPageRoute(
          builder: (context) =>
              CarDetailScreen(car: settings.arguments as Datum),
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
