import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_fields.dart';
import 'package:university_ticketing_system/components/finish_society_account.dart';
import 'package:university_ticketing_system/components/base-appbar.dart';
import 'package:university_ticketing_system/components/start_creating_user_account.dart';

class SignUpAsSocietyScreen extends StatefulWidget {
  const SignUpAsSocietyScreen({super.key});

  @override
  State<SignUpAsSocietyScreen> createState() => _SignUpAsSocietyScreenState();
}

class _SignUpAsSocietyScreenState extends State<SignUpAsSocietyScreen> {
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();
  TextEditingController _textControllerConfirmPassword =
      TextEditingController();

  TextEditingController _societyName = TextEditingController();
  TextEditingController _creationDate = TextEditingController();

  TextEditingController _uniStudyingAt = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKeyFinalisation = GlobalKey<FormState>();

  double setUpCounter = 0 / 3;
  double finalisationCounter = 0 / 4;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: BaseAppBar(
            title: const Text("University ticketing system"),
            widgets: <Widget>[],
            appBar: AppBar()),
        body: SafeArea(
            child: Row(children: [
          Flexible(
              flex: 10,
              child: Container(
                width: width / 1.5,
                margin: const EdgeInsets.only(right: 1.5),
                color: const Color(0xFFc5afc6),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: width / 3.2,
                                    child: LinearProgressIndicator(
                                      value: setUpCounter,
                                      color: const Color(0xFF006d77),
                                      backgroundColor: const Color(0xFF83c5be),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  StartCreatingUserAccount(
                                    emailController: _textControllerEmail,
                                    passwordController: _textControllerPassword,
                                    confirmPasswordController:
                                        _textControllerConfirmPassword,
                                    counter: setUpCounter,
                                    formKey: _formKey,
                                  ),
                                ],
                              )))
                    ]),
              )),
          Flexible(
              flex: 10,
              child: Container(
                  width: width / 1.5,
                  color: const Color(0xFFf8edeb),
                  child: Column(children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Form(
                            key: _formKeyFinalisation,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: width / 3.2,
                                    child: LinearProgressIndicator(
                                      value: finalisationCounter,
                                      color: const Color(0xFF006d77),
                                      backgroundColor: const Color(0xFF83c5be),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  FinishSettingUpSociety(
                                    allowedToContinue: _formKey.currentState !=
                                                null &&
                                            _formKey.currentState!.validate()
                                        ? true
                                        : false,
                                    uniStudyingAt: _uniStudyingAt,
                                    formKey: _formKeyFinalisation,
                                    counter: finalisationCounter,
                                    creationDate: _creationDate,
                                    societyName: _societyName,
                                  )
                                ])))
                  ])))
        ])));
  }
}
