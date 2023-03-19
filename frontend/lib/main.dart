import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/screens/startup_screen/startup_screen.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/controllers/navigation_controller.dart';
import 'package:university_ticketing_system/screens/testscreen.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_societies.dart';
import 'package:university_ticketing_system/widgets/layout.dart';
import 'package:university_ticketing_system/controllers/menu_controller.dart'
    as menu;

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
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.pinkAccent),
          scaffoldBackgroundColor: MyColours.backgroundColour,
          textTheme: GoogleFonts.spaceMonoTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.blue),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {

        '/': (context) => const StartupScreen(),
        '/auth': (context) => const LandingScreen(),
        '/userhub': (context) => UserHubPage_events(),
        '/societyhub': (context) => SiteLayout(), // SocietyHub transition page
      },
    );
  }
}


