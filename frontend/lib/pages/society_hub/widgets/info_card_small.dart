import 'package:flutter/material.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../constants/style.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final VoidCallback onTap;

  const InfoCardSmall(
      {Key? key,
      required this.title,
      required this.value,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: MyColours.panelBackgroundColour,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: MyColours.subpanelBackgroundColour, width: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: CustomText(
                  text: title,
                  size: 24,
                  weight: FontWeight.w300,
                  colour: MyColours.textColourDark,
                )),
                Flexible(
                    child: CustomText(
                  text: value,
                  size: 24,
                  weight: FontWeight.bold,
                  colour: MyColours.textColourLight,
                ))
              ],
            )),
      ),
    );
  }
}
