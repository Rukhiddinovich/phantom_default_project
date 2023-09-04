import 'package:default_project/presentation/home/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'bloc/country_bloc.dart';
import 'bloc/country_event.dart';
import 'data/api/api.dart';

void main() => runApp(MyApp(productApiClient: CountryApiClient.create()));

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.productApiClient});

  final CountryApiClient productApiClient;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => CountryBloc(
                productApiClient: productApiClient,
              )..add(CountryFetchStarted()),
            ),
          ],
          child: GraphQLProvider(
            client: ValueNotifier(CountryApiClient.create().graphQLClient),
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: CountryScreen(),
            ),
          ),
        );
      },
    );
  }
}
