import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/pages/events/widgets/society_events.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../society_hub/widgets/circular_card.dart';

class SocietyEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(() => Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top:
                              ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                      child: CustomText(
                        text: menuController.activeItem.value,
                        size: 24,
                        weight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 5 : 30,
            ),
            MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Expanded(
                    child: ListView(
                  padding: EdgeInsets.all(1),
                  children: [SocietyEventCards()],
                )))
          ],
        ));
  }
}
