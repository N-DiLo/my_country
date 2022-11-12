import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: ScreenUtil().setWidth(380),
                  height: ScreenUtil().setHeight(250),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(details.flags!.png!))),
                ),
                defaultVerticalSpacing,
                RichText(
                  text: TextSpan(
                      text: 'Population: ',
                      style: detailsHeader,
                      children: [
                        TextSpan(
                            text: '${details.name!.common}\n',
                            style: detailsBody),
                        TextSpan(text: 'Region: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.region}\n', style: detailsBody),
                        TextSpan(text: 'Capital: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.capital}\n', style: detailsBody),
                        TextSpan(text: 'Motto: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.subregion}\n', style: detailsBody),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
