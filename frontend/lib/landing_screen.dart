import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/sign_up/sign_up_as_student.dart';
import 'package:university_ticketing_system/sign_up/sign_up_as_society.dart';

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
        body: CustomLinearGradient(
            child: SafeArea(
                child: Row(children: [
          Flexible(
              flex: 10,
              child: Container(
                width: width / 1.5,
                margin: const EdgeInsets.only(right: 1.5),
                color: Color.fromARGB(255, 66, 46, 96),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Card(
                              child: Center(
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
                  //color: const Color(0xFFf8edeb),
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
                                      child: const Text("Log In",
                                          style: TextStyle(fontFamily: "Arvo"),
                                          textScaleFactor: 1.1))),
                              const SizedBox(height: 35),
                              SizedBox(
                                height: width / 21,
                                width: width / 3.5,
                                child: ElevatedButton(
                                    onPressed: redirectToStudentSignUp,
                                    child: const Text("Sign up as student",
                                        style: TextStyle(fontFamily: "Arvo"),
                                        textScaleFactor: 1.1)),
                              ),
                              const SizedBox(height: 35),
                              SizedBox(
                                height: width / 21,
                                width: width / 3.5,
                                child: ElevatedButton(
                                    onPressed: redirectToSocietySignUp,
                                    child: const Text("Sign up as society",
                                        style: TextStyle(fontFamily: "Arvo"),
                                        textScaleFactor: 1.1)),
                              ),
                            ]))
                  ])))
        ]))));
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
        MaterialPageRoute(builder: (context) => const SocietySignUpScreen()),
      );
    });
  }

  void redirectToStudentSignUp() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StudentSignUpScreen()),
      );
    });
  }
}
