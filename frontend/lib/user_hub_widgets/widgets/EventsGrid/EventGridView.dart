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
      EventGridTile("lib/images/blue-lock-anime.gif", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/blue-lock-gin-gagamaru.gif", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
      EventGridTile("lib/images/event.png", "Test event", DateTime.now(), "Wesley"),
    ]
  );

}