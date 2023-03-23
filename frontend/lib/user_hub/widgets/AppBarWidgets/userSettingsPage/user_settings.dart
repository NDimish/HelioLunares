import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/globals.dart';
import 'package:university_ticketing_system/tff_decoration.dart';
import '../../../../backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../helpers/responsiveness.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  String? uniValue;

  //Shakeeb send this over to the backend.
  int? universityId;

  List<String> uniNames = [];
  Map<String, int> uniMap = {};

  late Future<List<dynamic>> returnedUniversitiesFromEndPoint;
  Future<List<dynamic>> getUniversities() async {
    final response =
        await http.get(Uri.parse("${global.DATASOURCE}university/"));
    final List<dynamic> data = json.decode(response.body);
    return data;
  }

  @override
  void initState() {
    super.initState();
    returnedUniversitiesFromEndPoint =
        getUniversities().then((List<dynamic> result) {
      setState(() {
        uniNames = result.map((e) => e['name'].toString()).toList();
        result.forEach((value) => uniMap[value['name']] = value['id']);

        uniNames.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
      });
      return uniNames;
    });
  }

  Widget customTextFormField(
    String headerName,
    String name,
    IconData nameIcon,
    TextEditingController? formController,
    String? Function(String?)? validation,
  ) {
    String headerName,
    String name,
    IconData nameIcon,
    TextEditingController? formController,
    String? Function(String?)? validation,
  ) {
    return SizedBox(
        width: 300,
        child: TextFormField(
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
    return ChangeNotifierProvider(
        create: (context) =>
            dataCollector<User>(ID: global.localdataobj.getUserID()),
        builder: (context, child) {
          final User1 = Provider.of<dataCollector<User>>(context);
          emailController.text = User1.collection[0].email;
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
                          'Last Name',
                          'Enter your last name',
                          Icons.person_rounded,
                          lastNameController,
                          null),
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
                          (password) => validators(
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
                //Israfeel, add university dropdown.
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FutureBuilder<List<dynamic>>(
                      future: returnedUniversitiesFromEndPoint,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            width: ResponsiveWidget.isSmallScreen(context)
                                ? MediaQuery.of(context).size.width * 0.85
                                : MediaQuery.of(context).size.width * 0.60,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Select a university";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                      fontFamily: "Arvo", color: Colors.black),
                                  decoration: customDecorationForDropDown(
                                      "University", "Select your university"),
                                  isExpanded: true,
                                  hint: const Text('Select any category',
                                      style: TextStyle(
                                          fontSize: 15, fontFamily: "Arvo")),
                                  items: List<DropdownMenuItem>.generate(
                                      uniNames.length, (int index) {
                                    return DropdownMenuItem(
                                        value: uniNames[index],
                                        child: Text(
                                          uniNames[index].toString(),
                                          style: const TextStyle(
                                              fontFamily: 'Arvo', fontSize: 16),
                                        ));
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      print(val);
                                      uniValue = val.toString();
                                      universityId = uniMap[uniValue]!;
                                    });
                                  }),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          //return Text('${snapshot.error}');
                          return const AlertDialog(
                            content: Text("Error occured"),
                            elevation: 10,
                          );
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      }),
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
                          (email) => (validators(
                              email,
                              RegExp(
                                  "[_a-zA-Z]+[_a-zA-Z0-9]?[\._]?[_a-zA-Z0-9]*@([a-zA-Z]+\.)?([a-zA-Z]+\.)?[a-zA-Z]+\.(com|net|de|uk|ro|jp)"),
                              "Enter a valid email address (Ex: shak@gmail.com)"))),
                    ),

                    const SizedBox(
                      width: 50,
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

//Add if stataemetns to determine if studnet or not
//loading the data
//loading the data
//testing - improve code coverage

//try catch block submit database

String? validators(String? value, RegExp regex, String returnMessage) {
  if (value == null || value.length == 0) {
    return null;
  } else if (!regex.hasMatch(value)) {
  } else if (!regex.hasMatch(value)) {
    return returnMessage;
  }
  return null;
}
