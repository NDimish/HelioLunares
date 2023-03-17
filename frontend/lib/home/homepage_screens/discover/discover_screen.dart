import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/homepage_screens/discover/discover_card.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'Meet the developers',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Arvo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: const TopBarContents(),
              ),
        drawer: const HomeScreenDrawer(),
        body: CustomLinearGradient(
            child: ResponsiveWidget.isSmallScreen(context)
                ? smallDiscoverBody(context)
                : largeDiscoverBody(context)));
  }

  Padding largeDiscoverBody(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/web-programming.png',
              height: 90,
              fit: BoxFit.cover,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text("Our Team",
                textScaleFactor: 2.5,
                style:
                    TextStyle(fontFamily: "Arvo", fontWeight: FontWeight.bold)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            const Text(
              "----- Completely open-source, by students, for students. ----- ",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Arvo", color: Colors.black),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text(
              "The upcoming platform for society ticket management, WITHOUT the nasty fees.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Arvo", color: Colors.black),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Expanded(
              child: GridView.count(
                crossAxisCount: !ResponsiveWidget.isSmallScreen(context) &&
                        screenSize.width <= 1000
                    ? 3
                    : !ResponsiveWidget.isSmallScreen(context) &&
                            screenSize.width <= 1500
                        ? 4
                        : 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: const <Widget>[
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/32419965?v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/58425365?v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/62480903?v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/114866867?v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/115050058?v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/101655182?v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                  AboutCard(
                    devName: "Josh Susak",
                    roles: ["Front-end dev", "Back-end dev", "Full-stack dev"],
                    imagePath:
                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                    githubLink: "https://github.com/JSusak",
                    secondaryIcon: Icons.web,
                    secondaryLink: "https://jsusak.github.io/",
                    cardSize: 200,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Column smallDiscoverBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 15),
        Image.asset(
          'assets/images/web-programming.png',
          height: ResponsiveWidget.isSmallScreen(context) ? 70 : 90,
          fit: BoxFit.cover,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const Text("Our Team",
            textScaleFactor: 2.5,
            style: TextStyle(fontFamily: "Arvo", fontWeight: FontWeight.bold)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        const Text(
          "----- Completely open-source, by students, for students. ----- ",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "Arvo", color: Colors.black),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const Text(
          "The upcoming platform for society ticket management, WITHOUT the nasty fees.",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "Arvo", color: Colors.black),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        Expanded(
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                  "https://avatars.githubusercontent.com/u/32419965?v=4"),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: const <Widget>[
                                Text("Text 1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: "Arvo")),
                                Text("Text 2",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: "Arvo")),
                                Text("Text 3",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10, fontFamily: "Arvo"))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
              }),
        )
      ],
    );
  }
}
