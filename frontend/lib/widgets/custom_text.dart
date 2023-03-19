import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? colour;
  final FontWeight? weight;
  final TextAlign? align;

  const CustomText(
      {Key? key,
      required this.text,
      this.size,
      this.colour,
      this.weight,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align ?? TextAlign.left,
        style: TextStyle(
            fontFamily: "Arvo",
            fontSize: size ?? 16,
            color: colour ?? MyColours.textColourDark,
            fontWeight: weight ?? FontWeight.normal));
  }
}
