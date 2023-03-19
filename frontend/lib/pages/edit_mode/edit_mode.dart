import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/pages/edit_mode/widgets/society_hub_form.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../../helpers/responsiveness.dart';

class EditModePage extends StatelessWidget {
  const EditModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 28,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Flexible(
            child: Card(
                color: MyColours.navbarColour.withOpacity(0.5),
                child: Padding(
                    padding: EdgeInsets.all(20), child: SocietyHubForm())))
      ],
    );
  }
}
