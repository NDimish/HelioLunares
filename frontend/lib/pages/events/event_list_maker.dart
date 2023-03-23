//TODO : Get events from backend and return a list of SocietyEvents
//final List eventList = [];

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/globals.dart' as globals;
import 'package:university_ticketing_system/pages/events/widgets/event_card.dart';

import 'package:university_ticketing_system/pages/select_society/widgets/society_card.dart';

import '../../backend_communication/models/Event.dart';
import '../../backend_communication/models/Society.dart';
import '../../routing/routes.dart'; // for using university

class EventDataLoader extends StatefulWidget {
  EventDataLoader({super.key});

  @override
  State<StatefulWidget> createState() => _EventDataLoaderState();
}

class _EventDataLoaderState extends State<EventDataLoader> {
  late Society _society;
  late Event _event;
  late List<Event> _eventList;
  late data.dataCollector<Event> allEventsDataProvider;

  final data.OrderType orderBy;

  final Map<String, String> filter;

  @override
  void initState() {
    super.initState();
    _society =
        Get.find<Society>(); // Initialize the Society variable with Get.find
  }

  _EventDataLoaderState({
    Key? key,
    this.orderBy = data.OrderType.CHRONOLOGICAL,
    this.filter = const {},
  });

  @override
  Widget build(BuildContext context) {
    var eventFilter = {'society_id': _society.user.id.toString()};
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.Event>(
                    filter: eventFilter,
                  )),
        ],
        builder: (context, child) {
          final DataP = Provider.of<data.dataCollector<data.Event>>(context);
          final eventDataProvider =
              print("NO. OF EVENTS FOUND${DataP.collection.length}");

          return Container(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: DataP.collection.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: EventCard(
                            date: DataP.collection[index].date,
                            location: DataP.collection[index].venue,
                            name: DataP.collection[index].title,
                            price: DataP.collection[index].price.toString(),
                            onTap: () {
                              //PASS THE SELECTED EVENT
                              _event = DataP.collection[index];
                              //PASS THE LIST OF EVENTS
                              //_eventList = DataP.collection;
                              //PUT THE EVENT AND LIS
                              Get.put(_event);
                              // Get.put(_eventList);
                              //CALL THE DATA PROVIDER

                              //NAVIGATE TO THE EVENT DETAILS POPUP
                              navigationController.navigateToPopupPage(
                                  eventDetailsPageDisplayName);
                            }));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                ),
              ));
        });
  }
}
