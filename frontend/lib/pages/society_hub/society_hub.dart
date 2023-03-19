import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/circular_card.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_small.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_medium.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_large.dart';

import 'package:university_ticketing_system/widgets/custom_text.dart';

class SocietyHubPage extends StatelessWidget {
  const SocietyHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              const CircularCard(),
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  const SocietyHubCardsMedium()
                else
                  const SocietyHubCardsLarge()
              else
                SocietyHubCardsSmall(),
            ],
          ))
        ],
      ),
    );
  }
}
