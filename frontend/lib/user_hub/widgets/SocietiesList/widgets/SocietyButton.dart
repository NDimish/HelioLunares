import 'package:flutter/material.dart';

class SocietyButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  const SocietyButton({ required this.buttonText, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed,  style:  const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffC8A2C8)), foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
    
    ), child: Text(buttonText));
  }
}
