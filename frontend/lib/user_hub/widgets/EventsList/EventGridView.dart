import 'package:flutter/material.dart';
import 'EventGridTile.dart';

class EventsGridView extends GridView {
  EventsGridView(BuildContext context, {super.key})
      : super(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 30, mainAxisSpacing: 30),
            padding: const EdgeInsets.all(20),
            children: [
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
              EventGridTile(context, "Test event", DateTime.now(), "Wesley"),
            ]);
}
