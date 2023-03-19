import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';

class CircleIcon extends StatelessWidget {
  final Icon icon;
  final double? radius;
  final Color? backgroundColor;

  const CircleIcon(
      {Key? key, required this.icon, this.radius, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor:
            backgroundColor ?? MyColours.navButtonColour.withOpacity(0.5),
        radius: radius ?? 20,
        child: icon);
  }
}
