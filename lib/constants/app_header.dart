import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_country/constants/app_const.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.whiteColor,
      elevation: 0,
      expandedHeight: 160,
      collapsedHeight: 160,
      floating: true,
      pinned: true,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Explore',
                    style: GoogleFonts.quicksand(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w700,
                        color: AppColor.appLogo),
                    children: <TextSpan>[
                      TextSpan(
                          text: '.',
                          style: GoogleFonts.elsieSwashCaps(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColor.dotColor))
                    ]),
              ),
              Container(
                width: ScreenUtil().setWidth(32),
                height: ScreenUtil().setHeight(32),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Icon(
                  Icons.light_mode_outlined,
                  color: AppColor.grayWarm,
                ),
              )
            ],
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: ScreenUtil().setHeight(48),
            width: ScreenUtil().setWidth(380),
            decoration: const BoxDecoration(
                color: AppColor.searchColor,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  FlatIcons.search,
                  size: ScreenUtil().radius(20),
                  color: AppColor.grayText,
                ),
                hintText: 'Search Country',
                hintStyle: TextStyle(
                    fontFamily: 'Axiforma',
                    color: AppColor.grayText,
                    fontSize: ScreenUtil().setSp(16),
                    fontWeight: FontWeight.w300),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: REdgeInsets.all(11),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
