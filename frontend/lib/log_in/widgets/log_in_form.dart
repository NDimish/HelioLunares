import 'package:flutter/material.dart';
import 'package:university_ticketing_system/log_in/validators/email_validator.dart';
import 'package:university_ticketing_system/log_in/validators/password_validator.dart';
import 'package:university_ticketing_system/log_in/widgets/submit_button.dart';

import '../../user_hub/widgets/UserHubPage.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "", password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              //height: MediaQuery.of(context).size.height * 0.065,
              width: width <= 400 ? width * 0.8 : 400,
              child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(fontFamily: "Arvo"),
                  onFieldSubmitted: (value) {
                    print("submitted");
                  },
                  onChanged: (value) {},
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                  validator: emailValidator,
                  decoration: customDecoration(
                      "Email", "Enter your email", Icons.email_rounded))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          SizedBox(
            width: width <= 400 ? width * 0.8 : 400,
            child: TextFormField(
                style: const TextStyle(fontFamily: "Arvo"),
                controller: passwordController,
                onFieldSubmitted: (value) {
                  print("submitted");
                },
                onChanged: (value) {
                  password = passwordController.text;
                  print(password);
                },
                onSaved: (newValue) {
                  password = newValue!;
                },
                validator: passwordValidator,
                decoration: customDecoration(
                    "Password", "Enter your password", Icons.lock_rounded)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          SubmitButton(
              buttonText: "Log In",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Valid form");
                  _formKey.currentState!.save();
                  try {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserHubPage()));
                  } catch (error) {
                    print(error.toString());
                  }
                } else {
                  print("Invalid form");
                }
              })
        ],
      ),
    );
  }

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
        labelStyle: const TextStyle(fontFamily: "Arvo", fontSize: 13),
        hintStyle: const TextStyle(fontFamily: "Arvo", fontSize: 13),
        floatingLabelStyle:
            const TextStyle(color: Colors.black, fontFamily: "Arvo"),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }
}
