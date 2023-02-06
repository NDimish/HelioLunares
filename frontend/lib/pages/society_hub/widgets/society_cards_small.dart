import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card_small.dart';

class SocietyHubCardsSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Event Count",
            value: "7",
            onTap: () {},
            isActive: true,
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Follower Count",
            value: "17",
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "University",
            value: "King's College London",
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "About Us",
            value: "...",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
