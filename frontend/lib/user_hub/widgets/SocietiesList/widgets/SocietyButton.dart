import 'package:flutter/material.dart';

class SocietyButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  const SocietyButton({required this.buttonText, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(buttonText),  style: const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple), foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
    
    ));
  }
}
