import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    return Container(
      child: Center(
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
                              const Text("How to Use"),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                              !studentPage
                                  ? const Text("Student Guide")
                                  : const Text("Society Guide")
                            ],
                          )))))),
    );
  }
}
