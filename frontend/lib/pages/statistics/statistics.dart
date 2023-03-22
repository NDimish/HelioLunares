import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/pages/statistics/StatisticsPage.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: ResponsiveWidget.isSmallScreen(context) ? 24 : 40,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )),
        Expanded(
            child: (globals.localdataobj.getToken() != "")
                ? const Statistics()
                : const Text("Not Authenticated")),
      ],
    );
  }
}
