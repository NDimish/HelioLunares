import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/startup_screen/startup_screen.dart';
import 'package:university_ticketing_system/landing_screen.dart';
import 'package:university_ticketing_system/screens/testscreen.dart';
import 'package:university_ticketing_system/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/sign_up/sign_up_as_society.dart';
import 'package:university_ticketing_system/theme.dart';
import 'package:university_ticketing_system/screens/buy_ticket_screen.dart';
import 'package:university_ticketing_system/screens/user_bought_ticket_screen.dart';

void main() {
  runApp(const UniversityTicketingSystem());
}

class UniversityTicketingSystem extends StatelessWidget {
  const UniversityTicketingSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Ticketing System',
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.pinkAccent)),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const StartupScreen(),
    );
  }
}
