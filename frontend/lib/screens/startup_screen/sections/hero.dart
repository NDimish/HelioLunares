import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/hero_card.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/widget_carousel.dart';

import '../../../helpers/responsiveness.dart';

//'Hero' subpage - First thing the user sees when they click on the app - Has
//eye-catching features, such as headlines, app features and CTA buttons.
class StartupHero extends StatefulWidget {
  const StartupHero({super.key});

  @override
  State<StartupHero> createState() => _StartupHeroState();
}

class _StartupHeroState extends State<StartupHero> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      SizedBox(
          width: width / 2,
          height: height / 1.2,
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF70587c).withOpacity(0.6),
                border: Border.all(
                  color: Colors.white,
                )),
            child: Center(
                child: Column(children: [
              Text(
                "The #1 ticketing system.",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ResponsiveWidget.isMediumScreen(context) ||
                            ResponsiveWidget.isSmallScreen(context)
                        ? 30
                        : 60,
                    color: Colors.white),
              ),
              const Text(
                "Experience stress-free, seamlessly integrated event management with [INSERT NAME HERE].",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const Text(
                "An upcoming, ground-breaking solution designed solely by students, for students.",
                style: TextStyle(fontSize: 16, color: Colors.white38),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => print("press"),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFFc8b8db),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text("Get started!", textScaleFactor: 1.3)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
              FittedBox(
                  child: (Card(
                      color: const Color(0xFFffd1da).withOpacity(0.55),
                      child: WidgetCarousel(transitionTime: 10, children: [
                        HeroCard(
                          headerName: "Test feature 1",
                          feature: "Explain feature here...",
                          imageLink:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                          key: const ValueKey(0),
                        ),
                        HeroCard(
                          headerName: "Test feature 2",
                          feature: "Explain feature here...",
                          imageLink:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                          widgets: [const Text("extra info...")],
                          key: const ValueKey(1),
                        ),
                      ])))),
            ])),
          )),
    ]));
  }
}
