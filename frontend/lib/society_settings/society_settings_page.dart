import 'package:flutter/material.dart';

class SocietySettingsPage extends StatefulWidget {
  const SocietySettingsPage({super.key});

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
            controller: formController == null ? null : formController,
            validator: validation == null ? null : validation,
            decoration: customDecoration(headerName, name, nameIcon)));
  }

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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Icon(
          Icons.settings,
          size: 30,
        ),
      ),
      backgroundColor: const Color(0xFFf5f5f5),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Center(
            child: Column(children: [
          const SizedBox(height: 35),
          const Text(
            'Account',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 48),
          ),
          const SizedBox(height: 17),
          const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
          ),
          const SizedBox(height: 17),
          Center(
            child: Container(
              child: const Text(
                'Student',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              margin: const EdgeInsets.all(10.0),
              color: Colors.green[600],
              height: 24.0,
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextFormField(
                  'Society Name', 'Enter your societiy name', Icons.house, null,
                  (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your society name.";
                }
                return null;
              }),
              const SizedBox(
                width: 50,
              ),
              customTextFormField(
                  'Last Name', 'Enter your last name', Icons.person, null,
                  (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password.";
                }
                return null;
              }),
              const SizedBox(
                width: 50,
              ),
              customTextFormField(
                  'Password', 'Enter your password', Icons.password, null,
                  (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password.";
                }
                return null;
              })
            ],
          ),
          const SizedBox(height: 35),
          const SizedBox(height: 35),
          const Text(
            'Personal Information',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
          ),
          const SizedBox(height: 17),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextFormField('Email Address', 'Enter your email',
                  Icons.email, emailController, (value) {
                if (value == null ||
                    value.isEmpty ||
                    !emailRegex.hasMatch(value)) {
                  return "Please enter a valid email.";
                }
                return null;
              }),

              const SizedBox(
                width: 50,
              ),
              customTextFormField('Phone Number', 'Enter your phone number',
                  Icons.phone, phoneController, (value) {
                if (value == null ||
                    value.isEmpty ||
                    !phoneRegex.hasMatch(value)) {
                  return "Please enter a valid phone number.";
                }
                return null;
              }),

              const SizedBox(
                width: 50,
              ),
              customTextFormField('University', 'Enter your university',
                  Icons.book, null, null), //query a database
            ],
          ),
          const SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print("Valid form");
                  }
                  ;

                  _formKey.currentState!.save();
                },
                child: const Text('Save'),
              ),
            ],
          )
        ])),
      )),
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
//loading the data in Nmani
//testing
//make page responsive
//try catch block submit database
