import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/submit_button.dart';
import 'package:university_ticketing_system/authentication/models/user_account.dart';
import 'package:university_ticketing_system/authentication/sign_up/choose_sign_up_screen.dart';
import 'package:university_ticketing_system/tff_decoration.dart';
import 'package:university_ticketing_system/authentication/validators/email_validator.dart';
import 'package:university_ticketing_system/authentication/validators/password_validator.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/globals.dart' as globals;
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';
import 'package:university_ticketing_system/widgets/layout.dart';

import '../../helpers/deleteAllObjects.dart';

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This widget is used for logging the user in.
///   1: It contains the email field for the user to enter their email
///   2: It contains a password field for the user's password.
///   3: The password icon lock is a button, enabling the user to view/hide their password.
///
class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  UserAccount userAccount = UserAccount();
  late bool passwordVisible;

  //This allows mobile users to move to the next field automatically when using the keyboard.
  FocusNode inputNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
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

              //This text form takes in the email and validates it.
              child: TextFormField(
                  key: const Key("Email"),
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: emailController,
                  validator: emailValidator,
                  onChanged: (value) {
                    userAccount.setEmail(emailController.text);
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

              //This text form takes in the password and validates it.
              child: TextFormField(
                  key: const Key("Password"),
                  cursorColor: Colors.black,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: passwordController,
                  validator: passwordValidator,
                  onChanged: (value) {
                    userAccount.setPassword(passwordController.text);
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            SubmitButton(
                onPressed: () async {
                  //We check if the form is valid and we progress to the next page
                  //(which is the student screen or society screen) depending on the user account.
                  if (_formKey.currentState!.validate()) {
                    http.Response response = await auth(
                        emailController.text, passwordController.text);
                    print(response.body);
                    if (response.statusCode == 200) {
                      if (globals.Localdata.USERLEVEL == 1 ||
                          globals.Localdata.USERLEVEL == 2) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserHubPage_events()),
                        );
                      } else {

                        print("Redirecting to society page.");
                        DeleteAllObjects d = DeleteAllObjects();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SiteLayout()),
                        ).then((value) => d.delete());
                      }
                    } else {}
                  }
                },
                scaleFactor:
                    ResponsiveWidget.isSmallScreen(context) ? 0.6 : 0.45,
                textIn: "Log In"),
            const SizedBox(height: 8),
            TextButton(
                onPressed: () {
                  //If the user does not have an account, they can choose to sign up with this button.
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
