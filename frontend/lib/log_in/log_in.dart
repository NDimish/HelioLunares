import 'package:university_ticketing_system/log_in/widgets/functionality_page_view.dart';
import 'package:university_ticketing_system/log_in/widgets/log_in_background.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  static String routeName = "/log_in";

  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Log In",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Arvo",
                  fontWeight: FontWeight.bold)),
          leading: const Icon(Icons.airplane_ticket_rounded)),
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[FunctionalityPageView(), BackGroundOfLogin()],
          )
        ],
      ),
    );
  }
}
