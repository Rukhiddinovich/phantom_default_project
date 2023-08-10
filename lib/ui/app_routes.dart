import 'package:default_project/ui/profile/profile_screen.dart';
import 'package:default_project/ui/tab_box.dart';
import 'package:flutter/material.dart';

import 'home/news_screen.dart';
import 'home/widgets/news_screen_detail.dart';
class RouteNames {
  static const String homeScreen = "/home_screen";
  static const String newsDetail = "/news_detail";
  static const String profileScreen = "/profile_screen";
  static const String tabBox = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.newsDetail:
        return MaterialPageRoute(
          builder: (context) {
            Map<String,dynamic> map = settings.arguments as Map<String,dynamic>;
            return NewsDetailScreen(newsModel: map["model"],index: map["index"],);
          },
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const NewsScreen(),
        );
      case RouteNames.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const TabBoxScreen(),
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
