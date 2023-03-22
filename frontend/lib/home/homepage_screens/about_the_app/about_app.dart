import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/homepage_screens/about_the_app/about_app_card.dart';
import 'package:university_ticketing_system/home/topbar.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:university_ticketing_system/submit_button.dart';

/// DESIGNED BY JOSHUA SUZAK - K...
///
///  How to use' subpage - Contains helpful information for users and societies on
///  the steps needed to proceed through the app.
///
class HowToUseSection extends StatefulWidget {
  const HowToUseSection({super.key});

  @override
  State<HowToUseSection> createState() => _HowToUseSectionState();
}

class _HowToUseSectionState extends State<HowToUseSection> {
  bool studentPage = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'University Ticketing System',
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
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                          const SizedBox(height: 15),
                          Card(
                              color: Colors.white.withOpacity(0.4),
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("How do you use this app?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ResponsiveWidget.isSmallScreen(
                                              context)
                                          ? 25
                                          : 32,
                                      fontFamily: 'Arvo',
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          SizedBox(
                              height: ResponsiveWidget.isSmallScreen(context)
                                  ? 15
                                  : 30),
                          Padding(
                            padding: ResponsiveWidget.isSmallScreen(context)
                                ? const EdgeInsets.all(10.0)
                                : const EdgeInsets.all(20.0),
                            child: Container(
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? screenSize.width * 0.9
                                  : screenSize.width * 0.7,
                              child: Card(
                                elevation: 0,
                                color: Colors.white.withOpacity(0.4),
                                child: Column(children: <Widget>[
                                  ResponsiveWidget.isSmallScreen(context)
                                      ? Column(children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SubmitButton(
                                                    onPressed: studentPage
                                                        ? () => setState(() {
                                                              studentPage =
                                                                  false;
                                                            })
                                                        : null,
                                                    scaleFactor: 0.8,
                                                    textIn: "Students"),
                                                const SizedBox(height: 10),
                                                SubmitButton(
                                                    onPressed: !studentPage
                                                        ? () => setState(() {
                                                              studentPage =
                                                                  true;
                                                            })
                                                        : null,
                                                    scaleFactor: 0.8,
                                                    textIn: "Societies")
                                              ],
                                            ),
                                          ),
                                        ])
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15,
                                                  left: 5.0,
                                                  right: 5.0,
                                                  bottom: 5.0),
                                              child: Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SubmitButton(
                                                      key: const Key(
                                                          "StuSubmit"),
                                                      onPressed: studentPage
                                                          ? () => setState(() {
                                                                studentPage =
                                                                    false;
                                                              })
                                                          : null,
                                                      scaleFactor: 0.31,
                                                      textIn: "Students"),
                                                  const SizedBox(width: 20),
                                                  SubmitButton(
                                                      key: const Key(
                                                          "SocSubmit"),
                                                      onPressed: !studentPage
                                                          ? () => setState(() {
                                                                studentPage =
                                                                    true;
                                                              })
                                                          : null,
                                                      scaleFactor: 0.31,
                                                      textIn: "Societies"),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        //Two different set of cards for both the student and societies.
                                        !studentPage
                                            ? const HowToUseCard(
                                                key: Key("Stuhtu"),
                                                steps: [
                                                    "Create an account with us, and browse thousands of society events from diffrent universities over the U.K",
                                                    "Search and filter through events to find the ones you want.",
                                                    "Book your tickets with us in a simple and hassle free way!"
                                                  ],
                                                imagesToShow: [
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                                  ])
                                            : const HowToUseCard(
                                                key: Key("Sochtu"),
                                                steps: [
                                                    "Create a society account with us, and set up events for your members.",
                                                    "Create events, that are accessible to students all over the U.K",
                                                    "Manage your committee members, and your society."
                                                  ],
                                                imagesToShow: [
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                                  ])
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          )
                        ]))))));
  }
}
