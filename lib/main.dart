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
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(),
      child: Consumer(builder: (context, ThemeChanger themeChange, child) {
        return ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (BuildContext context, Widget? child) => MaterialApp(
            theme:
                themeChange.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: const SearchCountry(),
          ),
        );
      }),
    );
  }
}
