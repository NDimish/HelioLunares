import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_form_field.dart';

class FinishSettingUpAccount extends StatefulWidget {
  TextEditingController firstName, lastName, uniStudyingAt, fieldOfStudy;
  bool allowedToContinue;
  double counter;
  GlobalKey<FormState> formKey;

  FinishSettingUpAccount(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.uniStudyingAt,
      required this.fieldOfStudy,
      required this.formKey,
      required this.counter,
      required this.allowedToContinue});

  @override
  State<FinishSettingUpAccount> createState() => _FinishSettingUpAccountState();
}

class _FinishSettingUpAccountState extends State<FinishSettingUpAccount> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
        width: width / 2.8,
        height: height * 0.75,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text("Finish your account sign up!",
                      textAlign: TextAlign.center, textScaleFactor: 1.5),
                  const SizedBox(height: 40),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.firstName,
                          "Enter your last name",
                          "First Name",
                          TextInputType.emailAddress,
                          Icons.email_rounded,
                          false,
                          widget.allowedToContinue,
                          nameValidator)),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.lastName,
                          "Enter your last name",
                          "Last Name",
                          TextInputType.name,
                          Icons.lock_rounded,
                          false,
                          widget
                              .allowedToContinue, //true and can be changed with the lock button later.
                          nameValidator)),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.uniStudyingAt,
                          "Enter a university",
                          "University",
                          TextInputType.name,
                          Icons.lock_rounded,
                          false,
                          widget
                              .allowedToContinue, //true and can be changed with the lock button later.
                          nameValidator)),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.fieldOfStudy,
                          "Enter your field of study",
                          "Field of Study",
                          TextInputType.name,
                          Icons.school_rounded,
                          false,
                          widget
                              .allowedToContinue, //true and can be changed with the lock button later.
                          nameValidator)),
                  const SizedBox(height: 60),
                  SizedBox(
                    height: width / 23,
                    width: width / 5,
                    child: ElevatedButton(
                        onPressed: () {
                          if (widget.formKey.currentState!.validate()) {
                            print(
                                "Acount created, now finish setting up account");
                            widget.formKey.currentState!.save();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF333951),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: const Text("Next")),
                  )
                ])));
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a name";
    }
    return null;
  }
}
