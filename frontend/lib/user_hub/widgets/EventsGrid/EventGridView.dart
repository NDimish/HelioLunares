import 'package:flutter/material.dart';
import 'EventGridTile.dart';

class EventsGridView extends GridView{
  EventsGridView():super(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 30,
      mainAxisSpacing: 30),
    padding: EdgeInsets.all(20),
    
    children: [
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
      EventGridTile("Test event", DateTime.now(), "Wesley"),
    ]
  );

}