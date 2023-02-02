import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_form_field.dart';

Widget buildUserAccountForm(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPassController,
    GlobalKey<FormState> formKey) {
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
                emailController,
                "Enter an email address",
                "Email",
                TextInputType.emailAddress,
                Icons.email_rounded,
                false,
                emailValidator),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: width / 3.3,
            child: customTextFormField(
                context,
                passwordController,
                "Enter a password",
                "Password",
                TextInputType.name,
                Icons.lock_rounded,
                true,
                passwordValidator),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: width / 3.3,
            child: customTextFormField(
              context,
              confirmPassController,
              "Passwords did not match",
              "Re-enter Password",
              TextInputType.name,
              Icons.lock_rounded,
              true,
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Please re-enter your password';
                }
                if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: width / 23,
            width: width / 5,
            child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("Acount created");
                    formKey.currentState!.save();
                  }
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF333951),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                child: const Text("Next")),
          )
        ],
      ),
    ),
  );
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  return null;
}
