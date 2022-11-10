import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_country/constants/app_const.dart';
import 'package:my_country/constants/textstyles.dart';
import 'package:my_country/utils/app_bottomsheet.dart';
import 'package:my_country/utils/responsive.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: (BuildContext context, ScreenSizeInfo screenSizeInfo) =>
          Container(
        height: ScreenUtil().setHeight(48),
        width: ScreenUtil().setWidth(380),
        decoration: const BoxDecoration(
            color: AppColor.searchColor,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: TextFormField(
          textAlign: TextAlign.center,
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
            contentPadding: REdgeInsets.all(12),
          ),
        ),
      ),
    );
  }
}

//Containers used for changing languages and filtering time zones

class SelectZone extends StatelessWidget {
  const SelectZone({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => showModalBottomSheet(
              elevation: 0.2,
              context: context,
              builder: (_) => const LangBottomSheet()),
          child: Container(
            padding: REdgeInsets.all(8),
            width: ScreenUtil().setWidth(73),
            height: ScreenUtil().setHeight(40),
            decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: AppColor.shadowColor),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              children: [
                Icon(
                  Icons.language_outlined,
                  size: ScreenUtil().radius(30),
                  color: AppColor.grayWarm,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(8),
                ),
                Text(
                  'EN',
                  style: appLang,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => showModalBottomSheet(
              elevation: 0.2,
              context: context,
              builder: (_) => const FilterBottomSheet()),
          child: Container(
            padding: REdgeInsets.all(8),
            width: ScreenUtil().setWidth(86),
            height: ScreenUtil().setHeight(40),
            decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: AppColor.shadowColor),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              children: [
                Icon(
                  Icons.filter_alt_outlined,
                  size: ScreenUtil().radius(30),
                  color: AppColor.grayWarm,
                ),
                SizedBox(width: ScreenUtil().setWidth(8)),
                Text('Filter', style: appLang)
              ],
            ),
          ),
        )
      ],
    );
  }
}
