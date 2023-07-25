import 'package:default_project/provider/calculate_provider.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/home/home_screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


Future<void> main()async {
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>CalculateProvider(),lazy: true,)
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: const HomeScreen3(),
        );
      },
    );
  }
}
