import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/backend_communication/models/society_event.dart';
import 'package:university_ticketing_system/pages/events/widgets/event_card.dart';

class SocietyEventCards extends StatelessWidget {
  final List eventList = [];
  final f = 'yyyy-MM-dd hh:mm';

  buildList() {
    SocietyEvent e = SocietyEvent(
        "Event One",
        "3",
        DateTime.now().toString(),
        "Waterloo",
        "1",
        //500 character example
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibu");
    for (int x = 0; x < 100; x++) eventList.add(e);
    return eventList;
  }

  @override
  Widget build(BuildContext context) {
    buildList();

    return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              return EventCard(
                  onTap: () {
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
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
          ),
        ));
  }
}
