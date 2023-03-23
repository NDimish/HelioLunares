import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/pages/events/event_list_maker.dart';
import 'package:university_ticketing_system/pages/events/widgets/society_events.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/theme.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../../backend_communication/models/Society.dart';
import '../../constants/style.dart';

class SocietyEventsPage extends StatelessWidget {
  final Society society = Get.find<Society>();
  SocietyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top:
                              ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                      child: CustomText(
                        size: ResponsiveWidget.isSmallScreen(context) ? 24 : 40,
                        text: menuController.activeItem.value,
                        weight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 5 : 30,
            ),
            Card(
                child: (Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              child: CustomText(
                                text: "Add Event",
                                size: 20,
                                colour: Colors.white,
                                weight: FontWeight.bold,
                              ),
                              onPressed: () {
                                navigationController
                                    .navigateTo(addEventPageDisplayName);
                              }),
                        ])))),
            SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 5 : 10,
            ),
            MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Expanded(
                  //flex: 14,
                  child: EventDataLoader(), //SocietyEventCards(),
                )),
            const SizedBox(height: 5),
          ],
        ));
  }
}
