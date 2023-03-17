import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/sign_up/society/stage_three_society_form.dart';
import 'package:university_ticketing_system/submit_button.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/models/society.dart';
import 'package:university_ticketing_system/authentication/models/student.dart';
import 'package:university_ticketing_system/authentication/models/user_account.dart';
import 'package:university_ticketing_system/tff_decoration.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:intl/intl.dart';

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
  TextEditingController uniAtController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    //print(widget.user.email);
    super.initState();
    currentDate = DateTime.now();
  }

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        dateCreatedController.clear();
        currentDate = pickedDate;

        String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
        dateCreatedController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
                  onTap: () {
                    _selectDate(context);
                    // setState(() {
                    //   dateCreatedController.text =
                    //       currentDate.toString(); //.split(" ")[0];
                    // });
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
                  //obscureText: confirmPasswordVisible,
                  decoration: customDecoration(
                      "Date of Establishment",
                      "Enter the society's creation date",
                      Icons.date_range_rounded)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
            SubmitButton(
                onPressed: () {
                  // _formKey.currentState!.validate()
                  //     ? print("Society Stage Two Form valid")
                  //     : print("Invalid form");
                  society.setDateCreated(dateCreatedController.text);
                  society.setSocName(societyNameController.text);
                  society.setUni(uniAtController.text);
                  society.setUserAccount(widget.user);

                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StageThreeSocietySignUp(soc: society)),
                    );
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
}
