import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_country/constants/app_const.dart';

TextStyle myAppBarText = GoogleFonts.elsie(
    fontSize: ScreenUtil().setSp(25),
    color: AppColor.appLogo,
    fontWeight: FontWeight.w700);

TextStyle logoDot = GoogleFonts.elsie(
    fontSize: ScreenUtil().setSp(25),
    color: AppColor.dotColor,
    fontWeight: FontWeight.w700);

TextStyle appLang = TextStyle(
    fontFamily: 'Axiforma',
    fontSize: ScreenUtil().setSp(12),
    color: Colors.black,
    fontWeight: FontWeight.w500);

TextStyle language = TextStyle(
    fontFamily: 'Axiforma',
    fontSize: ScreenUtil().setSp(20),
    color: Colors.black,
    fontWeight: FontWeight.w700);

TextStyle timezones = TextStyle(
    fontFamily: 'Axiforma',
    fontSize: ScreenUtil().setSp(16),
    color: Colors.black,
    fontWeight: FontWeight.w400);
