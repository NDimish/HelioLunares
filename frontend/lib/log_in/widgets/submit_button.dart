import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  Function()? onPressed;
  SubmitButton({super.key, required this.onPressed});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height * 0.065,
        width: width / 4,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          child: const Text("Log In",
              style: TextStyle(fontFamily: 'Arvo', color: Colors.white)),
        ));
  }
}
