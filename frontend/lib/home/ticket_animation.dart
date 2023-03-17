import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/homepage.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:university_ticketing_system/theme.dart';

import 'dart:math' as math;

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // Particles
  final Image _image = Image.asset('assets/images/coupon.png');
  late int pCount = 0;

  // ParticleOptions particleOptions = ParticleOptions(
  //   image: Image.asset('assets/images/coupon.png'),
  //   baseColor: Colors.blue,
  //   spawnOpacity: 0.1,
  //   opacityChangeRate: 0.3,
  //   minOpacity: 0.05,
  //   maxOpacity: 0.7,
  //   spawnMinSpeed: 30.0,
  //   spawnMaxSpeed: 70.0,
  //   spawnMinRadius: 2.0,
  //   spawnMaxRadius: 7.0,
  //   particleCount: pCount,
  // );

  var particlePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  // General Variables
  int _behaviourIndex = 0;
  Behaviour? _behaviour;

  @override
  Widget build(BuildContext context) {
    ParticleOptions particleOptions = ParticleOptions(
      image: Image.asset('assets/images/coupon.png'),
      baseColor: Colors.blue,
      spawnOpacity: 0.1,
      opacityChangeRate: 0.3,
      minOpacity: 0.05,
      maxOpacity: 0.7,
      spawnMinSpeed: 30.0,
      spawnMaxSpeed: 70.0,
      spawnMinRadius: 2.0,
      spawnMaxRadius: 7.0,
      particleCount: ResponsiveWidget.isSmallScreen(context) ? 15 : 60,
    );

    Behaviour _buildBehaviour() {
      switch (_behaviourIndex) {
        case 0:
          return RandomParticleBehaviour(
            options: particleOptions,
            paint: particlePaint,
          );
      }

      return RandomParticleBehaviour(
        options: particleOptions,
        paint: particlePaint,
      );
    }

    return Scaffold(
        body: CustomLinearGradient(
      child: AnimatedBackground(
        behaviour: _behaviour = _buildBehaviour(),
        vsync: this,
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResponsiveWidget.isSmallScreen(context)
                        ? smallTitle(context)
                        : cardTitle(context)
                  ],
                ),
              )),
        ),
      ),
    ));
  }

  Column smallTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Society Event Finder",
            textAlign: TextAlign.center,
            textScaleFactor: 2.5,
            style: TextStyle(
                fontFamily: "Arvo",
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 13 : 20)),
        const SizedBox(height: 5),
        Text("--- Find Uni Events Across The U.K ---",
            textAlign: TextAlign.center,
            textScaleFactor: 1.3,
            style: TextStyle(
                fontFamily: "Arvo",
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 9 : 13)),
      ],
    );
  }

  Card cardTitle(BuildContext context) {
    return Card(
        color: Colors.white.withOpacity(0.4),
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Society Event Finder",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.5,
                  style: TextStyle(
                      fontFamily: "Arvo",
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 13 : 20)),
              const SizedBox(height: 5),
              Text("--- Find Uni Events Across The U.K ---",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      fontFamily: "Arvo",
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 9 : 13)),
            ],
          ),
        ));
  }

  // Behaviour _buildBehaviour() {
  //   switch (_behaviourIndex) {
  //     case 0:
  //       return RandomParticleBehaviour(
  //         options: particleOptions,
  //         paint: particlePaint,
  //       );
  //   }

  //   return RandomParticleBehaviour(
  //     options: particleOptions,
  //     paint: particlePaint,
  //   );
  // }
}

enum ParticleType {
  Image,
}
