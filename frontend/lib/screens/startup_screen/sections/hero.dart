import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/3d_model.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/social_icons.dart';

class StartupHero extends StatefulWidget {
  const StartupHero({super.key});

  @override
  State<StartupHero> createState() => _StartupHeroState();
}

class _StartupHeroState extends State<StartupHero> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        "The Ultimate ticketing system.",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 60),
      ),
      const Text(
        "Unlock stress-free, seamlessly integrated event management with [INSERT NAME HERE], the innovative solution designed by students, for students.",
      ),
      const Text("\u2022 Completely open-source and FREE TO SET UP"),
      const Text("\u2022 Minimal fees"),
      const GlbModel(),
      Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
              onPressed: () => print("press"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("Get started", textScaleFactor: 1.3)),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
              onPressed: () => print("press"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("Learn more", textScaleFactor: 1.3)),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          SocialIcon(
            icon: Icon(Icons.play_arrow_sharp),
            url: "https://www.google.com/",
          ),
          SocialIcon(
            icon: Icon(
              Icons.apple,
            ),
            url: "https://www.apple.com/",
          ),
        ],
      ),
    ]);
  }
}
