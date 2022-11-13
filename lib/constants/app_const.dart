import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppColor {
  static const grayWarm = Color(0xff1C1917);
  static const appLogo = Color(0xff001637);
  static const grayText = Color(0xff667085);
  static const gray = Color(0xff98A2B3);
  static const dotColor = Color(0xffFF6C00);
  static const whiteColor = Color(0xffFFFFFF);
  static const searchColor = Color(0xffF2F4F7);
  static const darkMode = Color(0xff000F24);
  static const modeColor = Color(0xffFCFCFD);
  static const shadowColor = Color(0xffA9B8D4);
}

//ChangeNotifier class for ThemeData
class ThemeChanger extends ChangeNotifier {
  late bool _isDarkTheme;
  late AppThemePref _pref;
  bool get isDarkTheme => _isDarkTheme;

  ThemeMode themeMode = ThemeMode.dark;

  ThemeChanger() {
    _isDarkTheme = false;
    _pref = AppThemePref();
    getPreferences();
  }

  //Changing App Theme mode
  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    _pref.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDarkTheme = await _pref.getTheme();
    notifyListeners();
  }
}

//Theme Preference class to store user previous selected Theme
class AppThemePref {
  static const appThemeKEY = 'theme_key';

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(appThemeKEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(appThemeKEY) ?? false;
  }
}

Widget defaultVerticalSpacing = SizedBox(height: ScreenUtil().setHeight(26));
Widget defaultHorizontalSpacing = SizedBox(width: ScreenUtil().setWidth(24));
