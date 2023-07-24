import 'package:default_project/ui/screens/screen1.dart';
import 'package:default_project/ui/screens/screen10.dart';
import 'package:default_project/ui/screens/screen11.dart';
import 'package:default_project/ui/screens/screen12.dart';
import 'package:default_project/ui/screens/screen13.dart';
import 'package:default_project/ui/screens/screen14.dart';
import 'package:default_project/ui/screens/screen15.dart';
import 'package:default_project/ui/screens/screen16.dart';
import 'package:default_project/ui/screens/screen2.dart';
import 'package:default_project/ui/screens/screen3.dart';
import 'package:default_project/ui/screens/screen4.dart';
import 'package:default_project/ui/screens/screen5.dart';
import 'package:default_project/ui/screens/screen6.dart';
import 'package:default_project/ui/screens/screen7.dart';
import 'package:default_project/ui/screens/screen8.dart';
import 'package:default_project/ui/screens/screen9.dart';
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
      case fifthScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenFive());
      case sixthScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenSix());
      case seventhScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenSeven());
      case eighthScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenEight());
      case ninthScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenNine());
      case tenthScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenTen());
      case elevenScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenEleven());
      case twelveScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenTwelve());
      case thirteenScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenThirteen());
      case fourteenScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenFourteen());
      case fifteenScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenFiveTeen());
      case sixteenScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScreenSixTeen());

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
