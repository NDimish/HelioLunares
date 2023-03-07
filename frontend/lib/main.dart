import 'dart:js';

import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
import 'package:university_ticketing_system/screens/startup_screen/startup_screen.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'University Ticketing System',
    theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.pinkAccent)),
    themeMode: ThemeMode.light,
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const StartupScreen(),
      '/auth': (context) => const LandingScreen(),
      '/userhub': (context) => UserHubPage(),
    },
  ));
}
