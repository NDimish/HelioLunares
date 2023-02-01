import 'package:flutter/material.dart';

import 'package:university_ticketing_system/screens/log_in_screen.dart';
import 'package:university_ticketing_system/screens/society_sign_up_screen.dart';
import 'package:university_ticketing_system/screens/student_sign_up_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("University Ticketing System"),
            centerTitle: false,
            leading: const Icon(Icons.airplane_ticket_outlined, size: 30)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const Text("This page must be styled"),
              /*Maybe use an icon like the airplane ticket*/
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: moveToLogInPage,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(180, 60), //////// HERE
                      ),
                      child: const Text("Log In")),
                  const SizedBox(width: 40),
                  ElevatedButton(
                      onPressed: moveToSignUpAsSocietyPage,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(180, 60), //////// HERE
                      ),
                      child: const Text("Sign Up As A Society")),
                  const SizedBox(width: 40),
                  ElevatedButton(
                      onPressed: moveToSignUpAsStudentPage,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(180, 60), //////// HERE
                      ),
                      child: const Text("Sign Up As Student"))
                ],
              ),
            ])));
  }

  void moveToLogInPage() {
    print("Redirect to log in page");
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogInScreen()),
      );
    });
  }

  void moveToSignUpAsSocietyPage() {
    print("Redirect to sign up page");
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpAsSocietyScreen()),
      );
    });
  }

  void moveToSignUpAsStudentPage() {
    print("Redirect to sign up page");
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpAsStudentScreen()),
      );
    });
  }
}
