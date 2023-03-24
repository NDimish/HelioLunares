import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/backend_communication/societyfunctions.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/buy_ticket_screen.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/widgets/IndividualPageHeader.dart';

import '../../../backend_communication/dataCollector.dart';
import '../../../helpers/responsiveness.dart';

class EventPage extends StatefulWidget {
  final String eventName;
  final String eventDescription;
  final String eventLocation;
  final String eventDate;
  final String eventDuration;
  final double eventPrice;
  final int eventId;

  const EventPage({
    Key? key,
    required this.eventName,
    required this.eventDescription,
    required this.eventLocation,
    required this.eventDate,
    required this.eventDuration,
    required this.eventPrice,
    required this.eventId,
  }) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => dataCollector<Event>(ID: widget.eventId),
        builder: (context, child) {
          final DataP = Provider.of<dataCollector<Event>>(context);
          return Scaffold(
            appBar: AppBar(
                title: Text(
              (DataP.collection[0].title),
              style: TextStyle(fontFamily: "Arvo", fontWeight: FontWeight.bold),
            )),
            body: CustomLinearGradient(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, right: 32.0, left: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Card(
                        elevation: 0,
                        color: Colors.white.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                DataP.collection[0].title,
                                style: TextStyle(
                                    fontFamily: "Arvo",
                                    fontSize:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? 44
                                            : 72),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: ResponsiveWidget.isSmallScreen(context)
                          ? Axis.vertical
                          : Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6.0,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const IndividualPageHeader(
                                    headerName: "Location",
                                    headerIcon: Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    )),
                                const SizedBox(height: 10.0),
                                Text(
                                  DataP.collection[0].venue,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                const IndividualPageHeader(
                                    headerName: "Price",
                                    headerIcon: Icon(
                                      Icons.attach_money,
                                      color: Colors.grey,
                                    )),
                                const SizedBox(height: 10.0),
                                Text(
                                  DataP.collection[0].price.toString(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                const IndividualPageHeader(
                                    headerName: "Duration",
                                    headerIcon: Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                    )),
                                const SizedBox(height: 10.0),
                                Text(
                                  DataP.collection[0].duration.toString(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6.0,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Actions",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Arvo"),
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ElevatedButton(
                                        // -------------------------------
                                        // Buy Button
                                        /// ------------------------------
                                        onPressed: () {
                                          buyTicket(widget.eventId, widget.eventPrice);
                                          showDialog(context: context,
                                            builder: 
                                            (context) {
                                              return AlertDialog(
                                                content: const Text(
                                                  'Ticket bought!'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                      Navigator.pop(context,'Confirm'),
                                                child: const Text('Confirm'),
                                              ),
                                            ],
                                          );
                                                  },
                                          );
                                            
                                          
                                        },
                                        // -------------------------------
                                        child: const Text("Book now"),
                                      ),
                                    ),
                                    !ResponsiveWidget.isSmallScreen(context)
                                        ? const SizedBox()
                                        : ElevatedButton(
                                            onPressed: () => showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text(
                                                  'Further Information',
                                                  style: TextStyle(
                                                      fontFamily: "Arvo",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                ),
                                                content: Text(DataP
                                                    .collection[0].description),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () => {
                                                      Navigator.pop(
                                                          context, 'Return'),
                                                    },
                                                    child: const Text('Return'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            child: const Text("Details"),
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ResponsiveWidget.isSmallScreen(context)
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(
                                left: ResponsiveWidget.isMediumScreen(context)
                                    ? 30
                                    : 200,
                                right: ResponsiveWidget.isMediumScreen(context)
                                    ? 30
                                    : 200),
                            child: Card(
                              elevation: 0,
                              color: Colors.white.withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Further Information',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Divider(),
                                    Text(
                                      DataP.collection[0].description,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const Divider(),
                                  
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
