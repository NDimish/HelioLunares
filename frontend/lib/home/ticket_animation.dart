import 'package:flutter/material.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:animated_background/animated_background.dart';

/// IMPLEMENTED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the ticket animation of the app.
///
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // Particles
  final Image _image = Image.asset('assets/images/coupon.png');
  late int pCount = 0;

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

    return AnimatedBackground(
      behaviour: _behaviour = _buildBehaviour(),
      vsync: this,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                //Remember that a column was used before single child scroll
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  ResponsiveWidget.isSmallScreen(context)
                      ? smallTitle(context)
                      : cardTitle(context)
                ]))),
      ),
    );
  }

  Column smallTitle(BuildContext context) {
    return Column(
      key: const Key("HomepageCol"),
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
        key: const Key("HomepageCard"),
        color: Colors.white.withOpacity(0.4),
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("University Ticketing System",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.5,
                  style: TextStyle(
                      fontFamily: "Arvo",
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 13 : 20)),
              const SizedBox(height: 5),
              Text("--- Join the events you love! ---",
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
}

enum ParticleType {
  Image,
}
