import 'package:flutter/material.dart';
import 'package:university_ticketing_system/log_in/widgets/log_in_form.dart';

class LogInCard extends StatelessWidget {
  const LogInCard({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Image.asset(
          'images/university.png',
          height: 65.0,
          fit: BoxFit.cover,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Text("Welcome Back!",
            textScaleFactor: 2.5,
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        const Text("----- Log into your account -----"),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        const LogInForm(),
      ]),
    )));
  }
}
