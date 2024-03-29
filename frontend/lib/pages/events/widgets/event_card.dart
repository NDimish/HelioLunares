import 'package:flutter/material.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../constants/style.dart';

class EventCard extends StatelessWidget {
  final String name;
  final double price;
  final String date;
  final String time;
  final String location;
  final bool isActive;
  final VoidCallback onTap;

  const EventCard(
      {Key? key,
      required this.onTap,
      required this.name,
      required this.price,
      required this.date,
      required this.time,
      required this.location,
      this.isActive = false})
      : super(key: key);

  String formatTime(String time) {
    DateTime dateTime = DateTime.parse("2022-03-23T$time");
    String formattedTime =
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: MyColours.panelBackgroundColour.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8)),
            height: 120,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Expanded(
                          flex: 3,
                          child: CustomText(
                            text: name,
                            size: 20,
                            weight: FontWeight.bold,
                          )),
                      Flexible(
                          child: Row(
                        children: [
                          const Icon(
                            Icons.date_range,
                            color: MyColours.textColourDark,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: CustomText(
                            text: "$date ${formatTime(time)}",
                            size: 14,
                            weight: FontWeight.w300,
                            colour: MyColours.textColourDark,
                          ))
                        ],
                      ))
                    ])),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: CustomText(
                      text: "£${price.toStringAsFixed(2)}",
                      size: 24,
                      weight: FontWeight.bold,
                      colour: MyColours.textColourDark,
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomText(
                      text: location,
                      size: 16,
                      weight: FontWeight.w300,
                      colour: MyColours.textColourDark,
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
