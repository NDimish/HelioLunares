import 'package:flutter/material.dart';

InputDecoration customDecoration(
    String labelText, String hintText, IconData iconIn) {
  return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0),
      suffixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(end: 25.0),
        child: Icon(
          iconIn,
          color: Colors.black,
        ), // myIcon is a 48px-wide widget.
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.black),
      ),
      errorStyle: const TextStyle(fontFamily: "Arvo"),
      labelText: labelText,
      hintText: hintText,
      labelStyle: const TextStyle(fontFamily: "Arvo", fontSize: 18),
      hintStyle: const TextStyle(fontFamily: "Arvo", fontSize: 15),
      floatingLabelStyle: const TextStyle(
          color: Colors.black, fontFamily: "Arvo", fontSize: 18),
      floatingLabelBehavior: FloatingLabelBehavior.always);
}

InputDecoration customDecorationForPassword(String labelText, String hintText,
    Function()? togglePasswordView, bool passwordVisible) {
  return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0),
      suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 25.0),
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: togglePasswordView,
            child: passwordVisible
                ? const Icon(Icons.lock_rounded, color: Colors.black)
                : const Icon(Icons.lock_open_rounded, color: Colors.black),
          )),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.black),
      ),
      errorStyle: const TextStyle(fontFamily: "Arvo"),
      labelText: labelText,
      hintText: hintText,
      labelStyle: const TextStyle(fontFamily: "Arvo", fontSize: 18),
      hintStyle: const TextStyle(fontFamily: "Arvo", fontSize: 15),
      floatingLabelStyle: const TextStyle(
          color: Colors.black, fontFamily: "Arvo", fontSize: 18),
      floatingLabelBehavior: FloatingLabelBehavior.always);
}
