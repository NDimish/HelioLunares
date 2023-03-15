import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/about.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/contact.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/hero.dart';
import 'package:university_ticketing_system/screens/startup_screen/sections/howtouse.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_footer.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_navbar.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  int index = 0;
  static const List<Widget> _subpages = <Widget>[
    StartupHero(),
    AboutSection(),
    HowToUseSection(),
    ContactSection()
  ];

  changeSubpage(i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 245, 1),
      appBar: StartupNavbar(
        callback: ((i) => changeSubpage(i)),
        selectedIndex: index,
      ),
      body: SafeArea(
          child: Center(
              //This is where to change the widgets/'pages'

              child: CustomLinearGradient(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _subpages.elementAt(index),
        ),
      ))),
      bottomNavigationBar: const Footer(),
    );
  }
}
