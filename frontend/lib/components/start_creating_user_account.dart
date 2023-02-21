import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_form_field.dart';

class StartCreatingUserAccount extends StatefulWidget {
  TextEditingController emailController,
      passwordController,
      confirmPasswordController;

  double counter;
  GlobalKey<FormState> formKey;

  StartCreatingUserAccount(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.counter,
      required this.formKey});

  @override
  State<StartCreatingUserAccount> createState() =>
      _StartCreatingUserAccountState();
}

class _StartCreatingUserAccountState extends State<StartCreatingUserAccount> {
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
                  const Text("Create your account!",
                      textAlign: TextAlign.center, textScaleFactor: 1.5),
                  const SizedBox(height: 40),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.emailController,
                          "Please enter an email address",
                          "Email",
                          TextInputType.emailAddress,
                          Icons.email_rounded,
                          false,
                          false,
                          emailValidator)),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.passwordController,
                          "Please enter a password",
                          "Password",
                          TextInputType.name,
                          Icons.lock_rounded,
                          false,
                          false, //true and can be changed with the lock button later.
                          passwordValidator)),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: width / 3.3,
                      child: customTextFormField(
                          context,
                          widget.confirmPasswordController,
                          "Please re-enter your password",
                          "Re-enter Password",
                          TextInputType.name,
                          Icons.lock_rounded,
                          false,
                          false, //true and can be changed with the lock button later.
                          confirmPasswordValidator)),
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

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email address";
    }
    setState(() {
      widget.counter += 1;
    });
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    setState(() {
      widget.counter += 1;
    });
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please re-enter your password";
    }
    if (value != widget.passwordController.text) {
      return "Passwords do not match";
    }
    setState(() {
      widget.counter += 1;
    });
    return null;
  }

  double getCounterValue() {
    return widget.counter;
  }
}
