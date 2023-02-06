import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_card.dart';

class SocietyEventCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      child: Column(
        children: [
          EventCard(
              name: "Event name 1",
              price: "£5",
              date: "14/02/23",
              location: "Bush House",
              onTap: () {}),
          SizedBox(
            height: _width / 64,
          ),
          EventCard(
              name: "Event name 2",
              price: "£6.50",
              date: "21/03/23",
              location: "Bush House",
              onTap: () {}),
          SizedBox(
            height: _width / 64,
          ),
          EventCard(
              name: "Event name 3",
              price: "£3",
              date: "16/02/23",
              location: "Bush House",
              onTap: () {}),
          SizedBox(
            height: _width / 64,
          ),
          EventCard(
              name: "Event name 4",
              price: "£5",
              date: "19/02/23",
              location: "Bush House",
              onTap: () {}),
        ],
      ),
    );
  }
}
