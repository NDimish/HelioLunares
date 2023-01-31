import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                      onPressed: moveToSignUpPage,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(180, 60), //////// HERE
                      ),
                      child: const Text("Sign Up"))
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

  void moveToSignUpPage() {
    print("Redirect to sign up page");
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up as a student")),
      body:
          const Center(child: Text("This is the sign up screen for students")),
    );
  }
}

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log in")),
      body: const Center(child: Text("This is the log in screen")),
    );
  }
}
