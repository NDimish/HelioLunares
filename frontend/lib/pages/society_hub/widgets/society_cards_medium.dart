import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card.dart';

class SocietyHubCardsMedium extends StatelessWidget {
  const SocietyHubCardsMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
                title: "Event Count",
                value: "7",
                topColor: Colors.orange,
                //isActive: isActive,
                onTap: () {}),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
                title: "Follower Count",
                value: "7",
                topColor: Colors.lightBlue,
                //isActive: isActive,
                onTap: () {}),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          children: [
            InfoCard(
                title: "University",
                value: "King's College London",
                topColor: Colors.red,
                //isActive: isActive,
                onTap: () {}),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
                title: "About Us",
                value: "...",
                topColor: Colors.lightGreen,
                //isActive: isActive,
                onTap: () {}),
          ],
        )
      ],
    );
  }
}
