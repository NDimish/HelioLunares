import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/image_card.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_small.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_medium.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/society_cards_large.dart';

import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../../backend_communication/models/Society.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;

class SocietyHubPage extends StatelessWidget {
  final Society society = Get.find<Society>();
  SocietyHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.Event>(
                  filter: {'society_id': society.id.toString()},
                  order: data.OrderType.CHRONOLOGICAL)),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.SocietyRole>(
                  filter: {'society': society.id.toString()},
                  order: data.OrderType.CHRONOLOGICAL)),
        ],
        builder: (context, child) {
          final eventData =
              Provider.of<data.dataCollector<data.Event>>(context);
          final membersData =
              Provider.of<data.dataCollector<data.SocietyRole>>(context);

          return Container(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: ResponsiveWidget.isSmallScreen(context)
                                  ? 56
                                  : 6),
                          child: CustomText(
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? 24
                                : 40,
                            text: menuController.activeItem.value,
                            weight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    ImageCard(
                      image: NetworkImage('assets/images/logo.jpg'),
                    ),
                    if (ResponsiveWidget.isLargeScreen(context) ||
                        ResponsiveWidget.isMediumScreen(context))
                      if (ResponsiveWidget.isCustomSize(context))
                        SocietyHubCardsMedium(
                            society: society,
                            eventCount: eventData.collection.length.toString(),
                            memberCount:
                                membersData.collection.length.toString())
                      else
                        SocietyHubCardsLarge(
                            society: society,
                            eventCount: eventData.collection.length.toString(),
                            memberCount:
                                membersData.collection.length.toString())
                    else
                      SocietyHubCardsSmall(
                          society: society,
                          eventCount: eventData.collection.length.toString(),
                          memberCount:
                              membersData.collection.length.toString()),
                  ],
                ))
              ],
            ),
          );
        });
  }
}
