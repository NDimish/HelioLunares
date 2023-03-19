import 'package:flutter/material.dart';
import 'EventListTile.dart';
import 'package:flutter/src/widgets/framework.dart';

class EventsListView extends ListView {
  EventsListView(BuildContext context, {super.key})
      : super(
            padding: const EdgeInsets.all(20),
            children: [
              EventListTile(eventName: "ABC Event",price: 0, dateTime:DateTime.now(), location:"the fog is coming. the fog is coming. the fog is coming. the fog is coming.",  org:"EVIL"),
              EventListTile(eventName: "DEF Event",price: 0, dateTime:DateTime.now(), location:"Example",  org:"FBI"),
              EventListTile(eventName: "Black Market Auction UK",price: 0, dateTime:DateTime.now(), location:"Example",  org:"Marshall, Carter and Dark"),
              EventListTile(eventName: "Black Market Auction INTERNATIONAL",price: 0, dateTime:DateTime.now(), location:"Example",  org:"Marshall, Carter and Dark"),
              EventListTile(eventName: "\$7 MILLION, OPEN CONTRACT, JOHN WICK",price: 0, dateTime:DateTime.now(), location:"New York",  org:"The High Table"),
            ]
            );
  
}
