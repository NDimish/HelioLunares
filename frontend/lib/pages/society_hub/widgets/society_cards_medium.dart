import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/info_card.dart';

import '../../../constants/style.dart';

class SocietyHubCardsMedium extends StatelessWidget {
  const SocietyHubCardsMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(
                title: "Event Count",
                value: "7",
                topColor: Colors.black,
                //isActive: isActive,
                onTap: () {}),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
                title: "Follower Count",
                value: "7",
                topColor: Colors.black,
                //isActive: isActive,
                onTap: () {}),
            SizedBox(
              width: _width / 64,
            ),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(
                title: "University",
                value: "King's College London",
                topColor: MyColours.panelBackgroundColour,
                //isActive: isActive,
                onTap: () {}),
            SizedBox(
              width: _width / 64,
            ),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(
                title: "About Us",
                value:
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,", //value,

                topColor: Colors.lightGreen,
                onTap: () {}),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
      ],
    );
  }
}
