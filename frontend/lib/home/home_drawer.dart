import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/sign_up/choose_sign_up_screen.dart';
import 'package:university_ticketing_system/authentication/sign_up/society/society_sign_up.dart';
import 'package:university_ticketing_system/authentication/sign_up/student/student_sign_up.dart';
import 'package:university_ticketing_system/home/homepage.dart';
import 'package:university_ticketing_system/home/homepage_screens/contact/contact.dart';
import 'package:university_ticketing_system/home/homepage_screens/discover/discover_screen.dart';

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
              '- Welcome -',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: "Arvo"),
            ),
          ),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'About',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Discover',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DiscoverScreen()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Contact Us',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ContactScreen()),
              );
            },
          ),
          const Divider(),
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
