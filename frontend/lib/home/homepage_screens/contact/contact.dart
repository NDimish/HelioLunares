import 'package:flutter/material.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/homepage_screens/contact/contact_form.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'University Ticketing System',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Arvo',
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: const TopBarContents(),
            ),
      drawer: const HomeScreenDrawer(),
      body: ContactForm(),
    );
  }
}
