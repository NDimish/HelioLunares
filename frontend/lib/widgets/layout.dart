import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/widgets/large_screen.dart';
import 'package:university_ticketing_system/widgets/small_screen.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(elevation: 0, backgroundColor: Colors.white, actions: []),
        body: ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
        ));
  }
}
