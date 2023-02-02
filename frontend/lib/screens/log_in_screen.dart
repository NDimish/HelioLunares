import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_form_field.dart';
import 'package:university_ticketing_system/screens/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();

  String? email, password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Log in",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Row(
            children: [
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
                                //alignment: Alignment.center,
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: width / 3.2,
                                      child: const Text(
                                        "Welcome back!",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    SizedBox(
                                      width: width / 3.2,
                                      child: customTextFormField(
                                          context,
                                          _textControllerEmail,
                                          "Enter an email address",
                                          "Email",
                                          TextInputType.emailAddress,
                                          Icons.email_rounded,
                                          false,
                                          false,
                                          emailValidator),
                                    ),
                                    const SizedBox(height: 25),
                                    SizedBox(
                                      width: width / 3.2,
                                      child: customTextFormField(
                                          context,
                                          _textControllerPassword,
                                          "Enter a password",
                                          "Password",
                                          TextInputType.visiblePassword,
                                          Icons.lock_rounded,
                                          true,
                                          false,
                                          passwordValidator),
                                    ),
                                    const SizedBox(height: 60),
                                    SizedBox(
                                      height: width / 23,
                                      width: width / 5,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              print("Logged in");
                                              setState(() {
                                                email =
                                                    _textControllerEmail.text;
                                                password =
                                                    _textControllerPassword
                                                        .text;
                                              });
                                              showText();
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  const Color(0xFF333951),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25))),
                                          child: const Text("Log In")),
                                    )
                                  ],
                                )))
                      ]))),
            ],
          ),
        ));
  }

  void showText() {
    print(email);
    print(password);
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
}
