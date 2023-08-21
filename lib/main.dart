import 'package:default_project/cubits/calculate/calculate_cubit.dart';
import 'package:default_project/cubits/login/login_cubit.dart';
import 'package:default_project/cubits/tab_box/tab_box_cubit.dart';
import 'package:default_project/ui/tab_box/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => CalculateCubit(),
        lazy: true,
      ),
      BlocProvider(
        create: (_) => TabBoxCubit(),
        lazy: true,
      ),
      BlocProvider(
        create: (_) => LoginCubit(),
        lazy: true,
      )
    ], child: const MyApp());
  }
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
          home: const TabBoxScreen(),
        );
      },
    );
  }
}
