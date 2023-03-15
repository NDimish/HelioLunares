import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_button.dart';
import 'package:university_ticketing_system/authentication/models/user_account.dart';
import 'package:university_ticketing_system/authentication/sign_up/choose_sign_up_screen.dart';
import 'package:university_ticketing_system/authentication/tff_decoration.dart';
import 'package:university_ticketing_system/authentication/validators/email_validator.dart';
import 'package:university_ticketing_system/authentication/validators/password_validator.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/responsive.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  UserAccount userAccount = UserAccount();
  late bool passwordVisible;
  FocusNode inputNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
  }

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: CustomLinearGradient(
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 20 : 30,
                        left: 15.0,
                        right: 15.0),
                    child: ListView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/university.png',
                                  height:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 70
                                          : 90,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                const Text("Welcome Back!",
                                    textScaleFactor: 2.5,
                                    style: TextStyle(
                                        fontFamily: "Arvo",
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005),
                                const Text(
                                  "----- Log into your account -----",
                                  style: TextStyle(
                                      fontFamily: "Arvo", color: Colors.black),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.135),
                                logInForm(context)
                              ])
                        ])))));
  }

  Form logInForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.60,
              child: TextFormField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: emailController,
                  validator: emailValidator,
                  onFieldSubmitted: (value) {
                    print("submitted");
                  },
                  onChanged: (value) {
                    userAccount.setEmail(emailController.text);
                    print(userAccount.email);
                  },
                  onSaved: (newValue) {
                    userAccount.setEmail(newValue!);
                  },
                  decoration: customDecoration(
                      "Email", "Enter your email", Icons.email_rounded)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.60,
              child: TextFormField(
                  cursorColor: Colors.black,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: passwordController,
                  validator: passwordValidator,
                  onFieldSubmitted: (value) {
                    print("submitted");
                  },
                  onChanged: (value) {
                    userAccount.setPassword(passwordController.text);
                    print(userAccount.password);
                  },
                  onSaved: (newValue) {
                    userAccount.setPassword(newValue!);
                  },
                  obscureText: passwordVisible,
                  decoration: customDecorationForPassword(
                      "Password",
                      "Enter your password",
                      _togglePasswordView,
                      passwordVisible)),
            ),
            SizedBox(
                // height: ResponsiveWidget.isSmallScreen(context)
                //     ? MediaQuery.of(context).size.height * 0.12
                //     : MediaQuery.of(context).size.height * 0.15
                height: MediaQuery.of(context).size.height * 0.15),
            SubmitButton(
                onPressed: () {
                  _formKey.currentState!.validate()
                      ? print("Valid form")
                      : print("Invalid form");
                },
                scaleFactor:
                    ResponsiveWidget.isSmallScreen(context) ? 0.6 : 0.45,
                textIn: "Log In"),
            const SizedBox(height: 8),
            TextButton(
                onPressed: () {
                  print("Text Button pressed");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseSignUp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                child: const Text("--- Don't have an account? Sign up! ---",
                    style: TextStyle(
                        fontFamily: "Arvo", fontSize: 12, color: Colors.black)))
          ],
        ));
  }

  void _togglePasswordView() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
}
