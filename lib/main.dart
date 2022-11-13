import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_country/constants/app_const.dart';
import 'package:my_country/views/search_country.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData lightTheme = ThemeData(
        scaffoldBackgroundColor: AppColor.whiteColor,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.whiteColor,
            foregroundColor: AppColor.grayWarm),
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        primaryColorLight: AppColor.grayWarm,
        primaryColorDark: AppColor.grayWarm);

    ThemeData darkTheme = ThemeData(
        scaffoldBackgroundColor: AppColor.darkMode,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.darkMode,
            foregroundColor: AppColor.whiteColor),
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        primaryColorLight: AppColor.whiteColor,
        primaryColorDark: AppColor.whiteColor);

    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeChanger(),
      child: Consumer(
        builder: (context, ThemeChanger themeChanger, child) => ScreenUtilInit(
          designSize: const Size(428, 926),
          useInheritedMediaQuery: true,
          builder: (BuildContext context, Widget? child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeChanger.isDarkTheme ? lightTheme : darkTheme,
            themeMode: ThemeMode.system,
            home: const SearchCountry(),
          ),
        ),
      ),
    );
  }
}
