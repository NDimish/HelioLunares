import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card.dart';

import '../../../backend_communication/models/Society.dart';
import '../../../constants/style.dart';

class SocietyHubCardsMedium extends StatelessWidget {
  final Society society;
  const SocietyHubCardsMedium({Key? key, required this.society})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          key: const Key("RowOne"),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: InfoCard(
                    title: "Event Count",
                    value: "7",
                    topColor: Colors.black,
                    //isActive: isActive,
                    onTap: () {})),
            SizedBox(
              width: _width / 64,
            ),
            Expanded(
                child: InfoCard(
                    title: "Follower Count",
                    value: "7",
                    topColor: Colors.black,
                    //isActive: isActive,
                    onTap: () {})),
            SizedBox(
              width: _width / 64,
            ),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          key: const Key("RowTwo"),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          key: const Key("RowThree"),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: InfoCard(
                    title: "About Us",
                    value: society.description,
                    topColor: MyColours.panelBackgroundColour,
                    onTap: () {})),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
      ],
    );
  }
}
