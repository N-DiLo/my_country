import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_country/constants/app_const.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.whiteColor,
      elevation: 0,
      expandedHeight: 160,
      collapsedHeight: 160,
      floating: true,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.light_mode_outlined))
      ],
      title: RichText(
        text: TextSpan(
            text: 'Explore',
            style: GoogleFonts.elsieSwashCaps(
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
                  Icons.search,
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
