import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/pages/events/widgets/society_events.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/theme.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../../constants/style.dart';

class SocietyEventsPage extends StatelessWidget {
  const SocietyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top:
                              ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                      child: CustomText(
                        text: menuController.activeItem.value,
                        size: 28,
                        weight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 5 : 30,
            ),
            Flexible(
              child: ElevatedButton(
                  child: CustomText(
                    text: "Add Event",
                    size: 26,
                    colour: Colors.white,
                    weight: FontWeight.bold,
                  ),
                  onPressed: () {
                    navigationController.navigateTo(addEventPageDisplayName);
                  }),
            ),
            SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 5 : 10,
            ),
            MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Expanded(
                  flex: 14,
                  child: SocietyEventCards(),
                )),
            const SizedBox(height: 5),
          ],
        ));
  }
}
