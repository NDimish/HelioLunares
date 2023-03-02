import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/sign_up/widgets/society_sign_up_card.dart';

class SocietySignUpScreen extends StatefulWidget {
  const SocietySignUpScreen({super.key});

  @override
  State<SocietySignUpScreen> createState() => _SocietySignUpScreenState();
}

class _SocietySignUpScreenState extends State<SocietySignUpScreen> {
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
                SocietySignUpCard(
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
