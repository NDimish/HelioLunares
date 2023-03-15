import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_button.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/models/society.dart';
import 'package:university_ticketing_system/authentication/models/student.dart';
import 'package:university_ticketing_system/authentication/models/user_account.dart';
import 'package:university_ticketing_system/authentication/tff_decoration.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';

class StageTwoSocietySignUp extends StatefulWidget {
  UserAccount user;
  StageTwoSocietySignUp({super.key, required this.user});

  @override
  State<StageTwoSocietySignUp> createState() => _StageTwoSocietySignUpState();
}

class _StageTwoSocietySignUpState extends State<StageTwoSocietySignUp> {
  final _formKey = GlobalKey<FormState>();

  Society society = Society();
  FocusNode inputNode = FocusNode();

  TextEditingController societyNameController = TextEditingController();
  TextEditingController dateCreatedController = TextEditingController();
  TextEditingController uniAtController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    //print(widget.user.email);
    super.initState();
  }

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
                                    'assets/images/people.png',
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
                                  stageTwoSocietySignUpForm(context)
                                ])
                          ]))))),
    );
  }

  Form stageTwoSocietySignUpForm(BuildContext context) {
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
                  controller: societyNameController,
                  //validator: ,
                  onFieldSubmitted: (value) {
                    print("sn submitted");
                  },
                  onChanged: (value) {
                    society.setSocName(societyNameController.text);
                    print(society.socName);
                  },
                  onSaved: (newValue) {
                    society.setSocName(newValue!);
                  },
                  decoration: customDecoration("Society Name",
                      "Enter the society name", Icons.person_rounded)),
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
                  controller: uniAtController,
                  //validator: passwordValidator,
                  onFieldSubmitted: (value) {
                    print("uni submitted");
                  },
                  onChanged: (value) {
                    society.setUni(uniAtController.text);
                    print(society.universityAt);
                  },
                  onSaved: (newValue) {
                    society.setUni(newValue!);
                  },
                  //obscureText: passwordVisible,
                  decoration: customDecoration("University",
                      "Enter your university", Icons.school_rounded)),
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
                  controller: dateCreatedController,
                  //validator: ,
                  onFieldSubmitted: (value) {
                    print("dc submitted");
                  },
                  onChanged: (value) {
                    society.setDateCreated(dateCreatedController.text);
                    print(society.dateCreated);
                  },
                  onSaved: (newValue) {
                    society.setDateCreated(newValue!);
                  },
                  //obscureText: confirmPasswordVisible,
                  decoration: customDecoration(
                      "Date of Establishment",
                      "Enter the society's creation date",
                      Icons.school_outlined)),
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            // SizedBox(
            //   width: ResponsiveWidget.isSmallScreen(context)
            //       ? MediaQuery.of(context).size.width * 0.85
            //       : MediaQuery.of(context).size.width * 0.60,
            //   child: TextFormField(
            //       cursorColor: Colors.black,
            //       style:
            //           const TextStyle(fontFamily: "Arvo", color: Colors.black),
            //       controller: uniAtController,
            //       //validator: ,
            //       onFieldSubmitted: (value) {
            //         print("uniAt submitted");
            //       },
            //       onChanged: (value) {
            //         student.setUniversity(uniAtController.text);
            //         print(student.university);
            //       },
            //       onSaved: (newValue) {
            //         student.setUniversity(newValue!);
            //       },
            //       //obscureText: confirmPasswordVisible,
            //       decoration: customDecoration(
            //           "Enter your university",
            //           "Enter your affiliated university",
            //           Icons.school_outlined)),
            // ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            SubmitButton(
                onPressed: () {
                  _formKey.currentState!.validate()
                      ? print("Society Stage Two Form valid")
                      : print("Invalid form");
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
