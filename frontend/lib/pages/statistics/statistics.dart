import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/pages/statistics/StatisticsPage.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import 'package:university_ticketing_system/globals.dart' as globals;
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;

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
                ? ((globals.localdataobj.getUserLevel() == 3)
                    ? const StatisticsWrapper()
                    : //Put society id here from when the user selects it
                    Statistics(societyId: Get.find<data.Society>().id))
                : const Text("Not Authenticated")),
      ],
    );
  }
}

class StatisticsWrapper extends StatelessWidget {
  const StatisticsWrapper({super.key});

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
          return Statistics(societyId: societyData.collection[0].id);
        });
  }
}
