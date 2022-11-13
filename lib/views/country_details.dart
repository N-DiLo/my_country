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
            elevation: 0),
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil().setHeight(16)),
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
                            text: '${details.population}\n',
                            style: detailsBody),
                        TextSpan(text: 'Region: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.region}\n', style: detailsBody),
                        TextSpan(text: 'Capital: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.capital!.first}\n',
                            style: detailsBody),
                        TextSpan(text: 'Motto: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.timezones!.first}\n',
                            style: detailsBody),
                      ]),
                ),
                defaultHorizontalSpacing,
                RichText(
                  text: TextSpan(
                      text: 'Official Language: ',
                      style: detailsHeader,
                      children: [
                        TextSpan(
                            text: '${details.demonyms!.eng!.f}\n',
                            style: detailsBody),
                        TextSpan(text: 'Ethnic group: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.population}\n',
                            style: detailsBody),
                        TextSpan(text: 'Religion: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.capitalInfo!.latlng!}\n',
                            style: detailsBody),
                        TextSpan(text: 'Government: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.area!.sign}\n',
                            style: detailsBody),
                      ]),
                ),
                defaultHorizontalSpacing,
                RichText(
                  text: TextSpan(
                      text: 'Independence: ',
                      style: detailsHeader,
                      children: [
                        TextSpan(
                            text: '${details.independent}\n',
                            style: detailsBody),
                        TextSpan(text: 'Currency: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.currencies!.aed?.symbol}\n',
                            style: detailsBody),
                        TextSpan(text: 'Area: ', style: detailsHeader),
                        TextSpan(text: '${details.area}\n', style: detailsBody),
                        TextSpan(text: 'GDP: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.subregion}\n', style: detailsBody),
                      ]),
                ),
                defaultHorizontalSpacing,
                RichText(
                  text: TextSpan(
                      text: 'Time zones: ',
                      style: detailsHeader,
                      children: [
                        TextSpan(
                            text: '${details.timezones!.first}\n',
                            style: detailsBody),
                        TextSpan(text: 'Date format: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.maps!.googleMaps}\n',
                            style: detailsBody),
                        TextSpan(text: 'Dailing code: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.postalCode}\n',
                            style: detailsBody),
                        TextSpan(text: 'Driving side: ', style: detailsHeader),
                        TextSpan(
                            text: '${details.car!.side}\n', style: detailsBody),
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
