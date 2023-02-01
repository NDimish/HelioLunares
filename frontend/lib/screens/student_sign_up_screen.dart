import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_fields.dart';

class SignUpAsSocietyScreen extends StatefulWidget {
  const SignUpAsSocietyScreen({super.key});

  @override
  State<SignUpAsSocietyScreen> createState() => _SignUpAsSocietyScreenState();
}

class _SignUpAsSocietyScreenState extends State<SignUpAsSocietyScreen> {
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();

  TextEditingController _societyName = TextEditingController();
  TextEditingController _creationDate = TextEditingController();

  TextEditingController _uniStudyingAt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up as a society")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: customTextFieldWithIcon(
                _textControllerEmail,
                context,
                Icons.email_outlined,
                TextInputType.emailAddress,
                "Enter Email"),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: customTextFieldWithIcon(
                _textControllerPassword,
                context,
                Icons.lock_outlined,
                TextInputType.visiblePassword,
                "Enter Password"),
          ),
          const SizedBox(height: 10),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: customTextFieldWithIcon(
                  _societyName,
                  context,
                  Icons.school_outlined,
                  TextInputType.name,
                  "Name of Society")),
          const SizedBox(height: 10),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: customTextFieldWithIcon(
                  _uniStudyingAt,
                  context,
                  Icons.school_outlined,
                  TextInputType.name,
                  "University Studying At")),
          const SizedBox(height: 10),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: customTextFieldWithIcon(
                  _creationDate,
                  context,
                  Icons.date_range_outlined,
                  TextInputType.datetime,
                  "Society Creation Date")),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: signUpSocietyAndRedirect,
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.blueAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                minimumSize: const Size(180, 60), //////// HERE
              ),
              child: const Text("Sign Up")),
        ],
      )),
    );
  }

  void signUpSocietyAndRedirect() {
    print("Society successfully signed up");
    print("Redirecting...");
  }
}
