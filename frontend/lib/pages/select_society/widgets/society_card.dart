import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_text.dart';

class SocietyCard extends StatelessWidget {
  final String societyName;
  final String categoryName;
  final VoidCallback onTap;

  const SocietyCard({
    Key? key,
    required this.societyName,
    required this.categoryName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: MyColours.panelBackgroundColour.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8)),
          height: 120,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 3,
                        child: CustomText(
                          text: societyName,
                          size: 20,
                          weight: FontWeight.bold,
                        )),
                    Expanded(
                        child: CustomText(
                      text: categoryName,
                      size: 14,
                      weight: FontWeight.w300,
                      colour: MyColours.textColourDark,
                    ))
                  ],
                ))
              ])),
    ));
  }
}
