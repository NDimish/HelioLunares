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
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: MyColours.panelBackgroundColour,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MyColours.textColourLight, width: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: CustomText(
                  text: name,
                  size: 20,
                  weight: FontWeight.w300,
                  colour: MyColours.textColourLight,
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.payments_outlined),
                    Flexible(
                        child: CustomText(
                      text: "£$price",
                      size: 16,
                      weight: FontWeight.w300,
                      colour: MyColours.textColourDark,
                    ))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.date_range),
                    Flexible(
                        child: CustomText(
                      text: date,
                      size: 16,
                      weight: FontWeight.w300,
                      colour: MyColours.textColourDark,
                    ))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Flexible(
                        child: CustomText(
                      text: location,
                      size: 16,
                      weight: FontWeight.w300,
                      colour: MyColours.textColourDark,
                    ))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
