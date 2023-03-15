import 'package:flutter/material.dart';
import 'EventListTile.dart';

class EventsListView extends ListView {
  EventsListView(BuildContext context, {super.key})
      : super(
            padding: const EdgeInsets.all(20),
            children: [
              EventListTile(context, "ABC Event", 0, DateTime.now(), "the fog is coming. the fog is coming. the fog is coming. the fog is coming.",  "EVIL"),
              EventListTile(context, "DEF Event", 0, DateTime.now(), "ASYLUM","EVIL"),
              EventListTile(context, "Black Market Auction UK", 0, DateTime.now(), "ASYLUM","Marshall, Carter and Dark"),
              EventListTile(context, "Black Market Auction INTERNATIONAL", 0, DateTime.now(), "ASYLUM","Marshall, Carter and Dark"),
              EventListTile(context, "OPEN CONTRACT, JOHN WICK, \$7 MILLION", 0, DateTime.now(), "New York","The High Table"),
            ]);
}
