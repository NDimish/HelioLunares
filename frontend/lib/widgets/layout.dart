import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/widgets/large_screen.dart';
import 'package:university_ticketing_system/widgets/small_screen.dart';
import 'package:university_ticketing_system/widgets/top_nav_bar.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topNavBar(context, scaffoldKey),
        drawer: Drawer(),
        body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
        ));
  }
}
