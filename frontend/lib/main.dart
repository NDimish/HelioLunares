import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
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
      ),
      debugShowCheckedModeBanner: false,
      home: UserBoughtTicketScreen(),
    );
  }
}
