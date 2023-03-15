import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/sign_up/society/society_sign_up_form.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';

class SocietySignUp extends StatefulWidget {
  const SocietySignUp({super.key});

  @override
  State<SocietySignUp> createState() => _SocietySignUpState();
}

class _SocietySignUpState extends State<SocietySignUp> {
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
      body: const SocietySignUpForm(),
    );
  }
}
