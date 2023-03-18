import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/ticket_animation.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
/// DESIGNED BY JOSHUA SUZAK - K...
///
/// This is the home page of the application and is used to welcome the user.
///
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.white,
              title: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  'University Ticketing System',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Arvo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: const TopBarContents(),
            ),
      drawer: const HomeScreenDrawer(),
      body: CustomLinearGradient(child: const MyHomePage()),
    );
  }
}
