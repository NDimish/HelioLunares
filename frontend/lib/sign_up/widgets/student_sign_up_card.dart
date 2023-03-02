import 'package:university_ticketing_system/sign_up/widgets/finish_form_title.dart';
import 'package:university_ticketing_system/sign_up/widgets/student_form_title.dart';
import 'package:flutter/material.dart';

class SignUpCard extends StatefulWidget {
  //final VoidCallback onButtonPressed;required this.onButtonPressed,
  final PageController pageController;
  final GlobalKey<FormState> fKey, finishFormKey;
  //Function(int) callback;

  SignUpCard({
    super.key,
    required this.pageController,
    required this.fKey,
    required this.finishFormKey,
    //required this.callback
  });

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final uniAtController = TextEditingController();
  final fieldOfStudy = TextEditingController();

  String email = "",
      password = "",
      confirmPassword = "",
      firstName = "",
      lastName = "",
      uniAt = "",
      degName = "";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * (2 / 3),
        width: MediaQuery.of(context).size.width * (2 / 3),
        child: Card(
            elevation: 0,
            color: Colors.white.withOpacity(0.55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
                child: PageView(
                    controller: widget.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    pageSnapping: true,
                    children: <Widget>[
                  stageOneForm(context),
                  stageTwoForm(context),
                ]))));
  }

  Form stageTwoForm(BuildContext context) {
    return Form(
      key: widget.finishFormKey,
      child: Column(children: <Widget>[
        const FinishSignUpTitle(),
        Row(children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    TextFormField(
                        controller: firstNameController,
                        onFieldSubmitted: (value) {
                          print("submitted");
                        },
                        onChanged: (value) {},
                        onSaved: (newValue) {
                          firstName = newValue!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your first name";
                          }
                          return null;
                        },
                        decoration: customDecoration("First Name",
                            "Enter your first name", Icons.person_rounded)),
                    const SizedBox(height: 35),
                    TextFormField(
                        controller: lastNameController,
                        onFieldSubmitted: (value) {
                          print("submitted");
                        },
                        onChanged: (value) {},
                        onSaved: (newValue) {
                          lastName = newValue!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your last name";
                          }
                          return null;
                        },
                        decoration: customDecoration("Last Name",
                            "Enter your last name", Icons.person_rounded)),
                    //const SizedBox(height: 35),
                  ],
                ),
              )),
          const SizedBox(width: 20),
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        TextFormField(
                            controller: uniAtController,
                            onFieldSubmitted: (value) {
                              print("submitted");
                            },
                            onChanged: (value) {},
                            onSaved: (newValue) {
                              uniAt = newValue!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter the university you study at";
                              }
                              return null;
                            },
                            decoration: customDecoration(
                                "University",
                                "Univeristy you are enrolled at",
                                Icons.school_rounded)),
                        const SizedBox(height: 35),
                        TextFormField(
                            controller: fieldOfStudy,
                            onFieldSubmitted: (value) {
                              print("submitted");
                            },
                            onChanged: (value) {},
                            onSaved: (newValue) {
                              degName = newValue!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter the name of your degree";
                              }
                              return null;
                            },
                            decoration: customDecoration(
                                "Degree Name",
                                "Enter your field of study",
                                Icons.school_rounded)),
                        //const SizedBox(height: 35),
                      ])))
        ]),
        const SizedBox(height: 50),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.055,
            width: MediaQuery.of(context).size.width * 0.25,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  widget.finishFormKey.currentState!.validate();
                  widget.finishFormKey.currentState!.save();
                  print("Form saved, redirect to next page");
                },
                child: const Text("Next",
                    style: TextStyle(fontFamily: 'Arvo', color: Colors.white))))
      ]),
    );
  }

  Form stageOneForm(BuildContext context) {
    return Form(
        key: widget.fKey,
        child: Column(
          children: [
            const FormTitle(),
            Row(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04),
                            TextFormField(
                                controller: emailController,
                                onFieldSubmitted: (value) {
                                  print("submitted");
                                },
                                onChanged: (value) {},
                                onSaved: (newValue) {
                                  email = newValue!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a valid email";
                                  }
                                  return null;
                                },
                                decoration: customDecoration("Email",
                                    "Enter your email", Icons.email_rounded)),
                            const SizedBox(height: 35),
                            TextFormField(
                                controller: passwordController,
                                onFieldSubmitted: (value) {
                                  print("submitted");
                                },
                                onChanged: (value) {},
                                onSaved: (newValue) {
                                  email = newValue!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a valid password";
                                  }
                                  return null;
                                },
                                decoration: customDecoration("Password",
                                    "Enter your password", Icons.lock_rounded)),
                            const SizedBox(height: 35),
                            TextFormField(
                                controller: confirmPassController,
                                onFieldSubmitted: (value) {
                                  print("submitted");
                                },
                                onChanged: (value) {},
                                onSaved: (newValue) {
                                  email = newValue!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Passwords do not match";
                                  }
                                  return null;
                                },
                                decoration: customDecoration(
                                    "Re-enter Password",
                                    "Confirm your password",
                                    Icons.lock_rounded)),
                          ]))),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.055,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (widget.fKey.currentState!.validate()) {
                                    widget.fKey.currentState!.save();
                                    print("Form saved");
                                    widget.pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInSine);
                                  }
                                },
                                child: const Text("Next",
                                    style: TextStyle(
                                        fontFamily: 'Arvo',
                                        color: Colors.white))))
                      ])))
            ]),
          ],
        ));
  }

  InputDecoration customDecoration(
      String labelText, String hintText, IconData iconIn) {
    return InputDecoration(
        contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0),
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
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }
}
