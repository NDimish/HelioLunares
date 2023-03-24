import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/globals.dart' as global;


import '../../../../helpers/responsiveness.dart';


class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {

   
  
  Widget customTextFormField(
    String headerName,
    String name,
    IconData nameIcon,
    TextEditingController? formController,
    bool shouldBeEnabled,
    String? Function(String?)? validation,
  ) {
    return SizedBox(
        width: 300,
        child: TextFormField(
            enabled: shouldBeEnabled,
            obscureText: headerName.contains("Password") ? true : false,
            controller: formController,
            validator: validation,
            decoration: customDecoration(headerName, name, nameIcon)));
  }

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final uniController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) =>
                dataCollector<User>(ID: global.localdataobj.getUserID()),
          ),
          ChangeNotifierProvider(
            create: (context) =>
                dataCollector<People>(ID: global.localdataobj.getUserID()),
          ),
        ],
        builder: (context, child) {
          final userProvider = Provider.of<dataCollector<User>>(context);
          final peopleProvider = Provider.of<dataCollector<People>>(context);
          emailController.text = userProvider.collection[0].email;
          firstNameController.text = peopleProvider.collection[0].first_name;
          lastNameController.text = peopleProvider.collection[0].last_name;
          uniController.text = peopleProvider.collection[0].university.name;

          return Scaffold(
            backgroundColor: const Color(0xFFffffff).withOpacity(0.3),
            appBar: AppBar(),
            body: SafeArea(
                child: Form(
              key: _formKey,
              child: Center(
                  child: Column(children: [
                const SizedBox(height: 35),
                Text(
                  'User Settings',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 30 : 48),
                ),
                const SizedBox(height: 17),
                const Text(
                  'Account',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                ),
                const SizedBox(height: 17),
                const SizedBox(height: 35),
                Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: ResponsiveWidget.isSmallScreen(context) ||
                          ResponsiveWidget.isMediumScreen(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                        'First Name',
                        'Enter your first name',
                        Icons.person_rounded,
                        firstNameController,
                        true,
                        (name) => validators(
                            name,
                            RegExp(
                                r'^[a-zA-Z]+(?:-[a-zA-Z]+)*(?: [a-zA-Z]+(?:-[a-zA-Z]+)*)*$'),
                            'First name cannot have numbers'),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                        'Last Name',
                        'Enter your last name',
                        Icons.person_rounded,
                        lastNameController,
                        true,
                        (name) => validators(
                            name,
                            RegExp(
                                r'^[a-zA-Z]+(?:-[a-zA-Z]+)*(?: [a-zA-Z]+(?:-[a-zA-Z]+)*)*$'),
                            'Last name cannot have numbers'),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                          'Password',
                          'Enter your password',
                          Icons.password,
                          passwordController,
                          true,
                          (password) => PasswordValidator(
                              password,
                              RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                              "Enter a valid password: \n At least - 1 uppercase, 1 lowercase, 1 number, 1 special character\n At least 8 characters long")), //IMPORTANT: Password allows for length 0 but should be matched with regex >0
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                          'University',
                          '',
                          Icons.school,
                          uniController,
                          false,
                          null), 
                    ),

                const SizedBox(height: 17.5),
                const Text(
                  'Personal Information',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                ),
                const SizedBox(height: 17),
                const SizedBox(height: 35),
                Flex(
                  direction: ResponsiveWidget.isSmallScreen(context) ||
                          ResponsiveWidget.isMediumScreen(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextFormField(
                          'Email Address',
                          'Enter your email',
                          Icons.email,
                          emailController,
                          true,
                          (email) => (validators(
                              email,
                              RegExp(
                                  "[_a-zA-Z]+[_a-zA-Z0-9]?[\._]?[_a-zA-Z0-9]*@([a-zA-Z]+\.)?([a-zA-Z]+\.)?[a-zA-Z]+\.(com|net|de|uk|ro|jp)"),
                              "Enter a valid email address (Ex: shak@gmail.com)"))),
                    ),

                    const SizedBox(
                      width: 50,
                    ),

            
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () async {
                          await Future.delayed(const Duration(seconds: 1));
                          if (_formKey.currentState!.validate()) {
                            print("Valid form");
                            _formKey.currentState!.save();

                            try {
                              String fName = firstNameController.text;
                              String lName = lastNameController.text;
                              String email = emailController.text;
                              String passwordInput = passwordController.text;

                              User update_user = User(
                                  id: userProvider.collection[0].id,
                                  email: email,
                                  userType: userProvider.collection[0].userType,
                                  date_joined:
                                      userProvider.collection[0].date_joined,
                                      password: passwordInput);
                              People update_person = People(
                                  id: peopleProvider.collection[0].id,
                                  user: peopleProvider.collection[0].user,
                                  university:
                                      peopleProvider.collection[0].university,
                                  first_name: fName,
                                  last_name: lName,
                                  field_of_study: peopleProvider
                                      .collection[0].field_of_study);

                              peopleProvider.updateCollection(update_person);
                              userProvider.updateCollection(update_user);

                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Details saved!'),
                                  content: const Text(
                                      'User settings have been modified.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => {
                                        emailController.text = update_user.email,
                                        passwordController.text = update_user.password,
                                        firstNameController.text = update_person.first_name,
                                        lastNameController.text = update_person.last_name,
                                        Navigator.pop(context, 'OK'),
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } catch (error) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Whoops!'),
                                  content: Text(
                                      'Something went wrong. Please try again!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => {
                                        Navigator.pop(context, 'OK'),
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Update Details'),
                      ),
                    ],
                  ),
                )
              ])),
            )),
          );
        });
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
        floatingLabelStyle: const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }
}



String? validators(String? value, RegExp regex, String returnMessage) {
  if (value == null || value.length == 0) {
    return 'Cannot be blank';
  } else if (!regex.hasMatch(value)) {
    return returnMessage;
  }
  return null;
}

String? PasswordValidator(String? value, RegExp regex, String returnMessage) {
  if (value == null || value.length == 0) {
    return null;
  } else if (!regex.hasMatch(value)) {
    return returnMessage;
  }
  return null;
}
