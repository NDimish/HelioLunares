import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/log_in_screen.dart';
import 'package:university_ticketing_system/screens/sign_up_as_student_screen.dart';
import 'package:university_ticketing_system/screens/sign_up_as_society_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          leading: const Icon(Icons.airplane_ticket_rounded),
          title: const Text(
            "University ticketing system",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: Row(children: [
          Flexible(
              flex: 10,
              child: Container(
                width: width / 1.5,
                margin: const EdgeInsets.only(right: 1.5),
                color: const Color(0xFFc5afc6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Add styling for this, maybe an image. \nOr we can have autosliding images telling the users what our app does. \nAlso, we need an icon",
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ))
                  ],
                ),
              )),
          Flexible(
              flex: 8,
              child: Container(
                  width: width / 1.5,
                  color: const Color(0xFFf8edeb),
                  child: Column(children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: width / 21,
                                width: width / 3.5,
                                child: ElevatedButton(
                                    onPressed: redirectToLogIn,
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            const Color(0xFF333951),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25))),
                                    child: const Text("Log In",
                                        textScaleFactor: 1.3)),
                              ),
                              const SizedBox(height: 35),
                              SizedBox(
                                height: width / 21,
                                width: width / 3.5,
                                child: ElevatedButton(
                                    onPressed: redirectToStudentSignUp,
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            const Color(0xFF333951),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25))),
                                    child: const Text("Sign up as student",
                                        textScaleFactor: 1.3)),
                              ),
                              const SizedBox(height: 35),
                              SizedBox(
                                height: width / 21,
                                width: width / 3.5,
                                child: ElevatedButton(
                                    onPressed: redirectToSocietySignUp,
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            const Color(0xFF333951),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25))),
                                    child: const Text("Sign up as society",
                                        textScaleFactor: 1.3)),
                              ),
                            ]))
                  ])))
        ])));
  }

  // ignore: non_constant_identifier_names
  void redirectToLogIn() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogInScreen()),
      );
    });
  }

  // ignore: non_constant_identifier_names
  void redirectToSocietySignUp() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpAsSocietyScreen()),
      );
    });
  }

  void redirectToStudentSignUp() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpAsStudentScreen()),
      );
    });
  }
}
