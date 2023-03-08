import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/howtouse_card.dart';

//'How to use' subpage - Contains helpful information for users and societies on
//the steps needed to proceed through the app.
class HowToUseSection extends StatefulWidget {
  const HowToUseSection({super.key});

  @override
  State<HowToUseSection> createState() => _HowToUseSectionState();
}

class _HowToUseSectionState extends State<HowToUseSection> {
  bool studentPage = false;
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: const Color(0xFFc8b8db),
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.white12,
      fixedSize: Size(300, 50));
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
        child: SizedBox(
            width: width / 2,
            height: 700,
            child: Card(
                elevation: 0,
                color: const Color(0xFF70587c).withOpacity(0.6),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            const Text(
                              "How to use",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 36,
                                  color: Colors.white),
                            ),
                            const Divider(color: Colors.white70),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: width / 6,
                                    height: width / 18,
                                    child: ElevatedButton(
                                        style: buttonStyle,
                                        onPressed: studentPage
                                            ? () => setState(() {
                                                  studentPage = false;
                                                })
                                            : null,
                                        child: Text(width > 920
                                            ? "For Students"
                                            : "...")),
                                  ),
                                  SizedBox(
                                    width: width / 6,
                                    height: width / 18,
                                    child: ElevatedButton(
                                        style: buttonStyle,
                                        onPressed: !studentPage
                                            ? () => setState(() {
                                                  studentPage = true;
                                                })
                                            : null,
                                        child: Text(width > 920
                                            ? "For Societies"
                                            : "...")),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  //Two different set of cards for both the student and societies.
                                  !studentPage
                                      ? const HowToUseCard(steps: [
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, tempor incididunt ut labore et dolore magna aliqua.",
                                          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
                                        ], imagesToShow: [
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                        ])
                                      : const HowToUseCard(steps: [
                                          "Lorfesefsfem ipsum dolor sit amet, consectetur adipiscing elit, tempor incididunt ut labore et dolore magna aliqua.",
                                          "Ut enwdaadim ad minim venia xercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
                                        ], imagesToShow: [
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
                                        ])
                                ],
                              ),
                            )
                          ],
                        ))))));
  }
}
