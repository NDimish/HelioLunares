import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';
import '../../../backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/globals.dart' as global;

import '../helpers/responsiveness.dart';

class SocietySettingsPage extends StatefulWidget {
  //final int userId;

  const SocietySettingsPage({Key? key, }): super(key:key);
  //required this.userId



  @override
  State<SocietySettingsPage> createState() => _SocietySettingsPageState();
}

class _SocietySettingsPageState extends State<SocietySettingsPage> {
  Widget customTextFormField(
      String headerName,
      String name,
      IconData nameIcon,
      TextEditingController? formController,
      String? Function(String?)? validation) {
    return SizedBox(
        width: 300,
        child: TextFormField(
            obscureText: headerName.contains("Password") ? true : false,
            controller: formController,
            validator: validation,
            decoration: customDecoration(headerName, name, nameIcon)));
  }

//this is where you could query the database to get the permission. level 1 2 3

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final uniController = TextEditingController();
  final passwordController = TextEditingController();
  final emailRegex = RegExp(
      "[_a-zA-Z]+[_a-zA-Z0-9]?[\._]?[_a-zA-Z0-9]*@([a-zA-Z]+\.)?([a-zA-Z]+\.)?[a-zA-Z]+\.(com|net|de|uk|ro|jp)");
  final phoneRegex = RegExp(
      "[_a-zA-Z]+[_a-zA-Z0-9]?[\._]?[_a-zA-Z0-9]*@([a-zA-Z]+\.)?([a-zA-Z]+\.)?[a-zA-Z]+\.(com|net|de|uk|ro|jp)");
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => dataCollector<User>(ID:global.localdataobj.getUserID()),
      builder: (context,child) {
        final User1 = Provider.of<dataCollector<User>>(context);
        return Scaffold(
          
          backgroundColor: const Color(0xFFffffff).withOpacity(0.3),
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
                    fontSize: ResponsiveWidget.isSmallScreen(context) ? 30 : 48),
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
                        null,
                        (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }

                    if (value.contains(RegExp(r'(\d+)'))) {
                      return "Name cannot have numbers";
                    }

                    return null;
                  },
                        
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
                        null,
                       (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }

                    if (value.contains(RegExp(r'(\d+)'))) {
                      return "Name cannot have numbers";
                    }}),

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
                        null,
                        null), //IMPORTANT: Password allows for length 0 but should be matched with regex >0
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              //Israfeel, can you implement university dropdown here from padding to padding?
              Padding( 
                padding: const EdgeInsets.all(15.0),
                child: const Text('University'),
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
                        null), //IMPORTANT: Email allows for length 0 (doesn't update) but should be matched with regex >0
                  ),


                  const SizedBox(
                    width: 50,
                  ),
                  

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
      }
    );
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

//Add if stataemetns to determine if studnet or not
//if statements lvl1 and lvl2 fields acccesible same as user hub
//loading the data in Nmani
//testing
//try catch block submit database
