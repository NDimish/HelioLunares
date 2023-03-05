import 'package:flutter/material.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../constants/style.dart';

class EventCard extends StatelessWidget {
  final String name;
  final String price;
  final String date;
  final String location;
  final bool isActive;
  final VoidCallback onTap;

//VIEW 1:
  //name
  //price
  //date
  //location

//VIEW 2:
  //name
  //price
  //date
  //location
  //duration
  //description

//OTHER:
  //max ticket count ?
  //society email
  //view details button

  const EventCard(
      {Key? key,
      required this.onTap,
      required this.name,
      required this.price,
      required this.date,
      required this.location,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: 100,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: MyColours.panelBackgroundColour,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MyColours.textColourLight, width: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  text: name,
                  size: 20,
                  weight: FontWeight.w300,
                  colour: MyColours.textColourLight,
                ),
                CustomText(
                  text: "£$price",
                  size: 16,
                  weight: FontWeight.bold,
                  colour: MyColours.textColourDark,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.date_range),
                    CustomText(
                      text: date,
                      size: 16,
                      weight: FontWeight.bold,
                      colour: MyColours.textColourDark,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined),
                    CustomText(
                      text: location,
                      size: 16,
                      weight: FontWeight.bold,
                      colour: MyColours.textColourDark,
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
