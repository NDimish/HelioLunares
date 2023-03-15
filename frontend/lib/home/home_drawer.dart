import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/sign_up/choose_sign_up_screen.dart';
import 'package:university_ticketing_system/authentication/sign_up/society/society_sign_up.dart';
import 'package:university_ticketing_system/authentication/sign_up/student/student_sign_up.dart';
import 'package:university_ticketing_system/home/homepage.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              '- Options -',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: "Arvo"),
            ),
          ),
          ListTile(
            title: const Text(
              'Discover',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              'Contact Us',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => tw()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Log In',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LogInScreen()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Sign Up As A Society',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SocietySignUp()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Sign Up As A Student',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const StudentSignUp()),
              );
            },
          ),
        ],
      ),
    );
  }
}
