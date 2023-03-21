import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/widgets/large_screen.dart';
import 'package:university_ticketing_system/widgets/side_menu.dart';
import 'package:university_ticketing_system/widgets/top_nav_bar.dart';

import '../helpers/local_navigator.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SiteLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: topNavBar(context, scaffoldKey, true),
        drawer: Drawer(
          child: CustomLinearGradient(child: const SideMenu()),
        ),
        body: CustomLinearGradient(
          child: ResponsiveWidget(
              largeScreen: const LargeScreen(),
              smallScreen: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: localNavigator(),
              )),
        ));
  }
}
