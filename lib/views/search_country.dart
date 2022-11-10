import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_country/constants/app_const.dart';
import 'package:my_country/constants/textstyles.dart';

import 'package:my_country/utils/responsive.dart';
import 'package:my_country/utils/app_container.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      mobile: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: REdgeInsets.only(right: 24.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.light_mode_outlined,
                  color: AppColor.grayWarm,
                ),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: AppColor.whiteColor,
          title: RichText(
            text: TextSpan(
                text: 'Explore',
                style: myAppBarText,
                children: [TextSpan(text: '.', style: logoDot)]),
          ),
        ),
        backgroundColor: AppColor.whiteColor,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SearchBar(),
              SizedBox(height: ScreenUtil().setHeight(16)),
              const SelectZone(),
            ],
          ),
        ),
      ),
    );
  }
}
