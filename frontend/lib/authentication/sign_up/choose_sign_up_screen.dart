import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/sign_up/society/society_sign_up.dart';
import 'package:university_ticketing_system/authentication/sign_up/student/student_sign_up.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';

class ChooseSignUp extends StatefulWidget {
  const ChooseSignUp({super.key});

  @override
  State<ChooseSignUp> createState() => _ChooseSignUpState();
}

class _ChooseSignUpState extends State<ChooseSignUp> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'University Ticketing System',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Arvo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: const TopBarContents(),
              ),
        drawer: const HomeScreenDrawer(),
        body: ResponsiveWidget.isSmallScreen(context)
            ? smallScreenSignUpChoice(context)
            : largerScreenSignUpChoice(context));
  }

  CustomLinearGradient largerScreenSignUpChoice(BuildContext context) {
    return CustomLinearGradient(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15),
          const Text("Choose your account type",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                decoration: TextDecoration.underline,
                fontFamily: 'Arvo',
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 20, right: 20, left: 10),
              child: Column(
                children: [
                  Expanded(
                      // If you don't have the height you can expanded with flex
                      flex: 1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  'assets/images/cap.png',
                                  height: 200,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Sign Up As A Student",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 27,
                                        fontFamily: 'Arvo',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(height: 15),
                                  SizedBox(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StudentSignUp()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            )),
                                        child: const Text("Join as a student",
                                            style: TextStyle(
                                                fontFamily: 'Arvo',
                                                color: Colors.white)),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  'assets/images/people.png',
                                  height: 200,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Sign Up As A Society",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 27,
                                        fontFamily: 'Arvo',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(height: 15),
                                  SizedBox(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SocietySignUp()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            )),
                                        child: const Text("Join as a society",
                                            style: TextStyle(
                                                fontFamily: 'Arvo',
                                                color: Colors.white)),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    )));
  }

  smallScreenSignUpChoice(BuildContext context) {
    return CustomLinearGradient(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15),
          const Text("Choose your account type",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                decoration: TextDecoration.underline,
                fontFamily: 'Arvo',
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20, bottom: 10, right: 8, left: 8),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/cap.png',
                                  height: 90,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8.0, bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Sign Up As A Student",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontFamily: 'Arvo',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(height: 15),
                                  SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StudentSignUp()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            )),
                                        child: const Text("Join as a student",
                                            style: TextStyle(
                                                fontFamily: 'Arvo',
                                                color: Colors.white)),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/people.png',
                                  height: 90,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8.0, bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Sign Up As A Society",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontFamily: 'Arvo',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(height: 15),
                                  SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SocietySignUp()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            )),
                                        child: const Text("Join as a society",
                                            style: TextStyle(
                                                fontFamily: 'Arvo',
                                                color: Colors.white)),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    )));
  }
}
