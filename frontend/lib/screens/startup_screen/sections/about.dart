import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/about_card.dart';

//'About' subpage - Mainly just bundles of Text, to give a brief overview of
//the app and history of the subteam. Also contains links to our GitHubs and
//a miscellaneous website of our choosing.
class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    //Who we are

    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 850,
      child: Card(
        elevation: 0,
        color: const Color(0xFF70587c).withOpacity(0.6),
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 15, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Who are we?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 60,
                          color: Colors.white),
                    ),
                    const Divider(
                      color: Colors.white60,
                    ),
                    const Text(
                      " • The upcoming platform for society ticket management, WITHOUT the nasty fees. Completely open-source, by students, for students. \n • The all-in-one solution for societies who want to avoid the drawbacks of our competitors...",
                      style: TextStyle(color: Colors.white54),
                    ),
                    const Divider(
                      color: Colors.white60,
                    ),
                    const Text(
                      "Our story",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 36,
                          color: Colors.white),
                    ),
                    const Divider(
                      color: Colors.white60,
                    ),
                    const Text(
                      " • [INSERT APP NAME HERE] is currently being developed by a group of innovative, like-minded students at King's College London, who seek to revolutionise the ticketing world.\n • We have all agreed that many similar apps provide a higher level of stress and complication, so we chose to embark on this project as a way of streamlining the workflow of society event management.",
                      style: TextStyle(color: Colors.white54),
                    ),
                    const Divider(
                      color: Colors.white60,
                    ),
                    MediaQuery.of(context).size.width > 920
                        ? const Text(
                            "Meet the devs",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 36,
                                color: Colors.white),
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                    FittedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        AboutCard(
                          devName: "Josh Susak",
                          roles: [
                            "Front-end dev",
                            "Back-end dev",
                            "Full-stack dev"
                          ],
                          imagePath:
                              "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                          githubLink: "https://github.com/JSusak",
                          secondaryIcon: Icons.web,
                          secondaryLink: "https://jsusak.github.io/",
                          cardSize: 185,
                        ),
                        AboutCard(
                          devName: "Josh Susak",
                          roles: [
                            "Front-end dev",
                            "Back-end dev",
                            "Full-stack dev"
                          ],
                          imagePath:
                              "https://avatars.githubusercontent.com/u/32419965?v=4",
                          githubLink: "https://github.com/JSusak",
                          secondaryIcon: Icons.web,
                          secondaryLink: "https://jsusak.github.io/",
                          cardSize: 185,
                        ),
                        AboutCard(
                          devName: "Josh Susak",
                          roles: [
                            "Front-end dev",
                            "Back-end dev",
                            "Full-stack dev"
                          ],
                          imagePath:
                              "https://avatars.githubusercontent.com/u/58425365?v=4",
                          githubLink: "https://github.com/JSusak",
                          secondaryIcon: Icons.web,
                          secondaryLink: "https://jsusak.github.io/",
                          cardSize: 185,
                        ),
                        AboutCard(
                          devName: "Josh Susak",
                          roles: [
                            "Front-end dev",
                            "Back-end dev",
                            "Full-stack dev"
                          ],
                          imagePath:
                              "https://avatars.githubusercontent.com/u/62480903?v=4",
                          githubLink: "https://github.com/JSusak",
                          secondaryIcon: Icons.web,
                          secondaryLink: "https://jsusak.github.io/",
                          cardSize: 185,
                        ),
                      ],
                    )),
                    FittedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        AboutCard(
                          devName: "Josh Susak",
                          roles: [
                            "Front-end dev",
                            "Back-end dev",
                            "Full-stack dev"
                          ],
                          imagePath:
                              "https://avatars.githubusercontent.com/u/114866867?v=4",
                          githubLink: "https://github.com/JSusak",
                          secondaryIcon: Icons.web,
                          secondaryLink: "https://jsusak.github.io/",
                          cardSize: 185,
                        ),
                        AboutCard(
                          devName: "Josh Susak",
                          roles: [
                            "Front-end dev",
                            "Back-end dev",
                            "Full-stack dev"
                          ],
                          imagePath:
                              "https://avatars.githubusercontent.com/u/115050058?v=4",
                          githubLink: "https://github.com/JSusak",
                          secondaryIcon: Icons.web,
                          secondaryLink: "https://jsusak.github.io/",
                          cardSize: 185,
                        ),
                        AboutCard(
                          devName: "Josh Susak",
                          roles: [
                            "Front-end dev",
                            "Back-end dev",
                            "Full-stack dev"
                          ],
                          imagePath:
                              "https://avatars.githubusercontent.com/u/101655182?v=4",
                          githubLink: "https://github.com/JSusak",
                          secondaryIcon: Icons.web,
                          secondaryLink: "https://jsusak.github.io/",
                          cardSize: 185,
                        ),
                        AboutCard(
                          devName: "Josh Susak",
                          roles: [
                            "Front-end dev",
                            "Back-end dev",
                            "Full-stack dev"
                          ],
                          imagePath:
                              "https://avatars.githubusercontent.com/u/114754624?v=4",
                          githubLink: "https://github.com/JSusak",
                          secondaryIcon: Icons.web,
                          secondaryLink: "https://jsusak.github.io/",
                          cardSize: 185,
                        ),
                      ],
                    ))
                  ],
                ))),
      ),
    ));
  }
}
