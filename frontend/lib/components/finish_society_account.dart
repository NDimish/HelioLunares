import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_form_field.dart';

class FinishSettingUpSociety extends StatefulWidget {
  TextEditingController societyName, uniStudyingAt, creationDate;
  bool allowedToContinue;
  double counter;
  GlobalKey<FormState> formKey;

  FinishSettingUpSociety(
      {super.key,
      required this.societyName,
      required this.creationDate,
      required this.uniStudyingAt,
      required this.formKey,
      required this.counter,
      required this.allowedToContinue});

  @override
  State<FinishSettingUpSociety> createState() => _FinishSettingUpSocietyState();
}

class _FinishSettingUpSocietyState extends State<FinishSettingUpSociety> {
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
                          widget.societyName,
                          "Enter your society name",
                          "Society Name",
                          TextInputType.name,
                          Icons.school_rounded,
                          false,
                          widget.allowedToContinue,
                          nameValidator)),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.creationDate,
                          "When was your society created?",
                          "Society Creation Date",
                          TextInputType.datetime,
                          Icons.date_range_rounded,
                          false,
                          widget
                              .allowedToContinue, //true and can be changed with the lock button later.
                          dateValidator)),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.uniStudyingAt,
                          "Enter a university",
                          "University",
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
                            print("Society has been registered!");
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

  String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a date";
    }
    return null;
  }
}
