import 'package:default_project/cubits/user/year_cubit.dart';
import 'package:default_project/data/repository/year/year_repository.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/network/api_service.dart';

Future<void> main() async {
  runApp(App(apiService: ApiService()));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => YearRepository(apiService: apiService),
            lazy: true)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => YearCubit(context.read<YearRepository>()),
              lazy: true),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: const HomeScreen(),
        );
      },
    );
  }
}
