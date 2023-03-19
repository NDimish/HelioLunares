import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_text.dart';

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
        //height: 400,
        // alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            color: MyColours.panelBackgroundColour,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: MyColours.subpanelBackgroundColour.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          Expanded(
              child: Column(children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  color: topColor,
                  height: 5,
                ))
              ],
            ),
            Column(children: [
              Row(children: [
                Expanded(
                    child: CustomText(
                        size: 20,
                        weight: FontWeight.bold,
                        align: TextAlign.center,
                        text: title))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      CustomText(
                          size: 18,
                          weight: FontWeight.normal,
                          align: TextAlign.center,
                          text: value)
                    ]))
              ])
            ]),
          ]))
        ]),
      ),
    ));
  }
}
