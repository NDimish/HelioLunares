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
  int stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(
          "Step ${stepIndex + 1}:",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const Divider(),
        Text(
          widget.steps.elementAt(stepIndex),
          style: const TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 250,
          height: 250,
          child: Image.network(widget.imagesToShow.elementAt(stepIndex)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: stepIndex == 0
                    ? null
                    : () => setState(() {
                          stepIndex--;
                        }),
                icon: const Icon(FontAwesomeIcons.arrowLeft)),
            IconButton(
                onPressed: stepIndex == widget.steps.length - 1
                    ? null
                    : () => setState(() {
                          stepIndex++;
                        }),
                icon: const Icon(FontAwesomeIcons.arrowRight))
          ],
        ),
        Text("${stepIndex + 1} / ${widget.steps.length}")
      ]),
    );
  }
}
