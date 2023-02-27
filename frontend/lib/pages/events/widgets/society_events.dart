import 'dart:html';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/local_navigator.dart';
import 'package:university_ticketing_system/routing/router.dart';
import 'package:university_ticketing_system/routing/routes.dart';

import 'event_details_popup_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/models/society_event.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_card.dart';

class SocietyEventCards extends StatelessWidget {
  final List eventList = [];
  final f = 'yyyy-MM-dd hh:mm';

  buildList() {
    SocietyEvent e = SocietyEvent(
        "Event Name",
        "£3",
        DateTime.now().toString(),
        "Waterloo",
        "1 hour",
        "Lorem ipsum dolor sit amet, nonummy ligula volutpat hac integer nonummy. Suspendisse ultricies, congue etiam tellus, erat libero, nulla eleifend, mauris pellentesque. Suspendisse integer praesent vel, integer gravida mauris, fringilla vehicula lacinia non");
    eventList.add(e);
    return eventList;
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
                    onTap: () {
                      //Get.put
                      Get.put(SocietyEvent(
                          eventList[index].name,
                          eventList[index].price,
                          eventList[index].date,
                          eventList[index].location,
                          eventList[index].duration,
                          eventList[index].description));

                      navigationController
                          .navigateTo(eventDetailsPageDisplayName);
                    },
                    name: eventList[index].name,
                    price: eventList[index].price,
                    date: eventList[index].date,
                    location: eventList[index].location);
              }),
        ));
  }
}
