import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  Function()? onPressed;
  double scaleFactor;
  String textIn;
  SubmitButton(
      {super.key,
      required this.onPressed,
      required this.scaleFactor,
      required this.textIn});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: 60,
        width: width * widget.scaleFactor,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          child: Text(widget.textIn,
              style: TextStyle(fontFamily: 'Arvo', color: Colors.white)),
        ));
  }
}
