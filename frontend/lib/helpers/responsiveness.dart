import 'package:flutter/material.dart';

//Screen size breakpoints
const int largeScreenSize = 1366;
const int mediumScreenSize = 760;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    required this.smallScreen,
  }) : super(key: key);

  //Identify window size
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < smallScreenSize;

  // static bool isMediumScreen(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= mediumScreenSize &&
  //     MediaQuery.of(context).size.width < largeScreenSize;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;

  // static bool isCustomScreen(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= mediumScreenSize;

  //Build  method
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= largeScreenSize) {
        return largeScreen;
      }
      //else if (_width <= largeScreenSize && _width >= mediumScreenSize) {
      //   return mediumScreen ?? largeScreen;
      // }
      else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}
