import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card_small.dart';

import '../../../backend_communication/models/Society.dart';

class SocietyHubCardsSmall extends StatelessWidget {
  final Society society;
  final String eventCount;
  final String memberCount;
  const SocietyHubCardsSmall(
      {super.key,
      required this.society,
      required this.eventCount,
      required this.memberCount});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      // height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Event Count",
            value: eventCount,
            onTap: () {},
            isActive: true,
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Member Count",
            value: memberCount,
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "University",
            value: society.university.name, //"King's College London"
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "About Us",
            value: society.description,
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
        ],
      ),
    );
  }
}
