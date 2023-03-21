import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/pages/select_society/select_society_layout.dart';
import 'package:university_ticketing_system/pages/select_society/society_list_maker.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/controllers/navigation_controller.dart';
import 'package:university_ticketing_system/screens/testscreen.dart';
import 'package:university_ticketing_system/theme.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';
import 'package:university_ticketing_system/widgets/layout.dart';
import 'package:university_ticketing_system/controllers/menu_controller.dart'
    as menu;
import 'package:university_ticketing_system/backend_communication/models/all.dart';

void main() {
  //Register the menu controller
  Get.put(menu.MenuController());
  //Register the navigation controller
  Get.put(NavigationController());

  runApp(const UniversityTicketingApp());
}

class UniversityTicketingApp extends StatelessWidget {
  const UniversityTicketingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University Ticketing',
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        // '/': (context) => const testscreen(),
        '/': (context) => SelectSocietyPage(),
        '/auth': (context) => const LandingScreen(),
        '/userhub': (context) => UserHubPage_events(),
        '/societyhub': (context) => SiteLayout(), // SocietyHub transition page
      },
    );
  }
}
