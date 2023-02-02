import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/create_user_account.dart';
import 'package:university_ticketing_system/components/custom_text_fields.dart';

class SignUpAsStudentScreen extends StatefulWidget {
  const SignUpAsStudentScreen({super.key});

  @override
  State<SignUpAsStudentScreen> createState() => _SignUpAsStudentScreenState();
}

class _SignUpAsStudentScreenState extends State<SignUpAsStudentScreen> {
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();
  TextEditingController _textControllerConfirmPassword =
      TextEditingController();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  TextEditingController _uniStudyingAt = TextEditingController();
  TextEditingController _fieldOfStudy = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  double counter = 0.0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Sign up as a student",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: Row(children: [
          Flexible(
              flex: 10,
              child: Container(
                width: width / 1.5,
                margin: const EdgeInsets.only(right: 1.5),
                color: const Color(0xFFc5afc6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Add styling for this, maybe an image",
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ))
                  ],
                ),
              )),
          Flexible(
              flex: 8,
              child: Container(
                  width: width / 1.5,
                  color: const Color(0xFFf8edeb),
                  child: Column(children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: width / 3.2,
                                child: LinearProgressIndicator(
                                  value: counter,
                                  color: Color(0xFF006d77),
                                  backgroundColor: Color(0xFF83c5be),
                                ),
                              ),
                              const SizedBox(height: 20),
                              buildUserAccountForm(
                                  context,
                                  _textControllerEmail,
                                  _textControllerPassword,
                                  _textControllerConfirmPassword,
                                  _formKey)
                            ],
                          ),
                        ))
                  ])))
        ])));
  }

  void signUserUpAndRedirect() {
    print("User successfully signed up");
    print("Redirecting...");
  }
}

/*
Column(
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
*/