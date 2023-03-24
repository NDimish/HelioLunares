import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/sign_up/society/society_sign_up.dart';
import 'package:university_ticketing_system/authentication/sign_up/student/student_sign_up.dart';
import 'package:university_ticketing_system/home/homepage.dart';
import 'package:university_ticketing_system/home/homepage_screens/about_the_app/about_app.dart';
import 'package:university_ticketing_system/home/homepage_screens/contact/contact.dart';
import 'package:university_ticketing_system/home/homepage_screens/discover/discover_screen.dart';

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the navbar but for smaller screens, such as mobile apps.
///
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
            key: const Key("HomeDraw"),
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
            key: const Key("AboutDraw"),
            title: const Text(
              'About',
              style: TextStyle(fontFamily: "Arvo"),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const HowToUseSection()),
              );
            },
          ),
          ListTile(
            key: const Key("DiscoverDraw"),
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
            key: const Key("ContactDraw"),
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
            key: const Key("LoginDraw"),
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
            key: const Key("SocDraw"),
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
            key: const Key("StuDraw"),
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
