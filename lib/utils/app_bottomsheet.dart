import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_country/constants/app_const.dart';
import 'package:my_country/constants/textstyles.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Languages', style: language),
                Container(
                  width: ScreenUtil().setWidth(20),
                  height: ScreenUtil().setHeight(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.shadowColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColor.gray,
                    size: ScreenUtil().radius(15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter', style: language),
                Container(
                  width: ScreenUtil().setWidth(20),
                  height: ScreenUtil().setHeight(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.shadowColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColor.gray,
                    size: ScreenUtil().radius(15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
