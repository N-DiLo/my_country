import 'package:flutter/material.dart';
import 'package:my_country/constants/app_const.dart';
import 'package:my_country/constants/textstyles.dart';
import 'package:my_country/utils/responsive.dart';

class CountryDetials extends StatefulWidget {
  const CountryDetials({super.key});

  @override
  State<CountryDetials> createState() => _CountryDetialsState();
}

class _CountryDetialsState extends State<CountryDetials> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      mobile: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Country', style: language),
          elevation: 0,
          backgroundColor: AppColor.whiteColor,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
