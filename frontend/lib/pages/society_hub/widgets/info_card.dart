import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/style.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color topColor;
  final bool isActive;
  final VoidCallback onTap;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.topColor,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Container(
        height: 136,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: MyColours.panelBackgroundColour,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 6),
                  color: MyColours.subpanelBackgroundColour.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                color: topColor ?? MyColours.active,
                height: 5,
              ))
            ],
          ),
          Expanded(
            child: Container(),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "$title\n",
                    style: GoogleFonts.spaceMono(
                        fontSize: 20, color: MyColours.textColourDark)),
                TextSpan(
                    text: "$value\n",
                    style: GoogleFonts.spaceMono(
                        fontSize: 18, color: MyColours.textColourLight)),
              ])),
          Expanded(
            child: Container(),
          ),
        ]),
      ),
    ));
  }
}
