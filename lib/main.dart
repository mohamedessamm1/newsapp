import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mansour/cubit/appcubit.dart';
import 'package:weather_app_mansour/cubit/statecubit.dart';
import 'package:weather_app_mansour/layout/layout_news.dart';
import 'package:weather_app_mansour/network/cache.dart';
import 'package:weather_app_mansour/network/dio.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isdark= true;
  MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appcubit()
        ..getbusniss()
        ..changemode(fromshared: isdark),
      child: BlocConsumer<appcubit, newsstate>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  scaffoldBackgroundColor: Colors.white,
                  primarySwatch: Colors.indigo,
                  appBarTheme: const AppBarTheme(
                      toolbarHeight: 35,
                      color: Colors.indigo,
                      systemOverlayStyle:
                          SystemUiOverlayStyle(statusBarColor: Colors.indigo))),
              darkTheme: ThemeData(
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  scaffoldBackgroundColor: HexColor('#000000'),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      unselectedItemColor: Colors.grey,
                      backgroundColor: Colors.black,
                      selectedItemColor: Colors.indigo),
                  appBarTheme: AppBarTheme(
                      toolbarHeight: 35,
                      color: Colors.indigo,
                      systemOverlayStyle:
                          SystemUiOverlayStyle(statusBarColor: Colors.indigo))),
              themeMode: appcubit.get(context).isdark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: layoutnews());
        },
      ),
    );
  }
}
