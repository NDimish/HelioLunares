import 'package:flutter/material.dart';
import 'package:university_ticketing_system/submit_button.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/models/user_account.dart';
import 'package:university_ticketing_system/authentication/sign_up/student/stage_two_student_form.dart';
import 'package:university_ticketing_system/tff_decoration.dart';
import 'package:university_ticketing_system/authentication/validators/email_validator.dart';
import 'package:university_ticketing_system/authentication/validators/password_validator.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/responsive.dart';

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the student sign up form and is used to take in the user's information.
///
class StudentSignUpForm extends StatefulWidget {
  const StudentSignUpForm({super.key});

  @override
  State<StudentSignUpForm> createState() => _StudentSignUpFormState();
}

class _StudentSignUpFormState extends State<StudentSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late bool passwordVisible;
  late bool confirmPasswordVisible;

  UserAccount userAccount = UserAccount();
  FocusNode inputNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = true;
  }

  @override
  void dispose() {
    super.dispose();
    inputNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordVisible = true;
    confirmPasswordVisible = true;
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
                                  'assets/images/cap.png',
                                  height:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 70
                                          : 90,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                const Text("Sign Up",
                                    textScaleFactor: 2.5,
                                    style: TextStyle(
                                        fontFamily: "Arvo",
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005),
                                const Text(
                                  "----- Create a student account! -----",
                                  style: TextStyle(
                                      fontFamily: "Arvo", color: Colors.black),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.075),
                                studentSignUpForm(context)
                              ])
                        ])))));
  }

  Form studentSignUpForm(BuildContext context) {
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
                    //print("submitted");
                  },
                  onChanged: (value) {
                    userAccount.setEmail(emailController.text);
                    //print(userAccount.email);
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
                  textInputAction: TextInputAction.next,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: passwordController,
                  validator: passwordValidator,
                  onFieldSubmitted: (value) {
                    //print("submitted");
                    FocusScope.of(context).nextFocus();
                  },
                  onChanged: (value) {
                    userAccount.setPassword(passwordController.text);
                    //print(userAccount.password);
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.60,
              child: TextFormField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.done,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    } else if (value != passwordController.text) {
                      return "Passwords do not match";
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (value) {
                    //print("submitted");
                  },
                  onChanged: (value) {
                    userAccount.setPassword(passwordController.text);
                    //print(userAccount.password);
                  },
                  onSaved: (newValue) {
                    userAccount.setPassword(newValue!);
                  },
                  obscureText: confirmPasswordVisible,
                  decoration: customDecorationForPassword(
                      "Re-enter Password",
                      "Please confirm your password",
                      _toggleConfirmPasswordView,
                      confirmPasswordVisible)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            SubmitButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setUserInformation();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StageTwoStudentSignUp(user: userAccount)),
                    );
                  } else {
                    print("Invalid form");
                  }
                },
                scaleFactor:
                    ResponsiveWidget.isSmallScreen(context) ? 0.6 : 0.45,
                textIn: "Sign Up"),
            const SizedBox(height: 8),
            TextButton(
                onPressed: () {
                  print("Text Button pressed");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                child: const Text("--- Have an account? Log in! ---",
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

  void _toggleConfirmPasswordView() {
    setState(() {
      confirmPasswordVisible = !confirmPasswordVisible;
    });
  }

  void setUserInformation() {
    userAccount.setEmail(emailController.text);
    userAccount.setPassword(passwordController.text);
    userAccount.setConfirmedPassword(confirmPasswordController.text);
  }
}
