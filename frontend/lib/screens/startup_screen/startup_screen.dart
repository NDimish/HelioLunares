import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_footer.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_navbar.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: const StartupNavbar(),
      body: SafeArea(
          child: Center(
              child: Column(children: [
        Flexible(child: const Text("HERO")),
        Flexible(child: const Text("ABOUT")),
        Flexible(child: const Text("HOW TO USE")),
        Flexible(child: const Text("CONTACT"))
      ]))),
      bottomNavigationBar: const Footer(),
    );
  }
}
