import 'package:flutter/material.dart';
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

class AppThemes {
  static final darkMode = ThemeData(
      scaffoldBackgroundColor: AppColor.darkMode,
      colorScheme: const ColorScheme.dark());

  static final lightMode = ThemeData(
      scaffoldBackgroundColor: AppColor.whiteColor,
      colorScheme: const ColorScheme.light());
}

//ChangeNotifier class for ThemeData
class ThemeChanger extends ChangeNotifier {
  bool get isDarkTheme => themeMode == ThemeMode.dark;
  AppThemePref _pref = AppThemePref();

  ThemeMode themeMode = ThemeMode.dark;

  ThemeChanger() {
    isDarkTheme = false;
    _pref = AppThemePref();
    getPreferences();
  }

  void changeTheme(bool turnOn) {
    themeMode = turnOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  getPreferences() async {
    themeMode = await _pref.getTheme();
    notifyListeners();
  }

  set isDarkTheme(bool value) {
    isDarkTheme = value;
    _pref.setTheme(value);
    notifyListeners();
  }
}

//Theme Preference class to store user previous selected Theme
class AppThemePref {
  static const appThemeKEY = 'pref_key';

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(appThemeKEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(appThemeKEY);
  }
}
