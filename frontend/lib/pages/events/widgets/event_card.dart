import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../constants/style.dart';

class EventCard extends StatelessWidget {
  final String name;
  final String price;
  final String date;
  final String location;
  final bool isActive;
  final VoidCallback onTap;

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
              color: MyColours.panelBackgroundColour.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
              // border: Border.all(color: Colors.transparent, width: .5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  Flexible(
                      child: CustomText(
                    text: name,
                    size: 20,
                    weight: FontWeight.bold,
                    colour: MyColours.textColourLight,
                  )),
                  Padding(padding: EdgeInsets.all(5)),
                  Flexible(
                      child: Row(
                    children: [
                      const Icon(Icons.date_range),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: date,
                        size: 16,
                        weight: FontWeight.w300,
                        colour: MyColours.textColourDark,
                      )
                    ],
                  ))
                ]),
                Flexible(
                    child: Column(
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
                )),
                Flexible(
                    child: Column(
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
                ))
              ],
            )),
      ),
    );
  }
}
