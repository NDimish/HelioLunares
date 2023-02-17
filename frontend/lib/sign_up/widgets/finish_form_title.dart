import 'package:flutter/material.dart';

class FinishSignUpTitle extends StatelessWidget {
  const FinishSignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/university.png',
              height: 80.0,
              fit: BoxFit.cover,
            ),
            //const SizedBox(height: 15),
            const Text(
              "Finish your sign up!",
              style: TextStyle(fontSize: 50, fontFamily: "Arvo"),
            ),
            //const Spacer(),
          ]),
    );
  }
}
