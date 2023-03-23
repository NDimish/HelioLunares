import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/authentication/sign_up/student/student_sign_up.dart';
import 'package:university_ticketing_system/home/homepage.dart';
import 'package:university_ticketing_system/submit_button.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/models/student.dart';
import 'package:university_ticketing_system/authentication/models/user_account.dart';
import 'package:university_ticketing_system/tff_decoration.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:university_ticketing_system/globals.dart' as globals;

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
  TextEditingController fieldOfStudyController = TextEditingController();

  String? uniValue;

  List<String> uniNames = [];
  Map<String, int> uniMap = {};

  late Future<List<dynamic>> returnedUniversitiesFromEndPoint;
  Future<List<dynamic>> getUniversities() async {
    final response =
        await http.get(Uri.parse("${globals.DATASOURCE}university/"));
    final List<dynamic> data = json.decode(response.body);
    return data;
  }

  @override
  void initState() {
    super.initState();
    returnedUniversitiesFromEndPoint =
        getUniversities().then((List<dynamic> result) {
      setState(() {
        uniNames = result.map((e) => e['name'].toString()).toList();
        result.forEach((value) => uniMap[value['name']] = value['id']);

        uniNames.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
      });
      return uniNames;
    });
  }

  @override
  void dispose() {
    super.dispose();
    inputNode.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    fieldOfStudyController.dispose();
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your first name";
                    }

                    if (value.contains(RegExp(r'(\d+)'))) {
                      return "Name cannot have numbers";
                    }

                    if (value.length > 39) {
                      return "Name cannot be longer than 40 characters";
                    }

                    return null;
                  },
                  onFieldSubmitted: (value) {
                    //print("fn submitted");
                    student.setFirstName(firstNameController.text);
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your last name";
                    }

                    if (value.contains(RegExp(r'(\d+)'))) {
                      return "Name cannot have numbers";
                    }

                    if (value.length > 39) {
                      return "Name cannot be longer than 40 characters";
                    }

                    return null;
                  },
                  onFieldSubmitted: (value) {
                    //print("ln submitted");
                    student.setLastName(lastNameController.text);
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your field of study";
                    }

                    if (value.contains(RegExp(r'(\d+)'))) {
                      return "Field of study cannot have numbers";
                    }

                    if (value.length > 29) {
                      return "Name cannot be longer than 30 characters";
                    }

                    return null;
                  },
                  onFieldSubmitted: (value) {
                    //print("fos submitted");
                    student.setFieldOfStudy(fieldOfStudyController.text);
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
            FutureBuilder<List<dynamic>>(
                future: returnedUniversitiesFromEndPoint,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      width: ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width * 0.85
                          : MediaQuery.of(context).size.width * 0.60,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Select a university";
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontFamily: "Arvo", color: Colors.black),
                            decoration: customDecorationForDropDown(
                                "University", "Select your university"),
                            isExpanded: true,
                            hint: const Text('Select any category',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: "Arvo")),
                            items: List<DropdownMenuItem>.generate(
                                uniNames.length, (int index) {
                              return DropdownMenuItem(
                                  value: uniNames[index],
                                  child: Text(
                                    uniNames[index].toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Arvo', fontSize: 16),
                                  ));
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                print(val);
                                uniValue = val.toString();
                                student.setUniversity(uniValue!);
                              });
                            }),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        ScaffoldMessenger.of(context).showSnackBar(
                            informationSnackbar(
                                "An error occurred downloading university data from the server. Try again later.")));
                    Timer(const Duration(seconds: 3), () {
                      //print("Yeah, this line is printed after 3 seconds");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    });
                    return SizedBox(
                        width: ResponsiveWidget.isSmallScreen(context)
                            ? MediaQuery.of(context).size.width * 0.85
                            : MediaQuery.of(context).size.width * 0.60,
                        child: TextFormField(
                          enabled: false,
                          decoration: customDecoration(
                              "University",
                              "Unable to load university data",
                              Icons.school_outlined),
                        ));
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            SubmitButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setStudentInformation();

                    print("\nEmail: ${student.user.email}");
                    print("Passw: ${student.user.password}");
                    print("UniID: ${student.universityAtId}");
                    print("FName: ${student.firstName}");
                    print("LName: ${student.lastName}");
                    print("FieOS: ${student.fieldOfStudy}");

                    http.Response response = await createPerson(
                        student.user.email,
                        student.user.password,
                        student.universityAtId,
                        student.firstName,
                        student.lastName,
                        student.fieldOfStudy);

                    print("Status Code: ${response.statusCode}");

                    if (response.statusCode == 201) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          informationSnackbar(
                              "Student Account Created! Redirecting to login"));
                      Timer(const Duration(seconds: 2), () {
                        //print("Yeah, this line is printed after 3 seconds");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()),
                        );
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          informationSnackbar(
                              "Your credentials were not accepted. Try again."));

                      Timer(const Duration(seconds: 2), () {
                        //print("Yeah, this line is printed after 3 seconds");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StudentSignUp()),
                        );
                      });
                    }

                    print(response.body);
                  }

                  print("\n\n");
                  print("STUDENT: ");
                  print("email: ${widget.user.email}");
                  print("password: ${widget.user.password}");
                  print("confirmed password: ${widget.user.confirmedPassword}");
                  print("\n");
                  print("first name: ${student.firstName}");
                  print("last name: ${student.lastName}");
                  print("university at: ${student.university}");
                  print("university at: ${student.universityAtId}");
                  print("field_of_study: ${student.fieldOfStudy}");
                  print("\n\n");
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

  void setStudentInformation() {
    student.setFirstName(firstNameController.text);
    student.setLastName(lastNameController.text);
    student.setUniversity(uniValue!);
    student.setUserAccount(widget.user);

    if (uniValue != null) {
      student.setUniversityId(uniMap[uniValue]!);
    }
  }

  SnackBar informationSnackbar(String text) {
    return SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontFamily: "Arvo", color: Colors.white),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
    );
  }
}
