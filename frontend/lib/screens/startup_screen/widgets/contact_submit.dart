import 'package:flutter/material.dart';

class ContactSubmit extends StatefulWidget {
  Function()? onPressed;
  String buttonText;
  ContactSubmit({super.key, required this.onPressed, required this.buttonText});

  @override
  State<ContactSubmit> createState() => _ContactSubmitState();
}

class _ContactSubmitState extends State<ContactSubmit> {
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
          child: Text(widget.buttonText,
              style: const TextStyle(fontFamily: 'Arvo', color: Colors.white)),
        ));
  }
}
