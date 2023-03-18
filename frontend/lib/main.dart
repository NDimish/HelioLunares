import 'package:flutter/material.dart';
import 'package:university_ticketing_system/home/homepage.dart';

void main() {
  runApp(const UniversityTicketingApp());
}

class UniversityTicketingApp extends StatelessWidget {
  const UniversityTicketingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
