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

    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 700,
      child: Card(
        elevation: 0,
        color: Color(0xFFffd1da).withOpacity(0.55),
        child: Center(
            child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: Column(
                  children: [
                    Text(
                      "Who are we?",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
                    ),
                    Text(
                        "The upcoming platform for society ticket management, WITHOUT the nasty fees. Completely open-source. Made by students, for students. \n GIVE APPLICATION OBJECTIVES HERE, MENTION COMPETITORS..."),
                    Divider(),
                    Text(
                      "Our story",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
                    ),
                    Text("BACKSTORY of app, how we came to be as a team..."),
                    Divider(),
                    Text(
                      "Meet the devs",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
                    ),
                    Text(
                        "Interested in the team behind this substantial project? Check out our socials and portfolios for more details on our interests and specialties :D"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                    )
                  ],
                ))),
      ),
    ));
  }
}
