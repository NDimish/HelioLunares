import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/backend_communication/models/Society.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/controllers/navigation_controller.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/widgets/large_screen.dart';
import 'package:university_ticketing_system/widgets/side_menu.dart';
import 'package:university_ticketing_system/controllers/menu_controller.dart'
    as menu;
import 'package:university_ticketing_system/controllers/navigation_controller.dart';
import 'package:university_ticketing_system/controllers/side_menu_controller.dart';
import 'package:university_ticketing_system/widgets/top_nav_bar.dart';

import '../helpers/local_navigator.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Society? society;

  void putControllers() {}

  SiteLayout({super.key, this.society});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: topNavBar(context, scaffoldKey, true),
        drawer: Drawer(
          child: CustomLinearGradient(child: SideMenu()),
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
