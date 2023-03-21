import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_ticketing_system/responsive.dart';

/// DESIGNED BY JOSHUA SUZAK - K...
///
///  Widget to display set of steps in a concise manner.
///  Mainly used for the 'how to use' subpage, to show students and societies
///  an overview on how to use the app.
///
class HowToUseCard extends StatefulWidget {
  final List<String> steps;
  final List<String> imagesToShow;
  const HowToUseCard(
      {Key? key, required this.steps, required this.imagesToShow})
      : super(key: key);

  @override
  State<HowToUseCard> createState() => _HowToUseCardState();
}

class _HowToUseCardState extends State<HowToUseCard> {
  int _stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: Colors.white.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              "Step ${_stepIndex + 1}:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Arvo",
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 18 : 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const Divider(
              color: Colors.black,
            ),
            Text(
              widget.steps.elementAt(_stepIndex),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Arvo:",
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 13 : 20,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: width / 7.68,
              height: width / 7.68,
              child: (Image.network(
                widget.imagesToShow.elementAt(_stepIndex),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    key: const Key("htuLeft"),
                    onPressed: _stepIndex == 0
                        ? null
                        : () => setState(() {
                              _stepIndex--;
                            }),
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                    )),
                IconButton(
                    key: const Key("htuRight"),
                    onPressed: _stepIndex == widget.steps.length - 1
                        ? null
                        : () => setState(() {
                              _stepIndex++;
                            }),
                    icon: const Icon(
                      FontAwesomeIcons.arrowRight,
                    ))
              ],
            ),
            Text(
              "${_stepIndex + 1} / ${widget.steps.length}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: "Arvo", color: Colors.black),
            )
          ]),
        ),
      ),
    );
  }
}
