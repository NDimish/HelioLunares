import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/startup_screen/startup_screen.dart';

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
