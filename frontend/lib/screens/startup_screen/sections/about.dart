import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/about_card.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    //Who we are

    return Column(children: [
      Card(
        child: Center(
            child: Column(
          children: [
            Text(
              "Who are we?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
            ),
            Text(
                "The upcoming platform for society ticket management, WITHOUT the nasty fees. Completely open-source. Made by students, for students."),
            Text(
              "Our story",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
            ),
            Text("..."),
            Text(
              "Meet the devs",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AboutCard(
                  devName: "Josh Susak",
                  roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                  imagePath:
                      "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                  githubLink: "https://github.com/JSusak",
                  secondaryIcon: Icons.web,
                  secondaryLink: "https://jsusak.github.io/",
                ),
              ],
            )
          ],
        )),
      )
    ]);
  }
}
