import 'package:flutter/material.dart';
import 'package:university_ticketing_system/controllers/side_menu_controller.dart';
import 'package:university_ticketing_system/home/homepage.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/controllers/navigation_controller.dart';
import 'package:university_ticketing_system/controllers/menu_controller.dart'
    as menu;
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';
import 'package:university_ticketing_system/widgets/layout.dart';

void main() {
  //Register the menu controller
  Get.put(menu.MenuController());
  //Register the navigation controller
  Get.put(NavigationController());
  Get.put(SideMenuController());

  runApp(const UniversityTicketingApp());
}

class UniversityTicketingApp extends StatelessWidget {
  const UniversityTicketingApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        //brightness: Brightness.light,
        //colorScheme:
        //    ColorScheme.fromSwatch().copyWith(secondary: Colors.pinkAccent),
        //scaffoldBackgroundColor: MyColours.backgroundColour,
        //textTheme: GoogleFonts.spaceMonoTextTheme(Theme.of(context).textTheme)
        //    .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        }),
        //primaryColor: Colors.blue
      ),
      home: const HomePage(),
      //initialRoute: '/',
      routes: {
        //   '/': (context) => const StartupScreen(),
        //   '/auth': (context) => const LandingScreen(),
        '/userhub': (context) => UserHubPage_events(),
        '/societyhub': (context) => SiteLayout(),
      },
    );
  }
}
