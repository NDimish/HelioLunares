import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/widgets/large_screen.dart';
import 'package:university_ticketing_system/widgets/side_menu.dart';
import 'package:university_ticketing_system/widgets/small_screen.dart';
import 'package:university_ticketing_system/widgets/top_nav_bar.dart';

import '../helpers/local_navigator.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          )),
    );
  }
}
