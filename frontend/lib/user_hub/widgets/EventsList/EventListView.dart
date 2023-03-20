import 'package:flutter/material.dart';
import 'EventListTile.dart';
import 'package:flutter/src/widgets/framework.dart';

// This class will need to take in data from the database
// TODO: allow data to be passed to EventListTile for
// dynamic page loading

class EventListView extends StatelessWidget {
  EventListView({super.key});

  var count = 10;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: count,
      itemBuilder: (context, index){
        return EventListTile(
          eventName: "eventName $index",
          price: 0,
          dateTime: DateTime.now(),
          location: "location $index", 
          org: "org $index");
      },
    );
  }
}
