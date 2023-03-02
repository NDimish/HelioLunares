import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Widget to display set of steps in a concise manner. Mainly used for the 'how to use' subpage, to show students and societies
//an overview on how to use the app.
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
    return Card(
      color: const Color(0xFF70587c).withOpacity(0.6),
      child: Column(children: [
        Text(
          "Step ${_stepIndex + 1}:",
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const Divider(
          color: Colors.white70,
        ),
        Text(
          widget.steps.elementAt(_stepIndex),
          style: const TextStyle(fontSize: 18, color: Colors.white54),
        ),
        SizedBox(
          width: 250,
          height: 250,
          child: (Image.network(
            widget.imagesToShow.elementAt(_stepIndex),
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: _stepIndex == 0
                    ? null
                    : () => setState(() {
                          _stepIndex--;
                        }),
                icon: const Icon(
                  FontAwesomeIcons.arrowLeft,
                )),
            IconButton(
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
          style: const TextStyle(color: Colors.white54),
        )
      ]),
    );
  }
}
