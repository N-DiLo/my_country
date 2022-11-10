import 'package:flutter/material.dart';
import 'package:my_country/constants/app_header.dart';
import 'package:my_country/utils/responsive.dart';

class CountryDetials extends StatefulWidget {
  const CountryDetials({super.key});

  @override
  State<CountryDetials> createState() => _CountryDetialsState();
}

class _CountryDetialsState extends State<CountryDetials> {
  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      mobile: Scaffold(
        backgroundColor: Colors.white,
        body: AppHeader(),
      ),
    );
  }
}
