import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card.dart';

import '../../../backend_communication/models/Society.dart';

class SocietyHubCardsLarge extends StatelessWidget {
  final Society society;
  final String eventCount;
  final String memberCount;
  const SocietyHubCardsLarge(
      {Key? key,
      required this.society,
      required this.eventCount,
      required this.memberCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(children: [
      Row(key: const Key("RowOne"), children: [
        Expanded(
            child: InfoCard(
                title: "Event Count",
                value: eventCount,
                topColor: Colors.black,
                //isActive: isActive,
                onTap: () {})),
        SizedBox(
          width: _width / 64,
        ),
        Expanded(
            child: InfoCard(
                title: "Member Count",
                value: memberCount,
                topColor: Colors.black,
                //isActive: isActive,
                onTap: () {})),
        SizedBox(
          width: _width / 64,
        ),
        Expanded(
            child: InfoCard(
                title: "University",
                value: society.university.name,
                topColor: Colors.black,
                //isActive: isActive,
                onTap: () {})),
        SizedBox(
          width: _width / 64,
        ),
      ]),
      SizedBox(
        height: _width / 64,
      ),
      Row(
        key: const Key("RowTwo"),
        children: [
          Expanded(
              child: InfoCard(
                  title: "About Us",
                  value: society.description,
                  topColor: MyColours.panelBackgroundColour,
                  //isActive: isActive,
                  onTap: () {})),
          SizedBox(
            width: _width / 64,
          ),
        ],
      ),
      SizedBox(
        height: _width / 64,
      )
    ]);
  }
}
