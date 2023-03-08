import 'dart:ui';
import 'package:flutter/material.dart';

//Create a hero card - Containing a main image, overview of an app feature alongside any optional widgets to put
//in the card.
class HeroCard extends StatefulWidget {
  final String headerName;
  final String feature;
  final String imageLink;
  List<Widget>? widgets;

  HeroCard(
      {Key? key,
      required this.headerName,
      required this.feature,
      required this.imageLink,
      this.widgets})
      : super(key: key);

  @override
  State<HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return MouseRegion(
        onEnter: (event) => setState(() {
              isHover = true;
            }),
        onExit: (event) => setState(() {
              isHover = false;
            }),
        child: SizedBox(
            width: width / 2,
            height: width / 3.6,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  image: (DecorationImage(
                      image: NetworkImage(widget.imageLink),
                      fit: BoxFit.cover))),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: isHover
                    ? ClipRRect(
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Card(
                              elevation: 2,
                              color: const Color(0xFF70587c).withOpacity(0.3),
                              child: Center(
                                  child: Column(
                                children: [
                                  const Divider(),
                                  Text(
                                    widget.headerName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                  const Divider(),
                                  Text(widget.feature),
                                  Column(
                                    children:
                                        widget.widgets ?? [const Divider()],
                                  )
                                ],
                              )),
                            )))
                    : null,
              ),
            )));
  }
}
