import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
import 'package:university_ticketing_system/screens/testscreen.dart';
import 'package:http/http.dart' as http;
import 'backend_communication/get.dart' as data;

void main() {
  runApp(const UniversityTicketingSystem());
}

class UniversityTicketingSystem extends StatelessWidget {
  const UniversityTicketingSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => data.dataCollector(),
      child: MaterialApp(
        title: 'University Ticketing System',
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: testscreen(),
      ),
    );
  }
}
