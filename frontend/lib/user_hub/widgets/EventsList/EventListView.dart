import 'package:flutter/material.dart';
import 'EventListTile.dart';

class EventsListView extends ListView {
  EventsListView(BuildContext context, {super.key})
      : super(
            padding: const EdgeInsets.all(20),
            children: [
              EventListTile(context, "Test event 1", 0, DateTime.now(), "the fog is coming. the fog is coming. the fog is coming. the fog is coming.",  "EVIL"),
              EventListTile(context, "Test event 2", 0, DateTime.now(), "ASYLUM","EVIL"),
              EventListTile(context, "Test event 3", 0, DateTime.now(), "ASYLUM","GOOD"),
              EventListTile(context, "Test event 4", 0, DateTime.now(), "ASYLUM","Marshall, Carter and Dark"),
            ]);
}
