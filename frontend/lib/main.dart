import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_ticketing_system/widgets/layout.dart';

void main() {
  runApp(UniversityTicketingApp());
}

class UniversityTicketingApp extends StatelessWidget {
  const UniversityTicketingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University Ticketing',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.blue),
      home: SiteLayout(),
    );
  }
}
