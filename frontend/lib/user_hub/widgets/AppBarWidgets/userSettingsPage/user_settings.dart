import 'package:flutter/material.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  Widget customTextFormField(
      String headerName, String name, IconData nameIcon) {
    return SizedBox(
        width: 300,
        child: TextFormField(
            decoration: customDecoration(headerName, name, nameIcon)));
  }

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
            width: 50.0,
            height: 24.0,
          ),
        ),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextFormField(
                'First Name', 'Enter your first name', Icons.person),
            const SizedBox(
              width: 50,
            ),
            customTextFormField(
                'Last Name', 'Enter your last name', Icons.person),
            const SizedBox(
              width: 50,
            ),
            customTextFormField(
                'Password', 'Enter your password', Icons.password)
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
            customTextFormField(
                'Email Address', 'Enter your email', Icons.email),
            const SizedBox(
              width: 50,
            ),
            customTextFormField(
                'Phone Number', 'Enter your phone number', Icons.phone),
            const SizedBox(
              width: 50,
            ),
            customTextFormField(
                'University', 'Enter your university', Icons.book),
          ],
        ),
        const SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {},
              child: const Text('Save'),
            ),
          ],
        )
      ]))),
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
