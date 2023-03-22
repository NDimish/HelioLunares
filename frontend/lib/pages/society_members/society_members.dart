import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/pages/society_members/manage_members.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import 'package:university_ticketing_system/globals.dart' as globals;
import '../../helpers/responsiveness.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;

class SocietyMembersPage extends StatelessWidget {
  const SocietyMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: (globals.localdataobj.getUserLevel() == 3)
                ? const ManageMembersWrapper()
                : //Put society id here from when the user selects it
                ManageMembers(societyId: 6))
      ],
    );
  }
}

class ManageMembersWrapper extends StatelessWidget {
  const ManageMembersWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.Society>(filter: {
                    'user': globals.localdataobj.getUserID().toString(),
                  }, order: data.OrderType.CHRONOLOGICAL))
        ],
        builder: (context, child) {
          final societyData =
              Provider.of<data.dataCollector<data.Society>>(context);
          return ManageMembers(societyId: societyData.collection[0].id);
        });
  }
}
