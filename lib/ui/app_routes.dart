import 'package:default_project/ui/file/read_all_files.dart';
import 'package:default_project/ui/music/music_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String musicScreen = "/";
  static const String  musicFile= "/music_file";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.musicFile:
        return MaterialPageRoute(
          builder: (context) => const MusicFile(),
        );
      case RouteNames.musicScreen:
        return MaterialPageRoute(
          builder: (context) => const MusicScreen(),
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
