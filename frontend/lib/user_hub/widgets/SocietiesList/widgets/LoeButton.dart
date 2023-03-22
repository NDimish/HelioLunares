import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  const ListButton({super.key, required this.buttonText, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    
    return TextButton(onPressed: onPressed,  style:  const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffC8A2C8)), foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
    
    ), child: Text(buttonText));
  }
}