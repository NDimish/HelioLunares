import 'package:university_ticketing_system/log_in/widgets/submit_button.dart';
import 'package:flutter/material.dart';

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
    return Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      controller: emailController,
                      onFieldSubmitted: (value) {
                        print("submitted");
                      },
                      onChanged: (value) {},
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      decoration: customDecoration(
                          "Email", "Enter your email", Icons.email_rounded)),
                  const SizedBox(height: 35),
                  TextFormField(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your password";
                        }
                        return null;
                      },
                      decoration: customDecoration("Password",
                          "Enter your password", Icons.lock_rounded)),
                  const SizedBox(height: 55),
                  SubmitButton(onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Valid form");
                      _formKey.currentState!.save();
                    } else {
                      print("Invalid form");
                    }
                  })
                ],
              ),
            )));
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
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }
}
