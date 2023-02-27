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
      child: Column(
        children: [
          // Obx(

          //   () => Row(

          //     children: [
          //       Container(
          //           margin: EdgeInsets.only(
          //               top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
          //           child: CustomText(
          //             text: menuController.activeItem.value,
          //             size: 24,
          //             weight: FontWeight.bold,
          //           )),
          //     ],
          //   ),
          // ),
          Flexible(
              child: ListView(
            children: [SocietyEventCards()],
          ))
        ],
      ),
    );
  }
}
