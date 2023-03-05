import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? colour;
  final FontWeight? weight;

  const CustomText(
      {Key? key, required this.text, this.size, this.colour, this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size ?? 16,
            color: colour ?? MyColours.textColourDark,
            fontWeight: weight ?? FontWeight.normal));
  }
}
