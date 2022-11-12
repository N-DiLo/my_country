import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_country/constants/app_const.dart';
import 'package:my_country/constants/textstyles.dart';

class AppButton extends StatelessWidget {
  final Color? primary;
  final Color? backgroundColor;
  final BorderSide? side;
  final Size? minimumSize;
  final String? text;

  final Function() onPressed;

  const AppButton(
      {Key? key,
      required this.primary,
      this.side,
      this.minimumSize,
      required this.text,
      required this.onPressed,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: REdgeInsets.all(10),
        foregroundColor: primary,
        backgroundColor: backgroundColor,
        side: side,
        textStyle: timezones,
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().radius(4))),
      ),
      onPressed: onPressed,
      child: Text(text!),
    );
  }
}

class LabeledRadioButton extends StatelessWidget {
  const LabeledRadioButton({
    Key? key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final int value, groupValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(label, style: timezones),
          ),
          Radio(
            activeColor: AppColor.grayWarm,
            groupValue: groupValue,
            value: value,
            onChanged: (int? newValue) {
              onChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
