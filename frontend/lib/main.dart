import 'package:flutter/material.dart';

void main() {
  runApp(const UniversityTicketingSystem());
}

class UniversityTicketingSystem extends StatelessWidget {
  const UniversityTicketingSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Ticketing System',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("University Ticketing System"),
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
                        minimumSize: const Size(200, 60), //////// HERE
                      ),
                      child: const Text("Log In")),
                  const SizedBox(width: 40),
                  ElevatedButton(
                      onPressed: moveToSignUpPage,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(200, 60), //////// HERE
                      ),
                      child: const Text("Sign Up"))
                ],
              ),
            ])));
  }

  void moveToLogInPage() {
    print("Redirect to log in page");
  }

  void moveToSignUpPage() {
    print("Redirect to sign up page");
  }
}
