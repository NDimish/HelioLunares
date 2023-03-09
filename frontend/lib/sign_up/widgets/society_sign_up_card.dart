import 'package:university_ticketing_system/sign_up/widgets/finish_form_title.dart';
import 'package:university_ticketing_system/sign_up/widgets/society_form_title.dart';
import 'package:flutter/material.dart';

class SocietySignUpCard extends StatefulWidget {
  //final VoidCallback onButtonPressed;required this.onButtonPressed,
  final PageController pageController;
  final GlobalKey<FormState> fKey, finishFormKey;
  //Function(int) callback;

  SocietySignUpCard({
    super.key,
    required this.pageController,
    required this.fKey,
    required this.finishFormKey,
    //required this.callback
  });

  @override
  State<SocietySignUpCard> createState() => _SocietySignUpCardState();
}

class _SocietySignUpCardState extends State<SocietySignUpCard> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  final uniAtController = TextEditingController();
  final societyNameController = TextEditingController();
  final societyCreationDateController = TextEditingController();

  String email = "",
      password = "",
      confirmPassword = "",
      socName = "",
      uniAt = "",
      dateCreated = "";
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
                    physics: const NeverScrollableScrollPhysics(),
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.04),
                      TextFormField(
                          controller: societyNameController,
                          onFieldSubmitted: (value) {
                            print("submitted");
                          },
                          onChanged: (value) {},
                          onSaved: (newValue) {
                            socName = newValue!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the society name";
                            }
                            return null;
                          },
                          decoration: customDecoration("Society Name",
                              "Enter your society name", Icons.person_rounded)),
                      const SizedBox(height: 35),
                      TextFormField(
                          controller: societyCreationDateController,
                          onFieldSubmitted: (value) {
                            print("submitted");
                          },
                          onChanged: (value) {},
                          onSaved: (newValue) {
                            dateCreated = newValue!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the society's creation date";
                            }
                            return null;
                          },
                          decoration: customDecoration(
                              "Creation Date",
                              "Enter the society's creation date",
                              Icons.person_rounded)),

                      const SizedBox(height: 35),
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
                              return "Enter the society's university";
                            }
                            return null;
                          },
                          decoration: customDecoration(
                              "University the society is at",
                              "Enter the society's university",
                              Icons.person_rounded)),
                      //const SizedBox(height: 35),
                    ],
                  ),
                )),
            const SizedBox(width: 40),
            Expanded(
              flex: 1,
              child: Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.23,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
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
                            Navigator.popAndPushNamed(context, '/societyhub');
                          },
                          child: const Text("Next",
                              style: TextStyle(
                                  fontFamily: 'Arvo', color: Colors.white))),
                    )),
              ),
            )
          ]),
        ]));
  }

  Form stageOneForm(BuildContext context) {
    return Form(
        key: widget.fKey,
        child: Column(
          children: [
            const SocietyFormTitle(),
            Row(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.only(left: 32.0),
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
                                        duration:
                                            const Duration(milliseconds: 500),
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
        errorStyle: const TextStyle(fontFamily: "Arvo"),
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(fontFamily: "Arvo", fontSize: 13),
        hintStyle: const TextStyle(fontFamily: "Arvo", fontSize: 13),
        floatingLabelStyle:
            const TextStyle(color: Colors.black, fontFamily: "Arvo"),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }
}
