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
  final ButtonStyle buttonStyle =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 700,
            child: Card(
                elevation: 0,
                color: const Color(0xFF70587c).withOpacity(0.6),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 15),
                        child: Column(
                          children: [
                            const Text("How to Use"),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: buttonStyle,
                                    onPressed: studentPage
                                        ? () => setState(() {
                                              studentPage = false;
                                            })
                                        : null,
                                    child: const Text("For Students")),
                                ElevatedButton(
                                    style: buttonStyle,
                                    onPressed: !studentPage
                                        ? () => setState(() {
                                              studentPage = true;
                                            })
                                        : null,
                                    child: const Text("For Societies")),
                              ],
                            ),
                            const SizedBox(
                              height: 75,
                            ),
                            Column(
                              children: [
                                //Two different set of cards for both the student and societies.
                                studentPage
                                    ? const HowToUseCard(steps: [
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, tempor incididunt ut labore et dolore magna aliqua.",
                                        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
                                      ], imagesToShow: [
                                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                                      ])
                                    : const HowToUseCard(steps: [
                                        "Lorfesefsfem ipsum dolor sit amet, consectetur adipiscing elit, tempor incididunt ut labore et dolore magna aliqua.",
                                        "Ut enwdaadim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
                                      ], imagesToShow: [
                                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                                        "https://avatars.githubusercontent.com/u/77983856?s=400&u=aec10224ed714a03cbb82a2e98606a963804bc6f&v=4",
                                      ])
                              ],
                            )
                          ],
                        ))))));
  }
}
