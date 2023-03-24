import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';
import '../../../backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/globals.dart' as global;


import '../helpers/responsiveness.dart';

import '../user_hub/widgets/AppBarWidgets/userSettingsPage/user_settings.dart';

class SocietySettingsPage extends StatefulWidget {
  //final int userId;

  const SocietySettingsPage({
    Key? key,
  }) : super(key: key);
  //required this.userId

  @override
  State<SocietySettingsPage> createState() => _SocietySettingsPageState();
}

class _SocietySettingsPageState extends State<SocietySettingsPage> {
  String? uniValue;

  Widget customTextFormField(
      String headerName,
      String name,
      IconData nameIcon,
      TextEditingController? formController,
      bool shouldBeEnabled,
      String? Function(String?)? validation) {
    return SizedBox(
        width: 300,
        child: TextFormField(
            enabled: shouldBeEnabled,
            obscureText: headerName.contains("Password") ? true : false,
            controller: formController,
            validator: validation,
            decoration: customDecoration(headerName, name, nameIcon)));
  }

//this is where you could query the database to get the permission. level 1 2 3

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final societyNameController = TextEditingController();
  

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
          ChangeNotifierProvider(
            create: (context) =>
                dataCollector<Society>(ID:Get.find<Society>().id ),
          ),
        ],
        builder: (context, child) {
          final userProvider = Provider.of<dataCollector<User>>(context);
          final peopleProvider = Provider.of<dataCollector<People>>(context);
          final societyProvider = Provider.of<dataCollector<Society>>(context);
          //Society societyInfo = Get.find<Society>();
          emailController.text = userProvider.collection[0].email;
          societyNameController.text = societyProvider.collection[0].name;
          uniController.text = societyProvider.collection[0].university.name;

          return Scaffold(
            backgroundColor: const Color(0xFFffffff).withOpacity(0.3),
            body: SafeArea(
                child: Form(
              key: _formKey,
              child: Center(
                  child: Column(children: [
                const SizedBox(height: 35),
                Text(
                  'Society Settings',
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
                        'Society Name',
                        'Enter your society name',
                        Icons.person_rounded,
                        societyNameController,
                        (userProvider.collection[0].userType == 3)
                            ? true
                            : false,
                            null,
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
                    )
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
                          null,
                    ),
                ),

                const SizedBox(height: 35),
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
                              "Enter a valid email address (Ex: shak@gmail.com)"))), //IMPORTANT: Email allows for length 0 (doesn't update) but should be matched with regex >0
                    ),
                    //(value) {
                    //if (value == null ||
                    //     value.isEmpty ||
                    //    !emailRegex.hasMatch(value)) {
                    //   return "Please enter a valid email.";
                    // }
                    //   return null;
                    //  }

                    const SizedBox(
                      width: 50,
                    ),

                    // (value) {
                    // if (value == null ||
                    ////      value.isEmpty ||
                    //    !phoneRegex.hasMatch(value)) {
                    //   return "Please enter a valid phone number.";
                    //  }
                    //   return null;
                    //  }

                    //query a database
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
                              
                              String socName = societyNameController.text;
                              String uniName = uniController.text;
                              String email = emailController.text;
                              String passwordInput = passwordController.text;
                              String socDescription =
                                  societyProvider.collection[0].description;

                              User update_user = User(
                                  id: userProvider.collection[0].id,
                                  email: email,
                                  userType: userProvider.collection[0].userType,
                                  date_joined:
                                      userProvider.collection[0].date_joined,
                                  password: passwordInput);
                                  
                              Society update_society = Society(
                                  id: societyProvider.collection[0].id,
                                  user: userProvider.collection[0],
                                  university:
                                      societyProvider.collection[0].university,
                                  name: socName,
                                  description: socDescription,
                                  created_at:
                                      societyProvider.collection[0].created_at,
                                  join_date:
                                      societyProvider.collection[0].join_date,
                                  image: societyProvider.collection[0].image);

                              societyProvider.updateCollection(update_society);
                              print(update_user.password);
                              print(passwordInput);
                              print('space');
                              userProvider.updateCollection(update_user);
                              //Here is where you will send a response to the database to update user values

                              //Upon saving you will have to check the fields which are empty.
                              //If they are all empty or nothing has changed don't update the DB at all.
                              //Otherwise check whatever is changed, and update DB accordingly.

                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Details saved!'),
                                  content: const Text(
                                      'Society settings have been modified.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => {
                                        societyNameController.text = update_society.name,
                                        Navigator.pop(context, 'OK'),

                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } catch (error) {
                              //This can be turned into a reusable widget?
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Whoops!'),
                                  content: const Text(
                                      'Something went wrong when changing society settings. Please try again.'),
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

//loading the data in Nmani
//testing
//try catch block submit database

//
