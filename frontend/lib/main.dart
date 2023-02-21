import 'package:flutter/material.dart';
import 'package:university_ticketing_system/landing_screen.dart';
import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/log_in/log_in.dart';
import 'package:university_ticketing_system/sign_up/sign_up_as_student.dart';

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
      home: LogInScreen(),
    );
  }
}
