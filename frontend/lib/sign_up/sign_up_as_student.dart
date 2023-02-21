import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/sign_up/widgets/sign_up_card.dart';
import 'package:flutter/material.dart';

class StudentSignUpScreen extends StatefulWidget {
  static String routeName = "/student_sign_up";
  const StudentSignUpScreen({
    super.key,
  });

  @override
  State<StudentSignUpScreen> createState() => _StudentSignUpScreenState();
}

class _StudentSignUpScreenState extends State<StudentSignUpScreen> {
  final PageController pageController = PageController();
  final formKey = GlobalKey<FormState>();
  final finishFormKey = GlobalKey<FormState>();

  /*
  int data = 0, maxValue = 7;
  callback(newData) {
    setState(() {
      data += newData as int;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sign up",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Arvo",
                  fontWeight: FontWeight.bold)),
          leading: const Icon(Icons.airplane_ticket_rounded)),
      body: Stack(
        children: <Widget>[
          CustomLinearGradient(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * (2 / 3),
                    child: const LinearProgressIndicator(
                      value: 0.2,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    )),
                const SizedBox(height: 20),
                SignUpCard(
                  pageController: pageController,
                  fKey: formKey,
                  finishFormKey: finishFormKey,
                  //callback: callback,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
