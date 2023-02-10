import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StartupHero extends StatefulWidget {
  const StartupHero({super.key});

  @override
  State<StartupHero> createState() => _StartupHeroState();
}

class _StartupHeroState extends State<StartupHero> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const Text("hero section"),
      ]),
    );
  }
}
