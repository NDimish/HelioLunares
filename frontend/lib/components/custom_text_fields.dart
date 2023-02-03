import 'package:flutter/material.dart';

Widget customTextFieldWithIcon(
    TextEditingController inputController,
    BuildContext context,
    IconData inputIcon,
    TextInputType keyboardChoice,
    String showhintText) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.75,
    child: TextField(
      controller: inputController,
      keyboardType: keyboardChoice,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.blue),
        prefixIcon: Icon(inputIcon),
        hintText: showhintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),
  );
}

Widget customTextField(
    TextEditingController inputController, BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.75,
    child: TextField(
      controller: inputController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.blue),
        hintText: "Enter Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),
  );
}
