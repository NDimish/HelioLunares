import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';

class SubmitButton extends StatefulWidget {
  Function()? onPressed;
  String buttonText;
  SubmitButton({super.key, required this.onPressed, required this.buttonText});

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
          onPressed: () {
            authenticate("nath@gmail.com","q");
            Navigator.pushNamed(context, '/userhub');
          },
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
