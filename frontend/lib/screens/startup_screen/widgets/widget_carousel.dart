import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class WidgetCarousel extends StatefulWidget {
  final List<Widget> children;
  final int transitionTime;

  const WidgetCarousel(
      {Key? key, required this.children, required this.transitionTime})
      : super(key: key);

  @override
  State<WidgetCarousel> createState() => _WidgetCarouselState();
}

class _WidgetCarouselState extends State<WidgetCarousel> {
  //At every interval given by transition time, fade to a new widget
  Timer? timer;
  int currentWidget = 0;
  final rand = Random();

  void resetTimer() {
    timer = Timer.periodic(Duration(seconds: widget.transitionTime), (timer) {
      currentWidget == widget.children.length - 1
          ? currentWidget = 0
          : currentWidget++;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: widget.children.elementAt(currentWidget),
    );
  }
}
