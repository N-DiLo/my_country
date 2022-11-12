import 'package:flutter/material.dart';
import 'package:my_country/constants/app_const.dart';
import 'package:my_country/constants/textstyles.dart';
import 'package:my_country/models/app_model.dart';
import 'package:my_country/utils/responsive.dart';

class CountryDetials extends StatelessWidget {
  final Explore details;
  const CountryDetials({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      mobile: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(details.name!.common!, style: language),
            elevation: 0,
            backgroundColor: AppColor.whiteColor),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
