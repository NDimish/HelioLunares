import 'package:flutter/material.dart';
import 'package:university_ticketing_system/landing_screen.dart';
import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/log_in/log_in.dart';
import 'package:university_ticketing_system/pages/society_hub/society_hub.dart';
import 'package:university_ticketing_system/sign_up/sign_up_as_student.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/controllers/navigation_controller.dart';
import 'package:university_ticketing_system/widgets/layout.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/controllers/menu_controller.dart'
    as menu;

void main() {
  //Register the menu controller
  Get.put(menu.MenuController());
  //Register the navigation controller
  Get.put(NavigationController());
  runApp(UniversityTicketingApp());
}

class UniversityTicketingApp extends StatelessWidget {
  const UniversityTicketingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LogInScreen(),
      title: 'University Ticketing',
      theme: ThemeData(
          scaffoldBackgroundColor: MyColours.veryLightGrey,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.blue),
      home: SiteLayout(),
    );
  }
}
