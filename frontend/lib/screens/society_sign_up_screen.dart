import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_fields.dart';

class SignUpAsStudentScreen extends StatefulWidget {
  const SignUpAsStudentScreen({super.key});

  @override
  State<SignUpAsStudentScreen> createState() => _SignUpAsStudentScreenState();
}

class _SignUpAsStudentScreenState extends State<SignUpAsStudentScreen> {
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  TextEditingController _uniStudyingAt = TextEditingController();
  TextEditingController _fieldOfStudy = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up as a student")),
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
                    "Enter Email")),
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
            const SizedBox(height: 30),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: customTextFieldWithIcon(
                    _firstName,
                    context,
                    Icons.person_outline,
                    TextInputType.name,
                    "Enter First Name")),
            const SizedBox(height: 10),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: customTextFieldWithIcon(
                    _lastName,
                    context,
                    Icons.person_outline,
                    TextInputType.name,
                    "Enter Last Name")),
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
                    _fieldOfStudy,
                    context,
                    Icons.school_outlined,
                    TextInputType.name,
                    "Field of Study")),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: signUserUpAndRedirect,
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.blueAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  minimumSize: const Size(180, 60), //////// HERE
                ),
                child: const Text("Sign Up In")),
          ],
        ),
      ),
    );
  }

  void signUserUpAndRedirect() {
    print("User successfully signed up");
    print("Redirecting...");
  }
}
