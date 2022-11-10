import 'package:flutter/material.dart';

enum DeviceScreen { mobileLayout, tabletLayout }

class ScreenSizeInfo {
  final Orientation? orientation;
  final DeviceScreen? deviceScreen;
  final Size? screenSize;
  final Size? localWidgetSize;

  ScreenSizeInfo(
      {this.orientation,
      this.deviceScreen,
      this.screenSize,
      this.localWidgetSize});
}

//Creating app responsive architecture with DeviceType breakpoints
class Responsive extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenSizeInfo screenSizeInfo)
      builder;
  const Responsive({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, constraints) {
      var screenSizeInfo = ScreenSizeInfo(
          deviceScreen: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          orientation: mediaQuery.orientation,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight));
      return builder(context, screenSizeInfo);
    });
  }
}

//Setting DeviceTypes using breakpoints
DeviceScreen getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;
  double deviceWidth = mediaQuery.size.shortestSide;
  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > 600) {
    return DeviceScreen.tabletLayout;
  }
  return DeviceScreen.mobileLayout;
}

//Setting ScreenLayout based on breakpoints provided by responsive builder
class ScreenLayout extends StatelessWidget {
  final Widget? mobile;
  const ScreenLayout({Key? key, this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: ((context, screenSizeInfo) {
        if (screenSizeInfo.deviceScreen == DeviceScreen.mobileLayout) {
          return mobile!;
        }
        return mobile!;
      }),
    );
  }
}
