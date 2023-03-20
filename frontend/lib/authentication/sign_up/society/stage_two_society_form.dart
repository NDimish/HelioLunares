import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/sign_up/society/stage_three_society_form.dart';
import 'package:university_ticketing_system/submit_button.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/models/society.dart';
import 'package:university_ticketing_system/authentication/models/user_account.dart';
import 'package:university_ticketing_system/tff_decoration.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the society sign up form --> STAGE 2
/// It sets up the society's name, creation date, university.
///
/// It must be validated before the sign up can continue.
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

  late DateTime currentDate;

  TextEditingController societyNameController = TextEditingController();
  TextEditingController dateCreatedController = TextEditingController();
  String? uniValue;

  List<String> uniNames = [];
  Map<String, int> uniMap = {};

  late Future<List<dynamic>> returnedUniversitiesFromEndPoint;
  Future<List<dynamic>> getUniversities() async {
    final response =
        await http.get(Uri.parse("http://localhost:8000/university/"));
    final List<dynamic> data = json.decode(response.body);
    return data;
  }

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();

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
    societyNameController.dispose();
    dateCreatedController.dispose();
  }

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1800),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        dateCreatedController.clear();
        currentDate = pickedDate;
        String formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
        dateCreatedController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              title: const Text("Continue Sign Up",
                  style: TextStyle(
                    fontFamily: "Arvo",
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )))
          : AppBar(
              title: const Text("Continue Sign Up",
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
                                  const Text("Continue Your Sign Up",
                                      textScaleFactor: 2.5,
                                      style: TextStyle(
                                          fontFamily: "Arvo",
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.005),
                                  const Text(
                                    "----- Continue creating your account! -----",
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a name";
                    }
                    return null;
                  },
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
                  controller: dateCreatedController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a date";
                    }
                    try {
                      DateFormat.yMd().parse(value);
                    } on FormatException {
                      return "Enter a date of form dd/mm/YYYY";
                    }
                    return null;
                  },
                  onTap: () {
                    _selectDate(context);
                    print(currentDate.toString());
                  },
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
                  decoration: customDecoration(
                      "Date of Establishment",
                      "Enter the society's creation date",
                      Icons.date_range_rounded)),
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
                                society.setUni(uniValue!);
                              });
                            }),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    //return Text('${snapshot.error}');
                    return const AlertDialog(
                      content: Text("Error occured"),
                      elevation: 10,
                    );
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            SubmitButton(
                onPressed: () {
                  //Validate the info and send to the last stage.
                  if (_formKey.currentState!.validate()) {
                    setSocietyInformation();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StageThreeSocietySignUp(soc: society)),
                    );
                  } else {
                    print("Invalid form");
                  }
                },
                scaleFactor:
                    ResponsiveWidget.isSmallScreen(context) ? 0.6 : 0.45,
                textIn: "Continue"),
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

  void setSocietyInformation() {
    society.setDateCreated(dateCreatedController.text);
    society.setSocName(societyNameController.text);
    society.setUni(uniValue!);
    society.setUserAccount(widget.user);
    society.setUniId(uniMap[uniValue]!);
  }
}
