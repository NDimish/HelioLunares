import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/social_icons.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_footer.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 245, 1),
      appBar: const StartupNavbar(),
      body: SafeArea(
          child: Center(
              child: Column(children: [
        Flexible(child: Text("HERO")),
        Row(
          children: const [
            SocialIcon(
              icon: Icon(Icons.play_arrow_sharp),
            ),
            SocialIcon(
              icon: Icon(
                Icons.apple,
              ),
            ),
          ],
        ),
        Flexible(child: Text("ABOUT")),
        Flexible(child: Text("HOW TO USE (Will be on separate page)")),
        Flexible(child: Text("CONTACT (Will be on separate page)"))
      ]))),
      bottomNavigationBar: const Footer(),
    );
  }
}
