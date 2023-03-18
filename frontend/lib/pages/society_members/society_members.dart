import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/pages/society_members/manage_members.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../../helpers/responsiveness.dart';

class SocietyMembersPage extends StatelessWidget {
  const SocietyMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradient(
      child: Column(
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
          const Expanded(child: ManageMembers())
        ],
      ),
    );
  }
}
