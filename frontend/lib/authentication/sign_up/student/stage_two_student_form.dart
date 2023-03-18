import 'package:flutter/material.dart';
import 'package:university_ticketing_system/submit_button.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/models/student.dart';
import 'package:university_ticketing_system/authentication/models/user_account.dart';
import 'package:university_ticketing_system/tff_decoration.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the last stage of the student sign up form.
/// The student redirects to the student hub after signing up.
class StageTwoStudentSignUp extends StatefulWidget {
  UserAccount user;
  StageTwoStudentSignUp({super.key, required this.user});

  @override
  State<StageTwoStudentSignUp> createState() => _StageTwoStudentSignUpState();
}

class _StageTwoStudentSignUpState extends State<StageTwoStudentSignUp> {
  final _formKey = GlobalKey<FormState>();

  Student student = Student();
  FocusNode inputNode = FocusNode();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController uniAtController = TextEditingController();
  TextEditingController fieldOfStudyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              title: const Text("Complete Sign Up",
                  style: TextStyle(
                    fontFamily: "Arvo",
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )))
          : AppBar(
              title: const Text("Complete Sign Up",
                  style: TextStyle(
                    fontFamily: "Arvo",
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ))),

      // appBar: ResponsiveWidget.isSmallScreen(context)
      //     ? AppBar(
      //         backgroundColor: Colors.white,
      //         title: const Text(
      //           'University Ticketing System',
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 17,
      //             fontFamily: 'Arvo',
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       )
      //     : PreferredSize(
      //         preferredSize: Size(screenSize.width, 1000),
      //         child: const TopBarContents(),
      //       ),
      // drawer: const HomeScreenDrawer(),
      body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: CustomLinearGradient(
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(
                          top:
                              ResponsiveWidget.isSmallScreen(context) ? 20 : 30,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  const Text("Finish Sign Up",
                                      textScaleFactor: 2.5,
                                      style: TextStyle(
                                          fontFamily: "Arvo",
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.005),
                                  const Text(
                                    "----- Finish creating your account! -----",
                                    style: TextStyle(
                                        fontFamily: "Arvo",
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.075),
                                  stageTwoStudentSignUpForm(context)
                                ])
                          ]))))),
    );
  }

  Form stageTwoStudentSignUpForm(BuildContext context) {
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
                  keyboardType: TextInputType.name,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: firstNameController,
                  //validator: ,
                  onFieldSubmitted: (value) {
                    //print("fn submitted");
                  },
                  onChanged: (value) {
                    student.setFirstName(firstNameController.text);
                    //print(student.firstName);
                  },
                  onSaved: (newValue) {
                    student.setFirstName(newValue!);
                  },
                  decoration: customDecoration("First Name",
                      "Enter your first name", Icons.person_rounded)),
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
                  controller: lastNameController,
                  //validator: passwordValidator,
                  onFieldSubmitted: (value) {
                    //print("ln submitted");
                  },
                  onChanged: (value) {
                    student.setLastName(lastNameController.text);
                    //print(student.lastName);
                  },
                  onSaved: (newValue) {
                    student.setLastName(newValue!);
                  },
                  //obscureText: passwordVisible,
                  decoration: customDecoration("Last Name",
                      "Enter your last name", Icons.person_rounded)),
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
                  controller: fieldOfStudyController,
                  //validator: ,
                  onFieldSubmitted: (value) {
                    //print("fos submitted");
                  },
                  onChanged: (value) {
                    student.setFieldOfStudy(fieldOfStudyController.text);
                    //print(student.fieldOfStudy);
                  },
                  onSaved: (newValue) {
                    student.setFieldOfStudy(newValue!);
                  },
                  //obscureText: confirmPasswordVisible,
                  decoration: customDecoration("Enter your field of study",
                      "Enter your degree name", Icons.school_outlined)),
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
                  controller: uniAtController,
                  //validator: ,
                  onFieldSubmitted: (value) {
                    //print("uniAt submitted");
                  },
                  onChanged: (value) {
                    student.setUniversity(uniAtController.text);
                    //print(student.university);
                  },
                  onSaved: (newValue) {
                    student.setUniversity(newValue!);
                  },
                  //obscureText: confirmPasswordVisible,
                  decoration: customDecoration(
                      "Enter your university",
                      "Enter your affiliated university",
                      Icons.school_outlined)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            SubmitButton(
                onPressed: () {
                  _formKey.currentState!.validate()
                      ? print("Student Stage Two Form valid")
                      : print("Invalid form");

                  print("\n\n");
                  print("STUDENT: ");
                  print("email: ${widget.user.email}");
                  print("password: ${widget.user.password}");
                  print("confirmed password: ${widget.user.confirmedPassword}");
                  print("\n");
                  print("first name: ${student.firstName}");
                  print("last name: ${student.lastName}");
                  print("university at: ${student.university}");
                  print("field_of_study: ${student.fieldOfStudy}");
                  print("\n\n");
                  // ? Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const StudentHomePage()),
                  //   )
                },
                scaleFactor:
                    ResponsiveWidget.isSmallScreen(context) ? 0.6 : 0.45,
                textIn: "Create account"),
            const SizedBox(height: 8),
            TextButton(
                onPressed: () {
                  print("Go to login Button pressed");
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
}
