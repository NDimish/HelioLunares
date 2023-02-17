import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_card.dart';

class SocietyEventCards extends StatelessWidget {
  final List eventList = ["Event 1", "Event 2", "Event 3"];

  void buildList() {
    for (int i = 1; i < 101; i++) {
      eventList.add("Event $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    buildList();
    return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Scaffold(
          body: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: eventList.length,
              itemBuilder: (context, index) {
                return EventCard(
                    onTap: () {},
                    name: eventList[index],
                    price: "£5",
                    date: "22/10/23",
                    location: "Bush House");
              }),
        ));
  }
}
