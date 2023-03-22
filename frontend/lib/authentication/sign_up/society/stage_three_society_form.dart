import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/models/society_categories.dart';
import 'package:university_ticketing_system/authentication/sign_up/society/society_sign_up.dart';
import 'package:university_ticketing_system/authentication/sign_up/student/student_sign_up.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/submit_button.dart';
import 'package:university_ticketing_system/authentication/models/society.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/responsive.dart';

import 'package:http/http.dart' as http;

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the society sign up form --> STAGE 3
/// It sets up the societies' categories and bio.
///
class StageThreeSocietySignUp extends StatefulWidget {
  Society soc;
  StageThreeSocietySignUp({super.key, required this.soc});

  @override
  State<StageThreeSocietySignUp> createState() =>
      _StageThreeSocietySignUpState();
}

class _StageThreeSocietySignUpState extends State<StageThreeSocietySignUp> {
  final _formKey = GlobalKey<FormState>();
  FocusNode inputNode = FocusNode();

  String bio = "";
  TextEditingController bioController = TextEditingController();

  List<String> selectedChoices = [];
  List<int> selectedIds = [];

  Map<String, int> selectedChoicesIds = {};
  List<String> categoryNames = [];

  late Future<List<dynamic>> returnedCategoriesFromEndPoint;
  Future<List<dynamic>> getSocietyCategories() async {
    final response = await http
        .get(Uri.parse("http://localhost:8000/society_categories_type/"));
    final List<dynamic> data = json.decode(response.body);
    return data;
  }

  @override
  void initState() {
    super.initState();
    returnedCategoriesFromEndPoint =
        getSocietyCategories().then((List<dynamic> result) {
      setState(() {
        categoryNames =
            result.map((e) => e['category_name'].toString()).toList();

        result.forEach((value) =>
            selectedChoicesIds[value['category_name']] = value['id']);
      });
      return categoryNames;
    });
  }

  @override
  void dispose() {
    super.dispose();
    bioController.dispose();
    inputNode.dispose();
  }

  final snackBar = const SnackBar(
    content: Text(
      "Select up to three categories",
      style: TextStyle(fontFamily: "Arvo", color: Colors.white),
    ),
    duration: Duration(milliseconds: 750),
    backgroundColor: Colors.black,
  );

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
                                              0.055),
                                  stageThreeSocietySignUpForm(context)
                                ])
                          ]))))),
    );
  }

  stageThreeSocietySignUpForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? MediaQuery.of(context).size.width * 0.85
                : MediaQuery.of(context).size.width * 0.60,
            child: TextFormField(
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontFamily: "Arvo", color: Colors.black),
                controller: bioController,
                maxLength: 150,
                maxLines: 5,
                onFieldSubmitted: (value) {
                  print("bio submitted");
                },
                onChanged: (value) {
                  bio = bioController.text;
                  widget.soc.setBio(bio);
                  print(widget.soc.bio);
                },
                onSaved: (newValue) {
                  widget.soc.setBio(newValue!);
                },
                decoration: customDecorationMultiLineTextField(
                    "Add a bio (optional)",
                    "Enter your bio",
                    Icons.description_rounded)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.60,
              child: const Divider(
                thickness: 0.2,
                color: Colors.black,
              )),
          SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Select three categories",
                      style: TextStyle(fontFamily: "Arvo")),
                  const SizedBox(height: 10.0),
                  //Text(names.first)
                  FutureBuilder<List<dynamic>>(
                    future: returnedCategoriesFromEndPoint,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        //return Text(snapshot.data!.length.toString());
                        return Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children: List<Widget>.generate(
                            categoryNames.length,
                            (int index) {
                              return ChoiceChip(
                                side: BorderSide.none,
                                elevation: 0,
                                label: Text(categoryNames[index],
                                    style: const TextStyle(fontFamily: "Arvo")),
                                selected: selectedChoices
                                    .contains(categoryNames[index]),
                                onSelected: (bool selected) {
                                  setState(() {
                                    if (selectedChoices
                                        .contains(categoryNames[index])) {
                                      selectedChoices
                                          .remove(categoryNames[index]);
                                      selectedIds.remove(selectedChoicesIds[
                                          categoryNames[index]]);
                                    } else {
                                      selectedChoices.add(categoryNames[index]);
                                      selectedIds.add(selectedChoicesIds[
                                          categoryNames[index]]!);
                                    }
                                  });
                                },
                              );
                            },
                          ).toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          SubmitButton(
              onPressed: () async {
                widget.soc.setBio(bio);
                //_formKey.currentState!.validate()
                if (selectedChoices.length > 3 || selectedChoices.isEmpty) {
                  print("Invalid form");
                  setState(() {
                    selectedChoices = [];
                    selectedIds = [];
                  });
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  print("\n\n");
                  print("SOCIETY: ");
                  print("email: ${widget.soc.user.email}");
                  print("password: ${widget.soc.user.password}");
                  print(
                      "confirmed password: ${widget.soc.user.confirmedPassword}");
                  print("\n");
                  print("society_name: ${widget.soc.socName}");
                  print("society creation_date: ${widget.soc.dateCreated}");
                  print("society university at: ${widget.soc.universityAt}");
                  print(
                      "society university at id: ${widget.soc.universityAtId}");
                  print("\n");
                  print("society bio: $bio");
                  print("society categories: ${selectedChoices}");
                  //getCategoryIds();
                  print("society categories: ${selectedIds}");

                  http.Response response = await createSociety(
                      widget.soc.user.email,
                      widget.soc.user.password,
                      widget.soc.universityAtId,
                      widget.soc.socName,
                      widget.soc.dateCreated,
                      bio,
                      selectedIds);

                  print("Status Code: ${response.statusCode}");

                  if (response.statusCode == 201) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        informationSnackbar(
                            "Society Account Created! Redirecting to login"));
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
                            builder: (context) => const SocietySignUp()),
                      );
                    });
                  }

                  print("Status Code: ${response.statusCode}");
                }
              },
              scaleFactor: ResponsiveWidget.isSmallScreen(context) ? 0.6 : 0.40,
              textIn: "Create account")
        ]));
  }

  void getCategoryIds() {
    if (selectedChoices.isNotEmpty) {
      selectedChoices.forEach((element) {
        selectedIds.add(selectedChoicesIds[element]!);
      });
    }
  }

  //Separate styling for multi line text fields.
  InputDecoration customDecorationMultiLineTextField(
      String labelText, String hintText, IconData iconIn) {
    return InputDecoration(
        contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 25.0),
          child: Icon(
            iconIn,
            color: Colors.black,
          ), // myIcon is a 48px-wide widget.
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorStyle: const TextStyle(fontFamily: "Arvo"),
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(fontFamily: "Arvo", fontSize: 18),
        hintStyle: const TextStyle(fontFamily: "Arvo", fontSize: 15),
        floatingLabelStyle: const TextStyle(
            color: Colors.black, fontFamily: "Arvo", fontSize: 18),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }

  SnackBar informationSnackbar(String text) {
    return SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontFamily: "Arvo", color: Colors.white),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
    );
  }
}
